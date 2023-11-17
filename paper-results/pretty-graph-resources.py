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
from pretty_graph_utils import standardize_results, get_geo_means

sns.set_theme()


def hard_coded_sort(input):
    """
    Very hacky sorting for the graph
    """
    base = 0
    if input[0] == "Calyx":
        base = -100
    if input[0] == "Piezo (flexible dimensions)":
        base = 0
    if input[0] == "Piezo (fixed dimensions)":
        base = 100
    handicap = int(input[1].split("x")[0])
    return base + handicap


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
    dic["sort"] = input.get("sort", False)
    dic["x"] = json_info["x"]
    dic["y_pref"] = json_info.get("y_pref", "")
    dic["legend"] = json_info["legend"]
    dic["legend_pos"] = json_info["legend_pos"]
    dic["bar_color"] = json_info.get("bar_color", None)
    dic["hide_legend"] = json_info.get("hide_legend", False)
    dic["palette"] = json_info.get("palette", None)
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

    graph_data = {}
    get_graph_data(
        graph_info["resource_inputs"],
        graph_info["benchmarks"],
        graph_info["resources"],
        graph_data,
    )

    if graph_info["standard_version"] is not None:
        standardized_data = {}
        for resource, resource_usage_data in graph_data.items():
            print(get_geo_means(graph_info["standard_version"], resource_usage_data))
            standardized_data[resource] = standardize_results(
                graph_info["standard_version"], resource_usage_data
            )
        graph_data = standardized_data

    for resource, resource_usage_data in graph_data.items():
        # create a separate graph for each resource used
        if graph_info["sort"]:
            resource_usage_data.sort(key=hard_coded_sort)
        fig = plt.figure(figsize=(10, 7))
        df = pd.DataFrame(
            resource_usage_data,
            columns=["legend", "x", "y"],
        )

        if graph_info["standard_version"] is not None:
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
            palette=graph_info["palette"],
        )

        plt.legend(title=json_info["legend"])
        sns.move_legend(
            ax,
            "upper right",
            bbox_to_anchor=(json_info["legend_pos"][0], json_info["legend_pos"][1]),
        )
        # for legend text
        plt.setp(ax.get_legend().get_texts(), fontsize=json_info["legend_font_size"][1])
        # for legend title
        plt.setp(ax.get_legend().get_title(), fontsize=json_info["legend_font_size"][0])

        plt.xlabel(json_info["x"], fontsize=30)
        pref = graph_info["y_pref"]
        plt.ylabel(f"{pref}{resource} Usage", fontsize=30)
        plt.title("", fontsize=20)
        plt.tick_params(axis="both", which="major", labelsize=14)
        plt.xticks(rotation=json_info["x_ticks"][0], fontsize=json_info["x_ticks"][1])
        plt.yticks(fontsize=20)
        if graph_info["hide_legend"]:
            # hacky way to get rid of legend
            plt.legend([], [], frameon=False)
        if args.save:
            # only save graph if specified in cmdline arguments
            if not os.path.exists("graphs"):
                os.makedirs("graphs")
                # can save figure if we want
            fig.savefig(
                f"""graphs/{args.save}-{resource}.png""",
                bbox_inches="tight",
            )
        plt.show()
