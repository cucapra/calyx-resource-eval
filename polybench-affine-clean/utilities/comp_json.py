import numpy as np
import argparse
import json


def compare_jsons(json_file1, json_file2):
    """
    Compares the jsons in
    json_file1 and json_file2
    The json's should have a "memories" entry, which itself is a mapping of
    memory names -> data.
    This is the way that the Calyx output jsons are formatted
    """
    memories1 = json.load(open(json_file1))["memories"]
    memories2 = json.load(open(json_file2))["memories"]

    same = True
    for m1_name in memories1:
        m1 = memories1[m1_name]
        m2 = memories2[m1_name]
        if not np.array_equal(np.array(m1), np.array(m2)):
            same = False
            print(f"{m1_name} is not equivalent")
    if same:
        print(f"All Equivalent")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Process some json file names")
    parser.add_argument("-f", "--first-json", type=str)
    parser.add_argument("-s", "--second-json", type=str)
    args = parser.parse_args()

    json_file1 = args.first_json
    json_file2 = args.second_json
    compare_jsons(json_file1, json_file2)
