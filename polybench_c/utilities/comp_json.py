import numpy as np
import argparse
import json


def get_cycle_count(json_file):
    """gets cycle count entry for json_file
    Args:
        json_file (str): path to json file
    """
    return json.load(open(json_file))["cycles"]


def compare_jsons(json_file1, json_file2, ignore_mems):
    """
    Compares the jsons in
    json_file1 and json_file2
    The json's should have a "memories" entry, which itself is a mapping of
    memory names -> data.
    This is the way that the Calyx output jsons are formatted
    ignore_mems is memories to ignore for the comparison
    """
    memories1 = json.load(open(json_file1))["memories"]
    memories2 = json.load(open(json_file2))["memories"]

    ans = ""
    same = True
    for m1_name in memories1:
        m1 = memories1[m1_name]
        m2 = memories2[m1_name]
        if m1_name not in ignore_mems and not np.array_equal(
            np.array(m1), np.array(m2)
        ):
            same = False
            ans += f"{m1_name} is not equivalent\n"
    if same:
        return ("All Equivalent\n", True)
    else:
        return (ans, False)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Process some json file names")
    parser.add_argument("-f", "--first-json", type=str)
    parser.add_argument("-s", "--second-json", type=str)
    args = parser.parse_args()

    json_file1 = args.first_json
    json_file2 = args.second_json
    compare_jsons(json_file1, json_file2)
