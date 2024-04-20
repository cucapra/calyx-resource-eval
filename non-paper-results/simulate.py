from fud.exec import RunConf
from fud.exec import get_fud_output
from fud.config import Configuration, DynamicDict
from fud.registry import Registry
from fud.main import register_stages, register_external_stages
from fud.stages import SourceType
import json
import argparse
import logging as log
import time
from datetime import datetime


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


def configure_cfg(universal_configs, cfg):
    """
    Configure the `cfg` object used by fud
    Takes in `universal_configs` (the configuration info that should be applied to every file)
    """
    if "stage_dynamic_config" in universal_configs:
        for key, value in universal_configs["stage_dynamic_config"]:
            cfg[["stages"] + key.split(".")] = value


def run_fud(given_config, cfg, input_alias, results_dic, results_file, debug_mode):
    """
    Runs fud and gets json output, and then update results_dic
    If there is an error/doesn't meet timing, then record it in errors_file, but keep going
    """
    # try:
    simulation_json = get_json(get_fud_output(RunConf.from_dict(given_config), cfg))
    results_dic[input_alias] = simulation_json["cycles"]
    # write to errors_file if it doesn't meet timing
    if not debug_mode:
        dump_json(results_dic, results_file)


def run_simulation(json_info, universal_configs, results_file, cfg, debug_mode):
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
    given_config["dest"] = "dat"
    inputs = json_info["inputs"]
    results_dic = {}
    for [input_file, input_alias, input_data] in inputs:
        # discover implied source
        if not ("source" in given_config):
            source = cfg.discover_implied_states(input_file)
            log.debug(f"Inferred source state: {source}")
            given_config["source"] = source
        given_config["input_file"] = input_file
        given_config["through"] = ["verilog"]
        cfg[["stages", "verilog", "data"]] = input_data

        # runs fud and updates results_dic and results_file
        run_fud(given_config, cfg, input_alias, results_dic, results_file, debug_mode)

    end_time = time.time()
    print(str((end_time - start_time) / 60) + " minutes")


def main():
    """
    arg -s/--sequential makes script run sequentially instead of in parallel
    arg -d/--debug makes script not actually write to any files, just runs through
    arg -j/--json means we read from a json to see which input files we run (if not given,
    there is a default settings.json that we use)
    """
    # set up arg parser
    parser = argparse.ArgumentParser(description="Process args for resource estimates")
    parser.add_argument("-d", "--debug", action="store_true")
    parser.add_argument("-j", "--json")
    args = parser.parse_args()
    # set up the Configuration
    cfg = Configuration()
    cfg.registry = Registry(cfg)
    register_stages(cfg.registry)
    register_external_stages(cfg, cfg.registry)

    json_file = args.json

    with open(json_file) as f:
        json_dict = json.load(f)
        # save settings json so we know what we ran
        universal_configs = json_dict.get("universal_configs", {})
        # configure the cfg object
        configure_cfg(universal_configs, cfg)
        for input in json_dict["inputs"]:
            results_file = input["results_file"]
            run_simulation(
                input,
                universal_configs,
                results_file,
                cfg,
                args.debug,
            )


if __name__ == "__main__":
    main()
