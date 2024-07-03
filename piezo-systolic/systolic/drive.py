import json
import argparse
import subprocess
import os
import numpy as np


def check_output(tl, td, ll, ld, post_op, json_file, flat=False):
    left = np.zeros((ll, ld), "f")
    top = np.zeros((td, tl), "f")
    json_data = json.load(open(json_file))["memories"]

    for r in range(ll):
        for c in range(ld):
            left[r][c] = json_data[f"l{r}"][c]

    for r in range(td):
        for c in range(tl):
            top[r][c] = json_data[f"t{c}"][r]

    matmul_result = np.matmul(left, top)
    if post_op == "leaky-relu":
        matmul_result = np.where(matmul_result > 0, matmul_result, matmul_result * 0.01)
    # We have two different ReLU implementations
    elif post_op == "relu" or post_op == "relu-dynamic":
        matmul_result = np.where(matmul_result > 0, matmul_result, 0)

    if not flat:
        res = []
        for r in range(ll):
            res.append(list(map(float, json_data[f"out_mem_{r}"])))
    else:
        res = list(json_data["out_mem"])

    json_result = np.array(res)

    if flat:
        matmul_result = matmul_result.flatten()

    # We only check close since we are using fixedpoint (whereas this is float)
    if np.isclose(matmul_result, json_result, atol=1e-3).all():
        print("Correct")
    else:
        print("Incorrect\n. Should have been:\n")
        print(matmul_result)
        print("\nBut got:\n")
        print(json_result)


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
        assert os.path.exists(source_dir), f"Invalid Source Directory: {source_dir}"
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
            subprocess.run(fud_command)
            if fud_target == "dat":
                # Check that the result is correct
                size = int(source_file.split(".")[0])
                with open(source_path, "r") as file:
                    json_data = json.load(file)
                    post_op = json_data.get("post_op", "")
                check_output(
                    tl=size,
                    td=size,
                    ll=size,
                    ld=size,
                    post_op=post_op,
                    json_file=results_path,
                )
