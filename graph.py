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
import argparse

from pathlib import Path

sns.set_theme()

# assign directory
directory = "debug-results"


def assert_sorted(my_dict):
    """
    assert that myDict is sorted by keys and return myDict
    https://www.geeksforgeeks.org/python-sort-python-dictionaries-by-key-or-value/
    """
    my_keys = list(my_dict.keys())
    my_keys.sort()
    sorted_dict = {i: my_dict[i] for i in my_keys}
    assert my_dict == sorted_dict, "dictionary wasn't sorted. Something went wrong"
    return sorted_dict


def format_date(date_str):
    """
    formats a date string to be nicer
    """
    list_str = date_str.split()
    return f"""{list_str[0]}@{list_str[1]}"""


def format_design_name(design_str):
    """
    formats a date string to be nicer
    """
    extension_removed = design_str.split(".")[0]
    if "linear-algebra" in extension_removed:
        return extension_removed[len("linear-algebra") + 1 :]
    else:
        return extension_removed


def get_calyx_version(moment_dir):
    """
    given a path to moment_dir
    gets the date of the calyx version specified by version_info.json
    if no version_info.json, raises Exception
    """
    for fname in os.listdir(moment_dir):
        pname = os.path.join(moment_dir, fname)
        if Path(pname).name == "version_info.json":
            with open(pname) as f:
                version_info = json.load(f)
                calyx_date = format_date(version_info["calyx"].split("||")[1])
                return f"""{calyx_date} """
    raise Exception(f"""{moment_dir} has no version_info.json folder""")


def get_resource_usage(resource_list, design_list, moment_dir, graph_data):
    """
    given resource_list and design_list (the list of resources/designs we want to get data for)
    and moment_dir (path to the directory that contains all the results files),
    updates graph_data, which is a dictionary of {resource names -> [calyx_version, design_name, resource_usage]}
    """
    calyx_version = get_calyx_version(moment_dir)
    for fname in os.listdir(moment_dir):
        pname = os.path.join(moment_dir, fname)
        # we only care about the .json files
        if pname.endswith(".json"):
            # if we have benchark resource usage, then check if design_name
            # is in that benchark. if so, get resource usage for resource_name.
            with open(pname) as f:
                bench_resource_numbers = json.load(f)
                for design_path in bench_resource_numbers:
                    design_name = Path(design_path).name
                    if design_name in design_list:
                        for resource in resource_list:
                            # update graph_data for each resource/design that we can
                            resource_data = graph_data.get(resource, [])
                            resource_data.append(
                                [
                                    calyx_version,
                                    format_design_name(design_name),
                                    bench_resource_numbers[design_path][resource],
                                ]
                            )
                            graph_data[resource] = resource_data


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Process args for resource estimates")
    parser.add_argument("-r", "--resource", default="full-graph-input.json")
    parser.add_argument("-d", "--design", default="full-graph-input.json")
    parser.add_argument("-s", "--save", action="store_true")  # on/off flag
    args = parser.parse_args()

    # get design_list and resource_list given args:
    # if it ends w/ .json then read from the json, otherwise just use the arg
    if args.resource.endswith(".json"):
        with open(args.resource) as f:
            resource_json = json.load(f)
            resource_list = resource_json["resources"]
    else:
        resource_list = [args.resource]

    if args.design.endswith(".json"):
        with open(args.design) as f:
            design_json = json.load(f)
            design_list = design_json["designs"]
    else:
        design_list = [args.design]

    # dictionary for the graph that we are building
    graph_data = {}

    # iterate over files in directory
    # https://www.geeksforgeeks.org/how-to-iterate-over-files-in-directory-using-python/
    for filename in os.listdir(directory):
        pathname = os.path.join(directory, filename)
        # e.g., changing 2023-05-24@13:27:34.json to "2023-05-24@13:27:34"
        moment = os.path.splitext(filename)[0]
        get_resource_usage(resource_list, design_list, pathname, graph_data)

    for resource, resource_usage_data in graph_data.items():
        # create a separate graph for each resource used
        fig = plt.figure(figsize=(10, 8))
        df = pd.DataFrame(
            resource_usage_data, columns=["calyx version", "design", "usage"]
        )
        ax = sns.barplot(
            x="design", y="usage", hue="calyx version", data=df, errorbar=None
        )
        ax.set(title=f"""{resource}-usage""")
        plt.xticks(rotation=90)
        if args.save:
            # only save graph if specified in cmdline arguments
            if not os.path.exists("graphs"):
                os.makedirs("graphs")
                # can save figure if we want
            fig.savefig(
                f"""graphs/{resource}-usage""",
                bbox_inches="tight",
            )
        plt.show()
