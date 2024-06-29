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

    # either calyx or futil
    calyx_stage_name = json_dict["stage_name"]
    calyx_flags = json_dict["calyx_flags"]

    output_dir = json_dict["output_dir"]
    output_path = f"systolic-results/{output_dir}"
    if not os.path.exists(output_path):
        os.makedirs(output_path)

    subprocess.run(
        ["sh", "configure-fud.sh", calyx_stage_name, json_dict["commit_hash"]]
    )

    for size in json_dict["sizes"]:
        input_path = f"systolic-inputs/{size}.systolic"
        output_path = f"synth-verilog/{output_dir}/{size}.sv"
        fud_command = [
            "fud",
            "e",
            "-q",
            input_path,
            "--to",
            "synth-verilog",
            "-s",
            f"{calyx_stage_name}.flags",
            calyx_flags,
            "-o",
            output_path,
        ]
        print(" ".join(fud_command))
        subprocess.run(fud_command)
