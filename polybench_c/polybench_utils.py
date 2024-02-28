import argparse
import json
import os
import subprocess
import time
from datetime import datetime

from utilities.comp_json import compare_jsons, get_cycle_count


def expect_exists(pathname):
    """Raises an error if the path does not exist
    Args:
        pathname (str): a pathname
    """
    if not os.path.exists(pathname):
        raise FileNotFoundError(f"The path '{pathname}' does not exist.")


def find_c_benchmark_path(bench_name):
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
        res["gen_calyx_files"] = spec.get("gen_calyx_files", False)
        res["gen_data_init"] = spec.get("gen_data_init", False)
        res["gen_data_calyx"] = spec.get("gen_data_calyx", False)
        res["gen_data_c"] = spec.get("gen_data_c", False)
        res["calyx_flags"] = spec.get("calyx_flags", "")
        res["check_results"] = spec.get("check_results", False)
    return res


def run_benchmark(run_settings, benchmark_path, benchmark_name, cycle_counts):
    """runs benchmark_name based on run_settings dictionary"""
    c_file_path = os.path.join(benchmark_path, f"{benchmark_name}-main.c")
    expect_exists(c_file_path)

    # assert that a data & futil-files folder exists
    init_data_path = os.path.join("data_init", f"{benchmark_name}.json")
    calyx_results_path = os.path.join("data_calyx", f"{benchmark_name}.json")
    c_results_path = os.path.join("data_expected", f"{benchmark_name}.json")
    json_generator = os.path.join(benchmark_path, "generate-json.cpp")

    # Generate the .futil file
    if run_settings["gen_calyx_files"]:
        calyx_generator = os.path.join("utilities", "gen-calyx.sh")
        expect_exists(calyx_generator)
        calyx_file_path = os.path.join(
            "../benchmarks", "polybench-scf", f"{benchmark_name}.futil"
        )
        # Open the JSON file
        with open(
            os.path.join("utilities", "benchmark_metadata.json"), "r"
        ) as json_file:
            # Load JSON data into a dictionary
            bounded = "1" if benchmark_name in json.load(json_file)["bounded"] else "0"
        with open(calyx_file_path, "w+") as futil_file:
            subprocess.call(
                [
                    "sh",
                    calyx_generator,
                    os.path.join(benchmark_path, benchmark_name),
                    bounded,
                ],
                stdout=futil_file,
            )

    # generate the initial json
    if run_settings["gen_data_init"]:
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
    if run_settings["gen_data_calyx"]:
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
                "verilog.cycle_limit",
                "2000000000",
                "-s",
                "calyx.flags",
                f"{calyx_flags}",
                "-o",
                f"{calyx_results_path}",
                f"{futil_file_path}",
            ]
        )

    # run the cpp implementation
    if run_settings["gen_data_c"]:
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

    # compare the calyx run and the cpp run
    if run_settings["check_results"]:
        expect_exists(c_results_path)
        with open(
            os.path.join("check_results", run_settings["check_results_file"]), "a"
        ) as f:
            # XXX(Caleb):ignore certain memories for annoying reason
            # These are 1d memories that when you pass as arguments in c it
            # they don't change value to the outside world
            if benchmark_name == "durbin":
                ignore = ["mem_3", "mem_4", "mem_5"]
            elif benchmark_name == "ludcmp":
                ignore = ["mem_4"]
            else:
                ignore = []
            f.write(compare_jsons(c_results_path, calyx_results_path, ignore))
        cycle_counts[benchmark_name] = get_cycle_count(calyx_results_path)


if __name__ == "__main__":
    """
    Run "python3 test-runner.py -b {benchmark_name}" to test the correctness
    of the bencmark.
    For example run "python3 test-runner.py -b 2mm" to test the 2mm benchmark
    Currently, we are *very* reliant on asusmed file paths, so if you move
    files around in `polybench-affine` everything will probably break.
    """
    parser = argparse.ArgumentParser(description="Process some json file names")
    parser.add_argument("-j", "--json", type=str)
    args = parser.parse_args()

    run_settings = parse_args(args)

    cycle_counts = {}

    for benchmark in os.listdir("benchmarks"):
        # Construct the full path
        benchmark_path = os.path.join("benchmarks", benchmark)
        run_benchmark(run_settings, benchmark_path, benchmark, cycle_counts)
        # end_time = time.time()
        # if run_settings["wall_time_file"] is not None:
        #     with open(
        #         os.path.join("wall-time", run_settings["wall_time_file"]), "a"
        #     ) as file:
        #         file.writelines(
        #             f"{benchmark}:" + str((end_time - start_time) / 60) + " minutes\n"
        #         )

    # if run_settings["cycle_count_results"] is not None:
    #     expect_exists("cycle-counts")
    #     with open(
    #         os.path.join("cycle-counts", run_settings["cycle_count_results"]), "w"
    #     ) as f:
    #         f.write(json.dumps(cycle_counts))
