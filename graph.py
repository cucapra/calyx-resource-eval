"""
Command line argument: python3 path/to/graph.py resource_name design_name
"""

import os
import sys
import json

import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns
import pandas as pd

from pathlib import Path

sns.set_theme()

# assign directory
directory = "debug-results"


# assert that myDict is sorted by keys and return myDict
# https://www.geeksforgeeks.org/python-sort-python-dictionaries-by-key-or-value/
def assert_sorted(my_dict):
    my_keys = list(my_dict.keys())
    my_keys.sort()
    sorted_dict = {i: my_dict[i] for i in my_keys}
    assert my_dict == sorted_dict, "dictionary wasn't sorted. Something went wrong"
    return sorted_dict


# given resource_name and file_name, and a resource_info in the form
# {test name (e.g., polybench): {design name (e.g., lin-alg.fuse): resource_usage_json}},
# get the usage for resource_name in design_name
def get_resource_usage(resource_name, design_name, moment_dir):
    for bench_name in os.listdir(moment_dir):
        bench_pathname = os.path.join(moment_dir, bench_name)
        with open(bench_pathname) as f:
            bench_resource_numbers = json.load(f)
            for design_path in bench_resource_numbers:
                if Path(design_path).name == design_name:
                    return bench_resource_numbers[design_path][resource_name]
    raise Exception(f"""there is no usage of {resource_name} in {design_name}""")


if __name__ == "__main__":
    assert (
        len(sys.argv) == 3
    ), "please provide a resource and design name, e.g., graph.py lut \
    vectorized-add.futil"
    resource_name = sys.argv[1]
    design_name = sys.argv[2]

    # dictionary for the graph that we are building
    graph_data = {}

    # iterate over files in directory
    # https://www.geeksforgeeks.org/how-to-iterate-over-files-in-directory-using-python/
    for filename in os.listdir(directory):
        pathname = os.path.join(directory, filename)
        # e.g., changing 2023-05-24@13:27:34.json to "2023-05-24@13:27:34"
        moment = os.path.splitext(filename)[0]
        graph_data[moment] = get_resource_usage(resource_name, design_name, pathname)

    # assert that graph_data is sorted.
    graph_data = assert_sorted(graph_data)

    # build bar graph
    data_plot = pd.DataFrame(
        {"Time": list(graph_data.keys()), "Usage": list(graph_data.values())}
    )

    fig = plt.figure(figsize=(10, 5))

    # creating the bar plot
    sns.lineplot(x="Time", y="Usage", data=data_plot)
    plt.xlabel("Time")
    plt.ylabel("Resource Usage")
    plt.title(f"""{resource_name} usage in {design_name} over time""")
    plt.show()
