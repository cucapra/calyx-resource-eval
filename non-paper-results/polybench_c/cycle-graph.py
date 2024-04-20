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


def parse_json(input):
    """
    Parses json input and returns a dictionary
    """
    dic = {}
    resource_dic = {}
    for pathname, keyname in input["jsons"]:
        with open(pathname) as json_file:
            resource_dic[keyname] = json.load(json_file)
    dic["resource_inputs"] = resource_dic
    dic["benchmarks"] = dict(input["benchmarks"])
    dic["resources"] = dict(input["resources"])
    dic["standard_version"] = input.get("standardize", None)
    return dic


def standardize_results(benchmark_version, data):
    standardized_data = []
    # maps design -> resource usage for the benchmark version
    raw_benchmark_data = {}
    resource_standardized_data = []
    for data_item in data:
        if benchmark_version in data_item[0]:
            # setting design = resource usage
            raw_benchmark_data[data_item[1]] = data_item[2]
    for data_item in data:
        benchmark_usage = raw_benchmark_data[data_item[1]]
        standardized_data.append(
            [data_item[0], data_item[1], data_item[2] / benchmark_usage]
        )
    return standardized_data


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Process args for resource estimates")
    parser.add_argument("-j", "--json", default=None)
    parser.add_argument("-s", "--save", default=None)  # on/off flag
    args = parser.parse_args()

    # get design_list and resource_list given args:
    # if it ends w/ .json then read from the json, otherwise just use the arg
    with open(args.json) as f:
        json_info = json.load(f)
        # tuple of (filename, alias for filename when we display the graph)
        cycle_count_jsons = json_info["cycle_jsons"]
        benchmark_list = json_info["benchmarks"]
        standard = json_info.get("standard")

    # dictionary for the graph that we are building
    graph_data = []

    # iterate over files in directory
    # https: //www.geeksforgeeks.org/how-to-iterate-over-files-in-directory-using-python/
    for [filename, filename_alias] in cycle_count_jsons:
        with open(filename, "r") as f:
            cycle_counts = json.load(f)
            for benchmark in benchmark_list:
                if benchmark not in cycle_counts:
                    raise Exception(f"Expected {benchmark} in {filename}")
                graph_data.append([filename_alias, benchmark, cycle_counts[benchmark]])

    if standard is not None:
        graph_data = standardize_results(standard, graph_data)

    fig = plt.figure(figsize=(10, 8))
    df = pd.DataFrame(graph_data, columns=["settings", "benchmark", "cycle count"])
    ax = sns.barplot(
        x="benchmark",
        y="cycle count",
        hue="settings",
        data=df,
        errorbar=None,
    )
    ax.set(title=f"""cycle counts""")
    sns.move_legend(ax, "upper right", bbox_to_anchor=(0.4, 1.15))
    plt.xticks(rotation=90)
    if args.save is not None:
        # only save graph if specified in cmdline arguments
        if not os.path.exists("graphs"):
            os.makedirs("graphs")
            # can save figure if we want
        fig.savefig(
            f"""cycle-count-graphs/{args.save}""",
            bbox_inches="tight",
        )
    plt.show()