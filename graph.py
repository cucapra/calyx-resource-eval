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


# assert that myDict is sorted by keys and return myDict
# https://www.geeksforgeeks.org/python-sort-python-dictionaries-by-key-or-value/
def assert_sorted(my_dict):
    my_keys = list(my_dict.keys())
    my_keys.sort()
    sorted_dict = {i: my_dict[i] for i in my_keys}
    assert my_dict == sorted_dict, "dictionary wasn't sorted. Something went wrong"
    return sorted_dict


# formats a date string to be nicer
def format_date(date_str):
    list_str = date_str.split()
    return f"""{list_str[0]}@{list_str[1]}"""


# formats a date string to be nicer
def format_design_name(design_str):
    extension_removed = design_str.split(".")[0]
    if "linear-algebra" in extension_removed:
        return extension_removed[len("linear-algebra") + 1 :]
    else:
        return extension_removed


def get_calyx_version(moment_dir):
    for fname in os.listdir(moment_dir):
        pname = os.path.join(moment_dir, fname)
        if Path(pname).name == "version_info.json":
            with open(pname) as f:
                version_info = json.load(f)
                calyx_date = format_date(version_info["calyx"].split("||")[1])
                return f"""{calyx_date} """
    raise Exception(f"""{moment_dir} has no version_info.json folder""")


# given resource_name and design_name, and moment_dir (which is the path to
# the directory that contains all the results files,
# get a tuple of (version_info, usage)
# where version_info = date of calyx/dahlia commit used
# and usage = usage of resource_name for design_name
def get_resource_usage(resource_list, design_list, moment_dir, graph_data):
    calyx_version = get_calyx_version(moment_dir)
    for fname in os.listdir(moment_dir):
        pname = os.path.join(moment_dir, fname)
        # ignore the non-json files which contain information we're not interested in
        if pname.endswith(".json"):
            # if we have benchark resource usage, then check if design_name
            # is in that benchark. if so, get resource usage for resource_name.
            with open(pname) as f:
                bench_resource_numbers = json.load(f)
                for design_path in bench_resource_numbers:
                    design_name = Path(design_path).name
                    if design_name in design_list:
                        for resource in resource_list:
                            # update graph_data
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
    parser.add_argument("-r", "--resource")
    parser.add_argument("-d", "--design")
    parser.add_argument("-s", "--save", action="store_true")  # on/off flag
    args = parser.parse_args()

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
        fig = plt.figure(figsize=(10, 8))
        df = pd.DataFrame(
            resource_usage_data, columns=["calyx version", "design", "usage"]
        )
        ax = sns.barplot(
            x="design", y="usage", hue="calyx version", data=df, errorbar=None
        )
        plt.xticks(rotation=90)
        if args.save:
            if not os.path.exists("graphs"):
                os.makedirs("graphs")
                # can save figure if we want
            ax.set(title=f"""{resource}-usage""")
            fig.savefig(
                f"""graphs/{resource}-usage""",
                bbox_inches="tight",
            )
        plt.show()

    # # build bar graph
    # data_plot = pd.DataFrame(
    #     {"Version": list(graph_data.keys()), "Usage": list(graph_data.values())}
    # )

    # fig = plt.figure(figsize=(10, 5))

    # # creating the bar plot
    # sns.barplot(x="Version", y="Usage", data=data_plot)
    # plt.xlabel("Time")
    # plt.ylabel("Resource Usage")
    # plt.title(f"""{resource_name} usage in {design_name} over different versions""")
    # plt.show()
