import numpy as np


def standardize_results(benchmark_version, data):
    """
    Standardizes the data
    """
    standardized_data = []
    # maps design -> resource usage for the benchmark version
    comparison_data = []
    standard_dic = {}
    standardized_data = []
    for data_item in data:
        if benchmark_version == data_item[0]:
            # for each benchmark, map to standardized cycles counts
            standard_dic[data_item[1]] = data_item[2]
        else:
            comparison_data.append(data_item)
    for data_item in comparison_data:
        standard_usage = standard_dic[data_item[1]]
        if data_item[2] is not None:
            standardized_data.append(
                [data_item[0], data_item[1], (data_item[2] / standard_usage) - 1]
            )
    return standardized_data


def get_geo_means(benchmark_version, data):
    """
    Prints the geometric means
    """
    # maps design -> resource usage for the benchmark version
    comparison_data = []
    standard_dic = {}
    standardized_data = {}
    for data_item in data:
        if benchmark_version == data_item[0]:
            # for each benchmark, map to standardized cycles counts
            standard_dic[data_item[1]] = data_item[2]
        else:
            comparison_data.append(data_item)
    for data_item in comparison_data:
        standard_usage = standard_dic[data_item[1]]
        if data_item[2] is not None:
            standardized_data.setdefault(data_item[0], []).append(
                data_item[2] / standard_usage
            )
    geo_mean_dic = {}
    for version, values in standardized_data.items():
        a = np.array(values)
        geo_mean_dic[version] = a.prod() ** (1.0 / len(a))
    return geo_mean_dic
