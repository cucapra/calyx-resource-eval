import argparse
import json
import os
import subprocess
import time
from datetime import datetime

from utilities.comp_json import compare_jsons, get_cycle_count


def find_benchmark_path(bench_name):
    """
    Searches for a folder with name bench_name in the current directory
    Ignores directories with "polybench-c" in their name
    Args:
        bench_name (string): the name of the benchmark
    Raises:
        Exception: if there is not exactly 1 folder (excluding directories w/
        "polybench-c" in their name) that has bench_name in the folder name
    """
    benchmark_path = None
    for root, dirs, files in os.walk("."):
        for dir_name in dirs:
            pathname = os.path.join(root, dir_name)
            if "polybench-c" in pathname or "incomplete" in pathname:
                # We skip the files with the original Polybench C code
                continue
            full_file_name = os.path.basename(pathname)
            file_name = os.path.splitext(full_file_name)[0]
            if bench_name == file_name:
                if benchmark_path is not None:
                    raise Exception(
                        f"Confused about which directory to target for {bench_name}.\
                      Found both {benchmark_path} and {pathname}"
                    )
                else:
                    benchmark_path = pathname
    if benchmark_path is None:
        raise Exception(
            f"Couldn't find a target for {bench_name}. No files had {bench_name} in it."
        )
    return benchmark_path


def expect_exists(pathname):
    """Raises an error if the path does not exist
    Args:
        pathname (str): a pathname
    """
    if not os.path.exists(pathname):
        error_msg = f"expected file {pathname} but it doesn't exist"
        raise Exception(error_msg)


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
        res["gen_futil"] = spec.get("gen_futil", True)
        res["gen_init"] = spec.get("gen_init", True)
        res["run_calyx"] = spec.get("run_calyx", True)
        res["run_c_impl"] = spec.get("run_c_impl", True)
        res["calyx_flags"] = spec.get("calyx_flags", "")
        res["futil_file_suffix"] = spec.get("futil_file_suffix", "")
        res["calyx_results_file"] = spec.get("calyx_results_file", "calyx-results.json")
        res["cycle_count_results"] = spec.get("cycle_count_results")
        res["c_results_file"] = spec.get("c_results_file", "c-results.json")
        res["init_file"] = spec.get("init_file", "init.json")
        res["mlir_file_suffix"] = spec.get("mlir_file_suffix", "-main")
        res["check_results"] = spec.get("check_results", True)
        res["data_size"] = spec.get("data_size", "MINI_DATASET")
    return res


def run_benchmark(run_settings, benchmark_name, cycle_counts):
    """runs benchmark_name based on run_settings dictionary"""
    benchmark_path = find_benchmark_path(benchmark_name)

    # assert that a data & futil-files folder exists
    expect_exists(os.path.join(benchmark_path, "data"))
    expect_exists(os.path.join(benchmark_path, "futil-files"))
    futil_file_path = os.path.join(
        benchmark_path,
        "futil-files",
        benchmark_name + run_settings["futil_file_suffix"] + ".futil",
    )
    init_data_path = os.path.join(benchmark_path, "data", run_settings["init_file"])
    calyx_results_path = os.path.join(
        benchmark_path, f"data/{run_settings['calyx_results_file']}"
    )
    c_results_path = os.path.join(
        benchmark_path, "data", run_settings["c_results_file"]
    )
    print_json_c_file = os.path.join(benchmark_path, "print-json.cpp")

    # generate the .futil file
    if run_settings["gen_futil"]:
        with open(futil_file_path, "w") as futil_file:
            subprocess.call(
                [
                    "sh",
                    "utilities/gen-calyx.sh",
                    os.path.join(
                        benchmark_path,
                        "mlir-files",
                        benchmark_name + run_settings["mlir_file_suffix"],
                    ),
                    "-o",
                    f"{futil_file_path}",
                ],
                stdout=futil_file,
            )

    # generate the initial json
    if run_settings["gen_init"]:
        with open(init_data_path, "w") as init_file:
            # need to do print_json_c_file[2:] to get rid of the ./ in the pathname
            # probably a better way to do this
            subprocess.call(
                [
                    "./print-json.sh",
                    "-r",
                    "0",
                    "-p",
                    f"{print_json_c_file[2:]}",
                    "-s",
                    run_settings["data_size"],
                ],
                stdout=init_file,
            )

    # run the .futil file
    if run_settings["run_calyx"]:
        expect_exists(init_data_path)
        expect_exists(futil_file_path)
        calyx_flags = run_settings["calyx_flags"]
        subprocess.run(
            [
                "fud",
                "e",
                "--to",
                "dat",
                "--through",
                "verilog",
                "--from",
                "calyx",
                "-s",
                "verilog.data",
                f"{init_data_path}",
                "-s",
                "calyx.flags",
                f"{calyx_flags}",
                "-o",
                f"{calyx_results_path}",
                f"{futil_file_path}",
            ]
        )

    # run the cpp implementation
    if run_settings["run_c_impl"]:
        expect_exists(print_json_c_file)
        with open(c_results_path, "w") as c_output_file:
            subprocess.call(
                [
                    "./print-json.sh",
                    "-r",
                    "1",
                    "-p",
                    f"{print_json_c_file[2:]}",
                    "-s",
                    run_settings["data_size"],
                ],
                stdout=c_output_file,
            )

    if run_settings["check_results"]:
        expect_exists(c_results_path)
        with open("verify_results.txt", "a") as f:
            f.write(compare_jsons(c_results_path, calyx_results_path))
        cycle_counts[benchmark_name] = get_cycle_count(calyx_results_path)


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
        start_time = time.time()
        run_benchmark(run_settings, benchmark, cycle_counts)
        end_time = time.time()
        with open(os.path.join("wall-time", "wall-time.txt"), "a") as file:
            file.writelines(
                str(f"{benchmark}:" + (end_time - start_time) / 60) + " minutes\n"
            )

    if run_settings["cycle_count_results"] is not None:
        expect_exists("cycle-counts")
        with open(
            os.path.join("cycle-counts", run_settings["cycle_count_results"]), "w"
        ) as f:
            f.write(json.dumps(cycle_counts))
