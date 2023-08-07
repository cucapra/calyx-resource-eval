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

    data_suffix = "banked" if json_dict["banked"] else "unbanked"
    calyx_stage_name = json_dict["stage_name"]  # either calyx or futil
    calyx_flags = json_dict.get("calyx_flags", "")
    output_dir = json_dict["output_dir"]
    output_path = f"systolic-results/{output_dir}"
    if not os.path.exists(output_path):
        os.makedirs(output_path)

    subprocess.run(
        ["sh", "configure-fud.sh", calyx_stage_name, json_dict["commit_hash"]]
    )

    for size in json_dict["sizes"]:
        data_path = f"systolic-data/{size}-{data_suffix}.json"
        if "futil_file_path" in json_dict:
            futil_file_path = json_dict["futil_file_path"]
            input_path = f"{futil_file_path}/{size}.futil"
        else:
            input_path = f"systolic-inputs/{size}.systolic"
        output_path = f"systolic-results/{output_dir}/{size}.json"
        fud_command = [
            "fud",
            "e",
            "-q",
            input_path,
            "--to",
            "dat",
            "-s",
            "verilog.data",
            data_path,
            "-s",
            f"{calyx_stage_name}.flags",
            calyx_flags,
            "-o",
            output_path,
        ]
        if json_dict["through-verilog-flag"]:
            fud_command += ["--through", "verilog"]
        if "futil_file_path" in json_dict:
            fud_command += ["--from", "calyx"]

        subprocess.run(fud_command)
