import argparse
import json
import os
import subprocess

from utilities.comp_json import compare_jsons


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


if __name__ == "__main__":
    """
    Run "python3 test-runner.py -b {benchmark_name}" to test the correctness
    of the bencmark.
    For example run "python3 test-runner.py -b 2mm" to test the 2mm benchmark
    Currently, we are *very* reliant on asusmed file paths, so if you move
    files around in `polybench-affine-clean` everything will probably break.
    """
    parser = argparse.ArgumentParser(description="Process some json file names")
    parser.add_argument("-b", "--benchmark", type=str)
    args = parser.parse_args()

    benchmark_name = args.benchmark

    benchmark_path = find_benchmark_path(benchmark_name)

    futil_benchmark_name = benchmark_name + ".futil"
    futil_file_path = os.path.join(benchmark_path, futil_benchmark_name)
    init_data_path = os.path.join(benchmark_path, "data/init.json")
    calyx_results_path = os.path.join(benchmark_path, "data/calyx-results.json")
    c_results_path = os.path.join(benchmark_path, "data/c-results.json")
    print_json_c_file = os.path.join(benchmark_path, "print-json.cpp")

    # generate the .futil file
    futil_file = open(futil_file_path, "w")
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
    futil_file.close()

    init_file = open(init_data_path, "w")
    # get the initial json
    subprocess.call(
        ["./print-json.sh", "-r", "0", "-s", f"{print_json_c_file[2:]}"],
        stdout=init_file,
    )
    init_file.close()

    # run the .futil file
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
            "-o",
            f"{calyx_results_path}",
            f"{futil_file_path}",
        ]
    )

    c_output_file = open(c_results_path, "w")
    # run the cpp implementation
    subprocess.call(
        ["./print-json.sh", "-r", "1", "-s", f"{print_json_c_file[2:]}"],
        stdout=c_output_file,
    )
    c_output_file.close()

    compare_jsons(c_results_path, calyx_results_path)
