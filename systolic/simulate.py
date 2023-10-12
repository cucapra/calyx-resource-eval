import json
import argparse
import subprocess
import os

if __name__ == "__main__":
    """ """
    parser = argparse.ArgumentParser(description="Process some json file names")
    parser.add_argument("-j", "--json", type=str)
    args = parser.parse_args()

    with open(args.json) as f:
        json_dict = json.load(f)

    calyx_stage_name = json_dict["stage_name"]  # either calyx or futil
    calyx_flags = json_dict.get("calyx_flags", "")
    output_dir = json_dict["output_dir"]
    output_path = f"systolic-results/{output_dir}"
    if not os.path.exists(output_path):
        os.makedirs(output_path)

    # Cloning Calyx & setting up fud is too much work
    # subprocess.run(
    #     ["sh", "configure-fud.sh", calyx_stage_name, json_dict["commit_hash"]]
    # )
    for size in json_dict["sizes"]:
        target = json_dict["target"]
        data_suffix = "banked" if json_dict["banked"] else "unbanked"
        data_path = f"systolic-data/{size}-{data_suffix}.json"
        input_path = f"{json_dict['input_dir']}/{size}.systolic"
        output_path = f"systolic-results/{output_dir}/{size}.json"
        fud_command = [
            "fud",
            "e",
            "-q",
            input_path,
            "--to",
            target,
            "-s",
            "verilog.data",
            data_path,
            "-s",
            f"{calyx_stage_name}.flags",
            calyx_flags,
            "-o",
            output_path,
        ]
        for fud_flag in json_dict["fud_flags"]:
            fud_command += ["--through", "verilog"]

        subprocess.run(fud_command)
