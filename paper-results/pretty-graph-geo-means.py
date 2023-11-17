"""
Command line argument: python3 path/to/graph.py resource_name design_name
"""

import os
import json

import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns
import pandas as pd
import argparse
import warnings
from pretty_graph_utils import standardize_results, get_geo_means

sns.set_theme()


def parse_json(input):
    """
    Parses json input and returns a dictionary
    """
    dic = {}
    resource_dic = {}
    cycle_dic = {}
    for [resource_path_name, cycle_path_name, keyname] in input["jsons"]:
        with open(resource_path_name) as json_file:
            resource_dic[keyname] = json.load(json_file)
        with open(cycle_path_name) as json_file:
            cycle_dic[keyname] = json.load(json_file)
    dic["resource_inputs"] = resource_dic
    dic["cycle_inputs"] = cycle_dic
    dic["benchmarks_resources"] = dict(input["benchmarks_resources"])
    dic["benchmarks_cycles"] = dict(input["benchmarks_cycles"])
    dic["resources"] = dict(input["resources"])
    dic["standard_version"] = input.get("standardize", None)
    dic["sort"] = input.get("sort", False)
    dic["x"] = json_info["x"]
    dic["x_ticks"] = json_info["x_ticks"]
    dic["y"] = json_info.get("y", "")
    dic["legend"] = json_info["legend"]
    dic["legend_pos"] = json_info["legend_pos"]
    dic["hide_legend"] = json_info.get("hide_legend", False)
    return dic


def get_graph_data(usage_data, benchmark_data, resource_data, graph_data):
    """
    given resource_list and design_list (the list of resources/designs we want to get data for)
    and moment_dir (path to the directory that contains all the results files),
    updates graph_data, which is a dictionary of {resource names -> [calyx_version, design_name, resource_usage]}
    """
    for setting_name, resource_map in usage_data.items():
        for benchmark_name, resource_usage in resource_map.items():
            for resource_name, resource_name_formatted in resource_data.items():
                # update graph_data for each resource/design that we can
                graph_resource_data = graph_data.get(resource_name_formatted, [])
                graph_resource_data.append(
                    [
                        setting_name,
                        benchmark_data[benchmark_name],
                        resource_usage[resource_name],
                    ]
                )
                graph_data[resource_name_formatted] = graph_resource_data


def get_graph_cycles(cycle_count_jsons, benchmark_info, graph_data):
    for setting_name, cycle_count_dic in cycle_count_jsons.items():
        for benchmark_name, cycle_count in cycle_count_dic.items():
            # update graph_data for each resource/design that we can
            graph_data.append(
                [
                    setting_name,
                    benchmark_info[benchmark_name],
                    cycle_count,
                ]
            )


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Process args for resource estimates")
    parser.add_argument("-j", "--json", default="graph-inputs/full-graph-input.json")
    parser.add_argument("-s", "--save", default=None)
    args = parser.parse_args()

    # get design_list and resource_list given args:
    # if it ends w/ .json then read from the json, otherwise just use the arg
    with open(args.json) as f:
        json_info = json.load(f)
    graph_info = parse_json(json_info)

    resource_graph_data = {}
    get_graph_data(
        graph_info["resource_inputs"],
        graph_info["benchmarks_resources"],
        graph_info["resources"],
        resource_graph_data,
    )
    cycle_graph_data = []
    # print(graph_info["cycle_inputs"])
    # print(graph_info["benchmarks_cycles"])
    get_graph_cycles(
        graph_info["cycle_inputs"],
        graph_info["benchmarks_cycles"],
        cycle_graph_data,
    )

    geo_mean_data = []

    for setting, geo_mean in get_geo_means(
        graph_info["standard_version"], cycle_graph_data
    ).items():
        # geo_mean - 1 bc graph will start at 1
        geo_mean_data.append(["Cycles", setting, geo_mean - 1])
    for resource, resource_usage_data in resource_graph_data.items():
        for setting, geo_mean in get_geo_means(
            graph_info["standard_version"], resource_usage_data
        ).items():
            # geo_mean - 1 bc graph will start at 1
            geo_mean_data.append([resource, setting, geo_mean - 1])
        # geo_mean_data[resource] = standardize_results(
        #     graph_info["standard_version"], resource_usage_data
        # )

    print(geo_mean_data)

    fig = plt.figure(figsize=(10, 7))
    df = pd.DataFrame(geo_mean_data, columns=["x", "legend", "y"])

    ax = sns.barplot(
        x="x",
        y="y",
        hue="legend",
        data=df,
        errorbar=None,
        bottom=1,
    )

    sns.move_legend(
        ax,
        "upper right",
        bbox_to_anchor=(graph_info["legend_pos"][0], graph_info["legend_pos"][1]),
    )
    # for legend text
    plt.setp(ax.get_legend().get_texts(), fontsize=20)
    # for legend title
    plt.setp(ax.get_legend().get_title(), fontsize=26)
    plt.xlabel(graph_info["x"], fontsize=30)
    plt.ylabel(graph_info["y"], fontsize=30)
    plt.title("", fontsize=20)
    plt.tick_params(axis="both", which="major", labelsize=14)
    plt.xticks(fontsize=20)
    plt.yticks(fontsize=20)
    plt.legend(title="Compilation Settings")
    if graph_info.get("hide_legend", False):
        # hacky way to get rid of legend
        plt.legend([], [], frameon=False)
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
