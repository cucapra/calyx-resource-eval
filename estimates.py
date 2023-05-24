from fud.exec import RunConf
from fud.exec import get_fud_output
from fud.config import Configuration
from fud.registry import Registry
from fud.main import register_stages, register_external_stages
from fud.stages import SourceType
import glob
import json
import toml
import logging as log
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
def run_resource_estimate(toml_info, cfg, results_dic, results_file):
    # overall type of input, e.g., "polybench", "calyx native examples", etc
    input_name = toml_info["name"]
    input_results = results_dic.get(input_name, {})
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
        # run fud and get json
        json_results = get_json(get_fud_output(RunConf.from_dict(given_config), cfg))
        # updating input_results and results_dic
        input_results[input_file] = json_results
        results_dic[input_name] = input_results
        # writing results_dic into file. Do this at each test file in case of
        # crash halfway thru execution
        with open(results_file, "w") as rf:
            json.dump(results_dic, rf)


def main():
    # set up the Configuration
    cfg = Configuration()
    cfg.registry = Registry(cfg)
    register_stages(cfg.registry)
    register_external_stages(cfg, cfg.registry)
    # results dictionary: test name -> { file name -> data json}
    results_dic = {}
    # name of the results file debug(or nightly)-results/moment.json
    results_file = "debug-results/" + get_moment() + ".json"
    with open("settings.toml") as f:
        toml_dict = toml.load(f)
        inputs = toml_dict["inputs"]
        for input in inputs:
            output = run_resource_estimate(input, cfg, results_dic, results_file)


if __name__ == "__main__":
    main()
