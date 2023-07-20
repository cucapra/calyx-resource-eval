import numpy as np
import argparse
import json

parser = argparse.ArgumentParser(description="Process some integers.")
parser.add_argument("-f", "--first-json", type=str)
parser.add_argument("-s", "--second-json", type=str)
args = parser.parse_args()

json_file1 = args.first_json
json_file2 = args.second_json


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
