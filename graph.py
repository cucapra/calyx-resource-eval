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


def format_date(date_str):
    list_str = date_str.split()
    return f"""{list_str[0]}@{list_str[1]}"""


# given resource_name and file_name, and a resource_info in the form
# {test name (e.g., polybench): {design name (e.g., lin-alg.fuse): resource_usage_json}},
# get the usage for resource_name in design_name
def get_resource_usage(resource_name, design_name, moment_dir):
    version_data = None
    resource_data = None
    for fname in os.listdir(moment_dir):
        pname = os.path.join(moment_dir, fname)
        if pname.endswith(".json"):
            if Path(pname).name == "version_info.json":
                with open(pname) as f:
                    version_info = json.load(f)
                    calyx_date = format_date(version_info["calyx"].split("||")[1])
                    dahlia_date = format_date(version_info["dahlia"].split("||")[1])
                    version_data = f"""calyx: {calyx_date} \n dahlia: {dahlia_date}"""
            else:
                with open(pname) as f:
                    bench_resource_numbers = json.load(f)
                    for design_path in bench_resource_numbers:
                        if Path(design_path).name == design_name:
                            resource_data = bench_resource_numbers[design_path][
                                resource_name
                            ]

    if resource_data is None:
        # this could happen if we add benchmarks later
        return (None, None)
    elif version_data is None:
        raise Exception(f""" no version info""")
    else:
        return (version_data, resource_data)


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
        (version_data, resource_data) = get_resource_usage(
            resource_name, design_name, pathname
        )
        if version_data is not None and resource_data is not None:
            graph_data[version_data] = resource_data

    # assert that graph_data is sorted.
    # graph_data = assert_sorted(graph_data)

    # build bar graph
    data_plot = pd.DataFrame(
        {"Version": list(graph_data.keys()), "Usage": list(graph_data.values())}
    )

    fig = plt.figure(figsize=(10, 5))

    # creating the bar plot
    sns.barplot(x="Version", y="Usage", data=data_plot)
    plt.xlabel("Time")
    plt.ylabel("Resource Usage")
    plt.title(f"""{resource_name} usage in {design_name} over different versions""")
    plt.show()
