from fud.exec import RunConf
from fud.exec import get_fud_output
from fud.config import Configuration
from fud.registry import Registry
from fud.main import register_stages, register_external_stages
from fud.stages import SourceType
import glob
import json
import subprocess
import argparse
import logging as log
import os
import threading
import shutil
import time
from datetime import datetime

dest = "resource-estimate"


# https://dev.to/turbaszek/flat-map-in-python-3g98
def flat_map(f, xs):
    return [y for ys in xs for y in f(ys)]


# gets the current "moment" in time: "year-month-day@hour:minute:second"
def get_moment():
    return datetime.today().strftime("%Y-%m-%d@%H:%M:%S")


# turns a fud output (of type `SourceType``) into a json
def get_json(output):
    return json.loads(output.convert_to(SourceType.String).data)


# turns a fud output (of type `SourceType``) into a string
def get_string(output):
    return output.convert_to(SourceType.String).data


# runs test given:
# `json_info` (the data we read from the json file)
# configuration `cfg` (an object used by fud)
# results_file is the file to write the results into
# debug_mode means that we don't save results
# use_futil means "calyx-or-futil" resolves to "futil" instead of "calyx" (this is
# because different versions of calyx fud use calyx vs. futil as name of stage)
def run_resource_estimate(json_info, cfg, results_file, debug_mode):
    start_time = time.time()
    results_dic = {}
    # resove stage_dynamic_config settings given in json
    if "stage_dynamic_config" in json_info:
        for key, value in json_info["stage_dynamic_config"]:
            cfg[["stages"] + key.split(".")] = value
    # the .json file may give us some of the configuration, but we
    # still need to fill out the rest of the fud run configuration
    given_config = json_info["config"] if "config" in json_info else {}
    # dest should be "resource-estimate" (unless we want some sort of quicker
    # dest for debugging and stuff)
    given_config["dest"] = dest
    input_files = flat_map(glob.glob, json_info["paths"])
    for input_file in input_files:
        # discover implied source
        if not ("source" in given_config):
            source = cfg.discover_implied_states(input_file)
            log.debug(f"Inferred source state: {source}")
            given_config["source"] = source
        given_config["input_file"] = input_file
        # run fud, get json, and update reesults_dic
        try:
            results_dic[input_file] = get_json(
                get_fud_output(RunConf.from_dict(given_config), cfg)
            )
            # writing results_dic into file. Do this at each test file in case of
            # crash halfway thru execution (and we still want some results)
            if not debug_mode:
                with open(results_file, "w") as rf:
                    json.dump(results_dic, rf)
        except:
            print(input_file)
    end_time = time.time()
    # if not in debug mode, record how long it took to get results
    if not debug_mode:
        with open(f"""{os.path.splitext(results_file)[0]}.txt""", "w") as file:
            file.writelines(str((end_time - start_time) / 60) + " minutes")


# arg -s/--sequentia makes script run sequentially instead of in parallel
# arg -d/--debug makes script not actually write to any files, just runs through
# arg -q/--quick means we run fewer benchmarks (helpful for debugging/testing the script)
def main():
    # set up arg parser
    parser = argparse.ArgumentParser(description="Process args for resource estimates")
    parser.add_argument("-s", "--sequential", action="store_true")
    parser.add_argument("-d", "--debug", action="store_true")
    parser.add_argument("-q", "--quick", action="store_true")
    parser.add_argument("-p", "--polybench", action="store_true")
    args = parser.parse_args()
    # set up the Configuration
    cfg = Configuration()
    cfg.registry = Registry(cfg)
    register_stages(cfg.registry)
    register_external_stages(cfg, cfg.registry)
    # make results_folder, remove it and make new one if it already exists
    results_folder = "debug-results/" + get_moment() + ""
    if not args.debug:
        if os.path.exists(results_folder):
            shutil.rmtree(results_folder)
        os.makedirs(results_folder)
    threads = []

    # read from:
    # settings.json to run all benchmarks
    # settings-quick.json runs very few benchmarks
    # settings-polybench.json to only run polybench benchmarks
    if args.polybench:
        json_file = "settings-polybench.json"
    elif args.quick:
        json_file = "settings-quick.json"
    else:
        json_file = "settings.json"

    with open(json_file) as f:
        json_dict = json.load(f)
        for input in json_dict["inputs"]:
            # for each type of input (e.g., polybench, ntt, etc.) we write results into
            # a different file
            results_file = os.path.join(results_folder, input["name"] + ".json")
            if not args.sequential:
                # default is to not run sequentially, and create a thread to run
                # each input
                thread = threading.Thread(
                    target=run_resource_estimate,
                    args=(input, cfg, results_file, args.debug),
                )
                threads.append(thread)
                thread.start()
            else:
                # otherwise, run sequentially
                run_resource_estimate(input, cfg, results_file, args.debug)
    if not args.sequential:
        # wait for threads to finish
        for thread in threads:
            thread.join()

    # if not in debug mode, we want to record commit versions of Calyx and Dahlia
    # that we got our results on
    if not args.debug:
        version_dict = {}
        with open("version-info/calyx-version.txt", "r") as f:
            version_dict["calyx"] = f.read()
        with open("version-info/dahlia-version.txt", "r") as f:
            version_dict["dahlia"] = f.read()
        with open(f"""{results_folder}/version_info.json""", "w") as f:
            json.dump(version_dict, f)


if __name__ == "__main__":
    main()
