import json
import argparse
import subprocess
import os

if __name__ == "__main__":
    """
    Simulates systolic array based on input json settings.
    """
    parser = argparse.ArgumentParser(description="Process some json file names")
    parser.add_argument("-j", "--json", type=str)
    args = parser.parse_args()

    with open(args.json) as f:
        json_dict = json.load(f)

    fud_target = json_dict["target"]
    fud_flags = json_dict["fud_flags"]
    # dirs lets us know which directory to look for the benchmarks, and
    # which directory we should put the results in.
    dirs = json_dict["dirs"]

    input_data_files = os.listdir("input-data")

    for dir_tuple in dirs:
        source_dir = dir_tuple[0]
        assert os.path.exists(source_dir), f"Invliad Source Directory: {source_dir}"
        results_dir = dir_tuple[1]
        # Make the results directory if it doesn't exist
        if not os.path.exists(results_dir):
            os.makedirs(results_dir)
        for source_file in os.listdir(source_dir):
            source_path = os.path.join(source_dir, source_file)
            results_path = os.path.join(results_dir, source_file + ".json")
            fud_command = [
                "fud",
                "e",
                "-q",
                source_path,
                "--to",
                fud_target,
                "-o",
                results_path,
            ]
            for fud_flag in json_dict["fud_flags"]:
                fud_command += fud_flag
            if fud_target == "dat":
                size = source_file.split(".")[0]
                fud_command += ["-s", "verilog.data", f"input-data/{size}.json"]

            print(f"Running fud command: {fud_command}")
            # subprocess.run(fud_command)
