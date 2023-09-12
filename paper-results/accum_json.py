import argparse
import os
import json


# https://stackoverflow.com/questions/800197/how-to-get-all-of-the-immediate-subdirectories-in-python
def get_immediate_subdirectories(a_dir):
    return [
        name for name in os.listdir(a_dir) if os.path.isdir(os.path.join(a_dir, name))
    ]


if __name__ == "__main__":
    """
    Run "python3 test-runner.py -b {benchmark_name}" to test the correctness
    of the bencmark.
    For example run "python3 test-runner.py -b 2mm" to test the 2mm benchmark
    Currently, we are *very* reliant on asusmed file paths, so if you move
    files around in `polybench-affine-clean` everything will probably break.
    """
    parser = argparse.ArgumentParser(description="Process some json file names")
    parser.add_argument("-p", "--path", type=str)
    args = parser.parse_args()

    cycle_counts = {}

    for directory in get_immediate_subdirectories(args.path):
        dirpath = os.path.join(args.path, directory)
        cur_dic = {}
        for file in os.listdir(dirpath):
            if file != "combined.json":
                filepath = os.path.join(dirpath, file)
                with open(os.path.join(dirpath, file)) as f:
                    dict = json.load(f)
                    cur_dic[file] = dict
        with open(os.path.join(dirpath, "combined.json"), "w") as outfile:
            json.dump(cur_dic, outfile)
