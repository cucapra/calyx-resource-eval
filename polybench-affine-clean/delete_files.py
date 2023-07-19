import argparse
import json
import os
import subprocess
import time
from datetime import datetime
from test_runner import expect_exists, find_benchmark_path


def parse_args(args):
    """
    Args:
        args: the command line arguments passed
    Returns:
        dict: a dict with the necessary arguments
    """
    res = {}
    with open(args.json, "r") as f:
        spec = json.load(f)
        res["benchmarks"] = spec["benchmarks"]
        res["mlir_files_suffix"] = spec.get("mlir_files_suffix", [])
        res["futil_files_suffix"] = spec.get("futil_files_suffix", [])
        res["data_files"] = spec.get("data_files", [])

    return res


def delete_file(file_directory, base_name, suffix, extension):
    """deletes file at [file_directory]/[base_name][suffix].[extension]
    Args:
    """
    filepath = os.path.join(file_directory, f"{base_name}{suffix}.{extension}")
    if os.path.exists(filepath):
        os.remove(filepath)
    else:
        print(f"{filepath} does not exist")


if __name__ == "__main__":
    """
    Run "python3 test-runner.py -b {benchmark_name}" to test the correctness
    of the bencmark.
    For example run "python3 test-runner.py -b 2mm" to test the 2mm benchmark
    Currently, we are *very* reliant on asusmed file paths, so if you move
    files around in `polybench-affine-clean` everything will probably break.
    """
    parser = argparse.ArgumentParser(description="Process some json file names")
    parser.add_argument("-j", "--json", type=str)
    args = parser.parse_args()

    run_settings = parse_args(args)

    cycle_counts = {}

    for benchmark in run_settings["benchmarks"]:
        benchmark_path = find_benchmark_path(benchmark)
        data_dir = os.path.join(benchmark_path, "data")
        futil_dir = os.path.join(benchmark_path, "futil-files")
        mlir_dir = os.path.join(benchmark_path, "mlir-files")
        expect_exists(data_dir)
        expect_exists(futil_dir)
        expect_exists(mlir_dir)
        for suff in run_settings["mlir_files_suffix"]:
            delete_file(mlir_dir, f"{benchmark}-main", suff, "mlir")
        for suff in run_settings["futil_files_suffix"]:
            delete_file(futil_dir, f"{benchmark}", suff, "futil")
        for file_name in run_settings["data_files"]:
            delete_file(data_dir, "", file_name, "json")
