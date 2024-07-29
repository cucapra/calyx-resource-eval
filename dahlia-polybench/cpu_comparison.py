import os
import csv
from collections import defaultdict
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import gmean

# Define the directory containing the CSV files
CPU_DIRECTORY = "cpp_benchmarks_O3"


def extend_csv_with_benchmarks(latency_csv, resource_csv, target_csv):
    # Read the source CSV and create a dictionary mapping benchmark to values
    benchmark_to_latency = {}

    with open(latency_csv, newline="") as src_file:
        reader = csv.DictReader(src_file)

        for row in reader:
            benchmark = row["benchmark"]
            value = row["value"]
            benchmark_to_latency[benchmark] = float(value)

    benchmark_to_period = {}
    benchmark_to_ws = {}
    with open(resource_csv, newline="") as src_file:
        reader = csv.DictReader(src_file)

        for row in reader:
            benchmark = row["benchmark"]
            if row["key"] == "period":
                value = row["value"]
                benchmark_to_period[benchmark] = float(value)
            if row["key"] == "worst_slack":
                value = row["value"]
                benchmark_to_ws[benchmark] = float(value)

    benchmark_to_ns = defaultdict(list)
    for benchmark, latency in benchmark_to_latency.items():
        ns = (benchmark_to_period[benchmark] - benchmark_to_ws[benchmark]) * latency
        benchmark_to_ns[benchmark].append(ns)

    max_freq_list = []
    for benchmark, latency in benchmark_to_latency.items():
        min_period = benchmark_to_period[benchmark] - benchmark_to_ws[benchmark]
        max_freq_list.append(1000 / min_period)
    gmean_max_freq = gmean(max_freq_list)
    print(f"Geo Mean Max Freq: {gmean_max_freq}")

    # Read the target CSV into a list of rows
    with open(target_csv, newline="") as tgt_file:
        target_rows = list(csv.reader(tgt_file))

    # Update the target rows with the new values from the source CSV
    for row in target_rows:
        if row and row[0] in benchmark_to_ns:
            row.extend(benchmark_to_ns[row[0]])

    # Write the updated rows back to the target CSV
    with open(target_csv, "w", newline="") as tgt_file:
        writer = csv.writer(tgt_file)
        writer.writerows(target_rows)


def plot_graphs(csv_file):
    df = pd.read_csv(csv_file)

    # Compute the FPGA:CPU ratio
    df["ratio"] = df["fpga_estimation"] / df["cpu_average"]

    # Compute the geometric mean of the ratios
    geometric_mean = gmean(df["ratio"])
    print(f"Geometric Mean of FPGA:CPU ratios of {CPU_DIRECTORY}: {geometric_mean}")

    # Plotting the results
    benchmarks = df["benchmark"]
    cpu_values = np.ones(len(df))  # CPU values as a line at y=1
    fpga_values = df["ratio"]  # FPGA values as bars

    plt.figure(figsize=(10, 6))

    # Plot CPU values as a line
    plt.plot(
        benchmarks, cpu_values, label="CPU", color="blue", linestyle="-", linewidth=2
    )

    # Plot FPGA values as bars
    plt.bar(benchmarks, fpga_values, label="FPGA", color="orange", alpha=0.7)

    # Adding titles and labels
    plt.title("FPGA:CPU Relative Performance")
    plt.xlabel("Benchmark")
    plt.ylabel("Ratio (FPGA/CPU)")
    plt.xticks(
        rotation=45, ha="right"
    )  # Rotate benchmark labels for better readability
    plt.axhline(
        y=1, color="grey", linestyle="--", linewidth=0.5
    )  # Add a horizontal line at y=1 for reference
    plt.legend()

    # Show the plot
    plt.tight_layout()

    # plt.savefig(f"fpga_cpu_performance_{CPU_DIRECTORY}.pdf", format="pdf")

    plt.show()


if __name__ == "__main__":
    # Initialize lists to hold the first and second rows
    first_rows = []
    second_rows = [["benchmark", "cpu_average", "fpga_estimation"]]

    # Iterate through all the files in the directory
    for filename in os.listdir(CPU_DIRECTORY):
        if filename.endswith(".csv"):
            filepath = os.path.join(CPU_DIRECTORY, filename)
            if "linear-algebra" in str(filename):
                benchname = filename.split("-")[2].split(".")[0]

            with open(filepath, newline="") as csvfile:
                reader = csv.reader(csvfile)
                rows = list(reader)

                if len(rows) >= 2:  # Ensure there are at least two rows
                    first_rows.append([benchname] + rows[0])
                    second_rows.append([benchname] + rows[1])
                else:
                    raise Exception("Expected 2 rows in CSV")

    # Write the first rows to a new CSV file
    with open(f"cpu_all_runs_{CPU_DIRECTORY}.csv", "w", newline="") as csvfile:
        writer = csv.writer(csvfile)
        writer.writerows(first_rows)

    # Write the first rows to a new CSV file
    with open(f"cpu_averages_{CPU_DIRECTORY}.csv", "w", newline="") as csvfile:
        writer = csv.writer(csvfile)
        writer.writerows(second_rows)

    extend_csv_with_benchmarks(
        "results/results-static-calyx/futil-sc-sh-latency/data.csv",
        "results/results-static-calyx/futil-sc-sh/data.csv",
        f"cpu_averages_{CPU_DIRECTORY}.csv",
    )

    # plot_graphs(f"cpu_averages_{CPU_DIRECTORY}.csv")
