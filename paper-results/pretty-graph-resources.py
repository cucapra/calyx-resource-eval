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


def standardize_results(benchmark_version, data):
    standardized_data = {}
    for resource, resource_usage_data in data.items():
        # maps design -> resource usage for the benchmark version
        raw_benchmark_data = {}
        resource_standardized_data = []
        for data_item in resource_usage_data:
            if benchmark_version in data_item[0]:
                # setting design = resource usage
                raw_benchmark_data[data_item[1]] = data_item[2]
        for data_item in resource_usage_data:
            benchmark_usage = raw_benchmark_data[data_item[1]]
            resource_standardized_data.append(
                [data_item[0], data_item[1], data_item[2] / benchmark_usage]
            )
        standardized_data[resource] = resource_standardized_data
    return standardized_data


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Process args for resource estimates")
    parser.add_argument("-j", "--json", default="graph-inputs/full-graph-input.json")
    parser.add_argument("-s", "--save", action="store_true")  # on/off flag
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
        graph_data = standardize_results(graph_info["standard_version"], graph_data)

    for resource, resource_usage_data in graph_data.items():
        # create a separate graph for each resource used
        fig = plt.figure(figsize=(10, 8))
        df = pd.DataFrame(
            resource_usage_data, columns=["Setting", "Benchmark Name", "Usage"]
        )
        ax = sns.barplot(
            x="Benchmark Name",
            y="Usage",
            hue="Setting",
            data=df,
            errorbar=None,
        )
        ax.set(title=f"""{resource} Usage""")
        sns.move_legend(ax, "upper right", bbox_to_anchor=(1.1, 1.1))
        plt.xticks(rotation=90)
        if args.save:
            # only save graph if specified in cmdline arguments
            if not os.path.exists("graphs"):
                os.makedirs("graphs")
                # can save figure if we want
            fig.savefig(
                f"""graphs/{resource}-usage-{args.json}.png""",
                bbox_inches="tight",
            )
        plt.show()
