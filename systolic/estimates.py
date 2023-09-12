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

    calyx_stage_name = json_dict["calyx_stage_name"]
    calyx_flags = json_dict.get("calyx_flags", None)
    commit_hash = json_dict["commit_hash"]
    verilog_files_path = json_dict.get("verilog_file_path", None)

    if verilog_files_path is None:
        subprocess.run(
            ["sh", "configure-fud.sh", calyx_stage_name, json_dict["commit_hash"]]
        )

    output_dir = json_dict["output_dir"]
    output_dir_path = f"resource-estimates/{output_dir}"
    if not os.path.exists(output_dir_path):
        os.makedirs(output_dir_path)

    for size in json_dict["sizes"]:
        if verilog_files_path is not None:
            input_path = f"{verilog_files_path}/{size}.sv"
        else:
            input_path = f"systolic-inputs/{size}.systolic"
        output_path = f"{output_dir_path}/{size}.json"
        fud_command = [
            "fud",
            "e",
            "-q",
            input_path,
            "--to",
            "resource-estimate",
            "-s",
            "synth-verilog.tcl",
            "synth.tcl",
            "-o",
            output_path,
        ]
        if verilog_files_path is not None:
            fud_command += ["--from", "synth-verilog"]
        elif calyx_flags is not None:
            fud_command += [
                "-s",
                f"calyx.flags",
                calyx_flags,
            ]
        print(" ".join(fud_command))
        subprocess.run(fud_command)
