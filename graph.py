"""
Command line argument: python3 path/to/graph.py resource_name file_name
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


# given resource_name and file_name, and a resource_usage dic in the form
# {file name: resource_usage_json}, get the usage for resource_name
# in file_name
def get_resource_usage(resource_name, file_name, resource_usage_dic):
    for path_name in resource_usage_dic:
        if Path(path_name).name == file_name:
            return resource_usage_dic[path_name][resource_name]
    raise Exception(f"""there is no usage of {resource_name} in {file_name}""")


if __name__ == "__main__":
    assert (
        len(sys.argv) == 3
    ), "please provide a resource and file name, e.g., graph.py lut vectorized_add.futil"
    resource_name = sys.argv[1]
    file_name = sys.argv[2]

    # dictionary for the graph that we are building
    graph_data = {}

    # iterate over files in directory
    # https://www.geeksforgeeks.org/how-to-iterate-over-files-in-directory-using-python/
    for filename in os.listdir(directory):
        pathname = os.path.join(directory, filename)
        # checking if it is a file
        if os.path.isfile(pathname):
            with open(pathname, "r") as f:
                # resource_info maps input type names -> (input file names -> resource jsons)
                resource_info = json.load(f)
                for resource_dictionary in resource_info.values():
                    # since filenames are "moments" (e.g., 2023-05-22@08-44-54.json)
                    # we are setting
                    # graph_data[moment] = resource usage at that moment
                    graph_data[filename] = get_resource_usage(
                        resource_name, file_name, resource_dictionary
                    )

    # assert that graph_data is sorted.
    graph_data = assert_sorted(graph_data)

    # build bar graph
    # "time"/moments on the x axis
    # resource usage on the y axis

    data_plot = pd.DataFrame(
        {"Time": list(graph_data.keys()), "Usage": list(graph_data.values())}
    )

    fig = plt.figure(figsize=(10, 5))

    # creating the bar plot
    sns.lineplot(x="Year", y="Profit", data=data_plot)
    plt.xlabel("Time of Resource Estimation")
    plt.ylabel("Resource Usage")
    plt.title(f"""{resource_name} usage in {file_name} over time""")
    plt.show()
