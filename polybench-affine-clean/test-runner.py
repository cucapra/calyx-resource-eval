import argparse
import json
import os
import subprocess

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
        raise Exception(f"expected file {pathname} but it doesn't exist")


def parse_args(args):
    """
    Args:
        args: the command line arguments passed
    Returns:
        dict: a dict with the necessary arguments
    """
    res = {}
    if args.json is not None:
        with open(args.json, "r") as f:
            spec = json.load(f)
            res["benchmarks"] = spec["benchmarks"]
            res["gen_futil"] = spec.get("gen_futil", True)
            res["gen_init"] = spec.get("gen_init", True)
            res["run_calyx"] = spec.get("run_calyx", True)
            res["run_c_impl"] = spec.get("run_c_impl", True)
            res["calyx_flags"] = spec.get("calyx_flags", "")
            res["calyx_results_file"] = spec.get(
                "calyx_results_file", "calyx-results.json"
            )
            res["cycle_count_results"] = spec.get("cycle_count_results")
    else:
        res["benchmarks"] = [args.benchmark]
        res["gen_futil"] = args.gen_futil if args.gen_futil is not None else True
        res["gen_init"] = args.gen_init if args.gen_init is not None else True
        res["run_calyx"] = args.run_calyx if args.run_calyx is not None else True
        res["run_c_impl"] = args.run_c_impl if args.run_c_impl is not None else True
        res["calyx_flags"] = args.calyx_flags if args.run_c_impl is not None else ""
        res["calyx_results_file"] = (
            args.calyx_results_file
            if args.calyx_results_file is not None
            else "calyx-results.json"
        )
        res["cycle_count_results"] = (
            args.cycle_count_results if args.cycle_count_results is not None else None
        )
    return res


def run_benchmark(run_settings, benchmark_name, cycle_counts):
    """runs benchmark_name based on run_settings dictionary"""
    benchmark_path = find_benchmark_path(benchmark_name)

    # assert that a data folder exists
    expect_exists(os.path.join(benchmark_path, "data"))

    futil_file_path = os.path.join(benchmark_path, benchmark_name + ".futil")
    init_data_path = os.path.join(benchmark_path, "data/init.json")
    calyx_results_path = os.path.join(
        benchmark_path, f"data/{run_settings['calyx_results_file']}.json"
    )
    c_results_path = os.path.join(benchmark_path, "data/c-results.json")
    print_json_c_file = os.path.join(benchmark_path, "print-json.cpp")

    # generate the .futil file
    if run_settings["gen_futil"]:
        with open(futil_file_path, "w") as futil_file:
            subprocess.call(
                [
                    "sh",
                    "utilities/gen-calyx.sh",
                    f"{os.path.join(benchmark_path, benchmark_name)}",
                    "-o",
                    f"{futil_file_path}",
                ],
                stdout=futil_file,
            )

    # generate the initial json
    if run_settings["gen_init"]:
        with open(init_data_path, "w") as init_file:
            subprocess.call(
                ["./print-json.sh", "-r", "0", "-s", f"{print_json_c_file[2:]}"],
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
                "icarus-verilog",
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
                ["./print-json.sh", "-r", "1", "-s", f"{print_json_c_file[2:]}"],
                stdout=c_output_file,
            )

    expect_exists(c_results_path)
    compare_jsons(c_results_path, calyx_results_path)

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
    parser.add_argument("-f", "--gen_futil", type=bool)
    parser.add_argument("-i", "--gen_init", type=bool)
    parser.add_argument("-x", "--run_calyx", type=bool)
    parser.add_argument("-c", "--run_c_impl", type=bool)
    parser.add_argument("-l", "--calyx_flags", type=str)
    parser.add_argument("-r", "--calyx_results_file", type=str)
    parser.add_argument("-y", "--cycle_count_results", type=str)
    args = parser.parse_args()

    run_settings = parse_args(args)

    cycle_counts = {}

    for benchmark in run_settings["benchmarks"]:
        run_benchmark(run_settings, benchmark, cycle_counts)

    if run_settings["cycle_count_results"] is not None:
        with open(run_settings["cycle_count_results"], "w") as f:
            f.write(json.dumps(cycle_counts))
