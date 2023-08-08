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
    parser.add_argument("-s", "--save", default=None)
    args = parser.parse_args()

    # get design_list and resource_list given args:
    # if it ends w/ .json then read from the json, otherwise just use the arg
    with open(args.json) as f:
        json_info = json.load(f)
        # tuple of (filename, alias for filename when we display the graph)
        cycle_count_jsons = json_info["cycle_jsons"]
        benchmarks = dict(json_info["benchmarks"])
        standard = json_info.get("standard")

    # dictionary for the graph that we are building
    graph_data = []

    # iterate over files in directory
    # https: //www.geeksforgeeks.org/how-to-iterate-over-files-in-directory-using-python/
    for [filename, filename_alias] in cycle_count_jsons:
        with open(filename, "r") as f:
            cycle_counts = json.load(f)
            for benchmark, benchmark_alias in benchmarks.items():
                if benchmark not in cycle_counts:
                    raise Exception(f"Expected {benchmark} in {filename}")
                graph_data.append(
                    [filename_alias, benchmark_alias, cycle_counts[benchmark]]
                )

    if standard is not None:
        graph_data = standardize_results(standard, graph_data)

    fig = plt.figure(figsize=(12, 7))
    df = pd.DataFrame(graph_data, columns=["Design Type", "Matrix Size", "Cycle Count"])
    ax = sns.barplot(
        x="Matrix Size",
        y="Cycle Count",
        hue="Design Type",
        data=df,
        errorbar=None,
    )

    plt.legend(title="Design Type")
    sns.move_legend(ax, "upper right", bbox_to_anchor=(0.35, 1.0))
    # for legend text
    plt.setp(ax.get_legend().get_texts(), fontsize=16)
    # for legend title
    plt.setp(ax.get_legend().get_title(), fontsize=20)

    plt.xlabel("Matrix Size", fontsize=18)
    plt.ylabel("Relative Cycle Counts", fontsize=20)
    plt.title("", fontsize=20)
    plt.tick_params(axis="both", which="major", labelsize=14)
    plt.xticks(rotation=70, fontsize=14)
    plt.yticks(fontsize=14)
    if args.save is not None:
        # only save graph if specified in cmdline arguments
        if not os.path.exists("graphs"):
            os.makedirs("graphs")
            # can save figure if we want
        fig.savefig(
            f"""graphs/{args.save}""",
            bbox_inches="tight",
        )
    plt.show()
