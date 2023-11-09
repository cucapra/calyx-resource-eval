from fud.exec import RunConf
from fud.exec import get_fud_output
from fud.config import Configuration
from fud.registry import Registry
from fud.main import register_stages, register_external_stages
from fud.stages import SourceType
import glob
import json
import argparse
import logging as log
import os
import threading
import shutil
import time
from datetime import datetime
import signal


# Timeout code from: https://stackoverflow.com/questions/492519/timeout-on-a-function-call
# Register an handler for the timeout
def handler(signum, frame):
    print("Forever is over!")
    raise Exception("end of time")


def flat_map(f, xs):
    """
    https://dev.to/turbaszek/flat-map-in-python-3g98
    """
    return [y for ys in xs for y in f(ys)]


def get_moment():
    """
    gets the current "moment" in time: "year-month-day@hour:minute:second"
    """
    return datetime.today().strftime("%Y-%m-%d@%H:%M:%S")


def get_json(output):
    """
    turns a fud output (of type `SourceType`) into a json
    """
    return json.loads(output.convert_to(SourceType.String).data)


def dump_json(dict, json_path):
    """
    dumps dict into json_path
    """
    with open(f"""{json_path}""", "w") as f:
        json.dump(dict, f)


def write_to_file(file_dest, s):
    """
    adds string s to file_dest (also adds a new line)
    """
    with open(file_dest, "a") as fd:
        fd.write(s)
        fd.write("\n")


def record_version_info(results_folder):
    """
    records commit versions of Calyx and Dahlia that we got our results on
    Note: this assumes that ./configure-fud.sh has written the version info
    into version-info/calyx-version.txt and version-info/dahlia-version.txt
    """
    version_dict = {}
    with open("tmp-version-info/calyx-version.txt", "r") as f:
        version_dict["calyx"] = f.read()
    with open("tmp-version-info/dahlia-version.txt", "r") as f:
        version_dict["dahlia"] = f.read()
    dump_json(version_dict, f"""{results_folder}/version_info.json""")


def configure_cfg(universal_configs, cfg):
    """
    Configure the `cfg` object used by fud
    Takes in `universal_configs` (the configuration info that should be applied to every file)
    """
    if "stage_dynamic_config" in universal_configs:
        for key, value in universal_configs["stage_dynamic_config"]:
            cfg[["stages"] + key.split(".")] = value


def run_fud(
    given_config,
    cfg,
    errors_file,
    input_file,
    results_dic,
):
    """
    Runs fud and gets json output, and then update results_dic
    If there is an error/doesn't meet timing, then record it in errors_file, but keep going
    """
    # Define a timeout for your function
    signal.alarm(1200)
    try:
        resource_usage_json = get_json(
            get_fud_output(RunConf.from_dict(given_config), cfg)
        )
        # write to errors_file if it doesn't meet timing
        if resource_usage_json["meet_timing"] != 1:
            write_to_file(errors_file, f"""{input_file} does not meet timing""")
        results_dic[input_file] = resource_usage_json
    except:
        # write to errors_file if we have some sort of error while getting resource
        # usage
        write_to_file(
            errors_file,
            f"""error when retrieving resource estimates for {input_file}""",
        )
    # Cancel the timer
    signal.alarm(0)


def run_resource_estimate(
    json_info, universal_configs, cfg, results_file, errors_file, debug_mode
):
    """
    runs test given:
    `json_info` (the data we read from the json file)
    configuration `cfg` (an object used by fud)
    results_file is the file to write the results into
    errors_file is the file to write errors into
    debug_mode means that we don't write results into a file
    """
    # keep track of how long it takes to get resource estimates
    start_time = time.time()
    # the .json file/universal_configs may give us some of the configuration, but we
    # still need to fill out the rest of the fud run configuration
    given_config = json_info.get("config", {})
    given_config.update(universal_configs.get("config", {}))
    given_config["dest"] = "resource-estimate"
    input_files = flat_map(glob.glob, json_info["paths"])
    # results_dic holds the results
    results_dic = {}
    for input_file in input_files:
        # discover implied source
        if not ("source" in given_config):
            source = cfg.discover_implied_states(input_file)
            log.debug(f"Inferred source state: {source}")
            given_config["source"] = source
        given_config["input_file"] = input_file
        # runs fud and updates results_dic and results_file
        run_fud(
            given_config,
            cfg,
            errors_file,
            input_file,
            results_dic,
        )
        # writing results_dic into file. Do this after each test file in case of
        # crash halfway thru execution, since we still want some results
        if not debug_mode:
            dump_json(results_dic, results_file)

    end_time = time.time()
    # if not in debug mode, record how long it took to get results
    if not debug_mode:
        with open(f"""{os.path.splitext(results_file)[0]}.txt""", "w") as file:
            file.writelines(str((end_time - start_time) / 60) + " minutes")


def main():
    """
    arg -s/--sequential makes script run sequentially instead of in parallel
    arg -d/--debug makes script not actually write to any files, just runs through
    arg -j/--json means we read from a json to see which input files we run (if not given,
    there is a default settings.json that we use)
    """
    # Register the signal function handler
    signal.signal(signal.SIGALRM, handler)
    # set up arg parser
    parser = argparse.ArgumentParser(description="Process args for resource estimates")
    parser.add_argument("-s", "--sequential", action="store_true")
    parser.add_argument("-d", "--debug", action="store_true")
    parser.add_argument("-j", "--json")
    args = parser.parse_args()
    # set up the Configuration
    cfg = Configuration()
    cfg.registry = Registry(cfg)
    register_stages(cfg.registry)
    register_external_stages(cfg, cfg.registry)

    threads = []

    # default json file to read from is settings.json, but if arg.json is passed,
    # then set json file to arg.json
    json_file = "settings/settings.json"
    if args.json is not None:
        json_file = args.json

    with open(json_file) as f:
        json_dict = json.load(f)
        # save settings json so we know what we ran
        results_folder = "debug-results/" + get_moment() + ""
        if json_dict.get("results_folder") is not None:
            results_folder = json_dict["results_folder"]
        if not args.debug:
            # make results_folder, remove it and make new one if it already exists
            if os.path.exists(results_folder):
                shutil.rmtree(results_folder)
            os.makedirs(results_folder)
        if not args.debug:
            dump_json(json_dict, f"""{results_folder}/settings_ran.json""")
        universal_configs = json_dict.get("universal_configs", {})
        # configure the cfg object
        configure_cfg(universal_configs, cfg)
        for input in json_dict["inputs"]:
            # for each type of input (e.g., polybench, ntt, etc.) we write results into
            # a different file, and have an errors file to report errors
            results_file = os.path.join(results_folder, input["name"] + ".json")
            errors_file = os.path.join(results_folder, input["name"] + "-errors.txt")
            if not args.sequential:
                # default is to not run sequentially, and create a thread to run
                # each input. This will help us get our inputs faster
                thread = threading.Thread(
                    target=run_resource_estimate,
                    args=(
                        input,
                        universal_configs,
                        cfg,
                        results_file,
                        errors_file,
                        args.debug,
                    ),
                )
                threads.append(thread)
                thread.start()
            else:
                # otherwise, run sequentially
                run_resource_estimate(
                    input, universal_configs, cfg, results_file, errors_file, args.debug
                )
    if not args.sequential:
        # wait for threads to finish
        for thread in threads:
            thread.join()
    if not args.debug:
        # record calyx/dahlia version info into results_folder
        record_version_info(results_folder)


if __name__ == "__main__":
    main()
