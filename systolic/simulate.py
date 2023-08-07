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
    output_dir = json_dict["output_dir"]
    output_path = f"systolic-results/{output_dir}"
    if not os.path.exists(output_path):
        os.makedirs(output_path)

    subprocess.run(
        ["sh", "configure-fud.sh", json_dict["stage_name"], json_dict["commit_hash"]]
    )

    for size in json_dict["sizes"]:
        data_path = f"systolic-data/{size}-{data_suffix}.json"
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
            "-o",
            output_path,
        ]
        if json_dict["through-verilog-flag"]:
            fud_command += ["--through", "verilog"]

        subprocess.run(fud_command)
