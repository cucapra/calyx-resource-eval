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
import warnings
import matplotlib
from pretty_graph_utils import standardize_results, get_geo_means

sns.set_theme(style="whitegrid")
matplotlib.rcParams["pdf.fonttype"] = 42
matplotlib.rcParams["ps.fonttype"] = 42

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
        x_label = json_info["x"]
        x_ticks = json_info["x_ticks"]
        y_label = json_info["y"]
        legend_title = json_info["legend"]
        legend_pos = json_info["legend_pos"]
        palette = json_info.get("palette", None)

    # dictionary for the graph that we are building
    graph_data = []

    # iterate over files in directory
    # https: //www.geeksforgeeks.org/how-to-iterate-over-files-in-directory-using-python/
    for [filename, filename_alias] in cycle_count_jsons:
        with open(filename, "r") as f:
            cycle_counts = json.load(f)
            for benchmark, benchmark_alias in benchmarks.items():
                if benchmark not in cycle_counts:
                    graph_data.append([filename_alias, benchmark_alias, None])
                    warnings.warn(f"Expected {benchmark} in {filename}.")
                else:
                    graph_data.append(
                        [
                            filename_alias,
                            benchmark_alias,
                            cycle_counts[benchmark]["cycles"],
                        ]
                    )

    if standard is not None:
        print(get_geo_means(standard, graph_data))
        graph_data = standardize_results(standard, graph_data)

    fig = plt.figure(figsize=(10, 7))
    df = pd.DataFrame(graph_data, columns=["legend", "x", "y"])

    for size in df["x"].unique():
        print(f"For size {size}:")
        res_list = []
        for legend_entry in df["legend"].unique():
            result = df[(df["legend"] == legend_entry) & (df["x"] == size)]["y"]
            res_list.append([legend_entry, result.iloc[0]])
        sorted_list = sorted(res_list, key=lambda x: -x[1])
        print(f"{sorted_list[0][0]} takes {sorted_list[0][1]} cycles")
        print(f"{sorted_list[1][0]} takes {sorted_list[1][1]} cycles")
        print(
            f"This represents an increase by a factor of {sorted_list[0][1]/sorted_list[1][1]}"
        )

    if standard is not None:
        bottom = 1
    else:
        bottom = 0
    ax = sns.barplot(
        x="x",
        y="y",
        hue="legend",
        data=df,
        errorbar=None,
        bottom=bottom,
        palette=palette,
    )
    if standard is not None:
        ax.set_ylim([0.3, 1.2])

    plt.legend(title=legend_title)
    sns.move_legend(ax, "upper right", bbox_to_anchor=(legend_pos[0], legend_pos[1]))
    # for legend text
    plt.setp(ax.get_legend().get_texts(), fontsize=24)
    # for legend title
    plt.setp(ax.get_legend().get_title(), fontsize=34)
    plt.xlabel(x_label, fontsize=45)
    plt.ylabel(y_label, fontsize=45)
    plt.title("", fontsize=20)
    plt.tick_params(axis="both", which="major", labelsize=14)
    plt.xticks(rotation=x_ticks[0], fontsize=x_ticks[1])
    plt.yticks(fontsize=28)
    if json_info.get("hide_legend", False):
        # hacky way to get rid of legend
        plt.legend([], [], frameon=False)
    if args.save is not None:
        # only save graph if specified in cmdline arguments
        if not os.path.exists("graphs"):
            os.makedirs("graphs")
            # can save figure if we want
        fig.savefig(
            f"""graphs/{args.save}.pdf""",
            bbox_inches="tight",
        )
    plt.show()
