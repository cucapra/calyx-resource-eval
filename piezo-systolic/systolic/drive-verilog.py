import json
import argparse
import subprocess
import os

if __name__ == "__main__":
    """
    Simulates systolic array based on input json settings.
    See `run-settings/*.json` for sample input json settings.
    """
    parser = argparse.ArgumentParser(description="Process some json file names")
    parser.add_argument("-j", "--json", type=str)
    args = parser.parse_args()

    with open(args.json) as f:
        json_dict = json.load(f)

    output_path = json_dict["output_dir"]
    if not os.path.exists(output_path):
        os.makedirs(output_path)

    for [input_path, size] in json_dict["input_paths"]:
        target = json_dict["target"]
        data_suffix = "unbanked" if target == "resource-estimate" else "compute"
        data_path = f"input-data/calyx-data/{size}-{data_suffix}.json"
        source = "synth-verilog" if target == "resource-estimate" else "verilog"
        out = f"{output_path}/{size}.json"
        fud_command = [
            "fud",
            "e",
            "--from",
            source,
            "-q",
            input_path,
            "--to",
            target,
            "-s",
            "verilog.data",
            data_path,
            "-o",
            out,
        ]
        for fud_flag in json_dict["fud_flags"]:
            fud_command += fud_flag

        print(f"Running fud command: {fud_command}")
        subprocess.run(fud_command)
