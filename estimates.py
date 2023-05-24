from fud.exec import RunConf
from fud.exec import get_fud_output
from fud.config import Configuration
from fud.registry import Registry
from fud.main import register_stages, register_external_stages
from fud.stages import SourceType
import glob
import json
import argparse
import toml
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


# runs test given:
# `input_info` (the data we read from the toml file)
# configuration `cfg` (an object used by fud)
# results_file is the file to write the results into
# results_dic is the dic that is written to results_file
def run_resource_estimate(toml_info, cfg, results_file):
    results_dic = {}
    # the .toml file gives us some of the configuration, but we
    # still need to fill out the rest of the fud run configuration
    given_config = toml_info["config"]
    # dest should be "resource-estimate" (unless we want some sort of quicker
    # dest for debugging and stuff)
    given_config["dest"] = dest
    input_files = flat_map(glob.glob, toml_info["paths"])
    for input_file in input_files:
        # discover implied source
        if not ("source" in given_config):
            source = cfg.discover_implied_states(input_file)
            log.debug(f"Inferred source state: {source}")
            given_config["source"] = source
        given_config["input_file"] = input_file
        # run fud, get json, and update reesults_dic
        results_dic[input_file] = get_json(
            get_fud_output(RunConf.from_dict(given_config), cfg)
        )
        # writing results_dic into file. Do this at each test file in case of
        # crash halfway thru execution
        with open(results_file, "w") as rf:
            json.dump(results_dic, rf)


# takes in arg -s/--sequential
# if true, then it runs sequential instead of in parallel
def main():
    start_time = time.time()
    parser = argparse.ArgumentParser(description="Process some integers.")
    parser.add_argument("-s", "--sequential", action="store_true")
    args = parser.parse_args()
    # set up the Configuration
    cfg = Configuration()
    cfg.registry = Registry(cfg)
    register_stages(cfg.registry)
    register_external_stages(cfg, cfg.registry)
    # results dictionary: test name -> { file name -> data json}
    # name of the results file debug(or nightly)-results/moment.json
    results_folder = "debug-results/" + get_moment() + ""
    if os.path.exists(results_folder):
        shutil.rmtree(results_folder)
    os.makedirs(results_folder)
    threads = []

    if not args.sequential:
        with open("settings.toml") as f:
            toml_dict = toml.load(f)
            inputs = toml_dict["inputs"]
            for input in inputs:
                results_file = os.path.join(results_folder, input["name"] + ".json")
                thread = threading.Thread(
                    target=run_resource_estimate,
                    args=(
                        input,
                        cfg,
                        results_file,
                    ),
                )
                threads.append(thread)
                thread.start()
        for thread in threads:
            thread.join()
    else:
        with open("settings.toml") as f:
            toml_dict = toml.load(f)
            inputs = toml_dict["inputs"]
            for input in inputs:
                results_file = os.path.join(results_folder, input["name"] + ".json")
                run_resource_estimate(input, cfg, results_file)

    end_time = time.time()

    with open(f"""{results_folder}/time_consumed.txt""", "w") as file:
        file.writelines(str(end_time - start_time))


if __name__ == "__main__":
    main()
