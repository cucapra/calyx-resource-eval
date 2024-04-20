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

    output_dir = json_dict["output_dir"]
    output_path = f"systolic-results/{output_dir}"
    if not os.path.exists(output_path):
        os.makedirs(output_path)

    # Cloning calyx twice & setting up fud is too much work
    # subprocess.run(
    #     ["sh", "configure-fud.sh", calyx_stage_name, json_dict["commit_hash"]]
    # )
    for [input_path, size] in json_dict["input_paths"]:
        target = json_dict["target"]
        data_suffix = "banked" if json_dict["banked"] else "unbanked"
        data_path = f"systolic-data/{size}-{data_suffix}.json"
        output_path = f"systolic-results/{output_dir}/{size}.json"
        fud_command = [
            "fud",
            "e",
            "--from",
            "synth-verilog",
            "-q",
            input_path,
            "--to",
            target,
            "-s",
            "verilog.data",
            data_path,
            "-o",
            output_path,
        ]
        for fud_flag in json_dict["fud_flags"]:
            fud_command += fud_flag

        print(f"Running fud command: {fud_command}")
        subprocess.run(fud_command)