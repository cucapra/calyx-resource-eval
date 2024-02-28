import argparse
import json
import os
import subprocess

from utilities.comp_json import compare_jsons, get_cycle_count

ALL_SAME = True


def expect_exists(pathname):
    """Raises an error if the path does not exist
    Args:
        pathname (str): a pathname
    """
    if not os.path.exists(pathname):
        raise FileNotFoundError(f"The path '{pathname}' does not exist.")


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
    calyx_file_path = os.path.join(
        "../benchmarks", "polybench-scf", f"{benchmark_name}.futil"
    )

    # Generate the .futil file
    if run_settings["gen_calyx_files"]:
        print(f"Generating Calyx file for {benchmark_name}")
        calyx_generator = os.path.join("utilities", "gen-calyx.sh")
        expect_exists(calyx_generator)
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
        print(f"Generating initial data for {benchmark_name}")
        with open(init_data_path, "w+") as init_file:
            # need to do print_json_c_file[2:] to get rid of the ./ in the pathname
            # probably a better way to do this
            subprocess.call(
                [
                    "./generate-json.sh",
                    "-r",
                    "0",
                    "-p",
                    json_generator,
                    "-s",
                    "MINI_DATASET",
                ],
                stdout=init_file,
            )

    # run the .futil file
    if run_settings["gen_data_calyx"]:
        print(f"Running Calyx for {benchmark_name}")
        expect_exists(init_data_path)
        expect_exists(calyx_file_path)
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
                f"{calyx_file_path}",
            ]
        )

    # run the cpp implementation
    if run_settings["gen_data_c"]:
        print(
            f"Generating expected data (i.e., running C implementation) for {benchmark_name}"
        )
        with open(c_results_path, "w+") as c_output_file:
            subprocess.call(
                [
                    "./generate-json.sh",
                    "-r",
                    "1",
                    "-p",
                    json_generator,
                    "-s",
                    "MINI_DATASET",
                ],
                stdout=c_output_file,
            )

    # compare the calyx run and the cpp run
    if run_settings["check_results"]:
        global ALL_SAME
        expect_exists(c_results_path)
        expect_exists(calyx_results_path)
        # XXX(Caleb): ignore certain memories for annoying reason
        # These are 1d memories that when you pass as arguments in c it
        # they don't change value to the outside world
        if benchmark_name == "durbin":
            ignore = ["mem_3", "mem_4", "mem_5"]
        elif benchmark_name == "ludcmp":
            ignore = ["mem_4"]
        else:
            ignore = []
        str_result, bool_result = compare_jsons(
            c_results_path, calyx_results_path, ignore
        )
        print(str_result)
        ALL_SAME = ALL_SAME & bool_result
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

    if run_settings["check_results"]:
        print(f"ALL_SAME: {ALL_SAME}")
        expect_exists("cycle-counts")
        filename = "calyx-results" + run_settings["calyx_flags"] + ".json"
        filename.replace(" ", "")
        with open(os.path.join("cycle-counts", filename), "w+") as f:
            f.write(json.dumps(cycle_counts))
