from pathlib import Path
import json
import csv
import pandas as pd

# import numpy as np
import matplotlib
from scipy import stats
import seaborn as sns
import matplotlib.pyplot as plt

# matplotlib.rcParams["pdf.fonttype"] = 42
# matplotlib.rcParams["ps.fonttype"] = 42
# matplotlib.rcParams["text.usetex"] = True

# For debugging purposes
pd.set_option("display.max_rows", None)
pd.set_option("display.max_columns", None)

polybench_rename = {
    ("benchmark", "2mm"): "2mm",
    ("benchmark", "3mm"): "3mm",
    ("benchmark", "atax"): "ata",
    ("benchmark", "doitgen"): "dtg",
    ("benchmark", "gemm"): "gmm",
    ("benchmark", "gemver"): "gmv",
    ("benchmark", "gesummv"): "gev",
    ("benchmark", "gramschmidt"): "gmt",
    ("benchmark", "mvt"): "mvt",
    ("benchmark", "syr2k"): "s2k",
    ("benchmark", "syrk"): "sk",
    ("benchmark", "bicg"): "bcg",
    ("benchmark", "cholesky"): "cky",
    ("benchmark", "durbin"): "dbn",
    ("benchmark", "lu"): "lu",
    ("benchmark", "ludcmp"): "lcp",
    ("benchmark", "symm"): "sym",
    ("benchmark", "trisolv"): "tsv",
    ("benchmark", "trmm"): "trm",
}

polybench_order = [
    "2mm",
    "3mm",
    "ata",
    "dtg",
    "gmm",
    "gmv",
    "gev",
    "gmt",
    "mvt",
    "s2k",
    "sk",
    "bcg",
    "cky",
    "dbn",
    "lu",
    "lcp",
    "sym",
    "tsv",
    "trm",
]

resource_rename = {"lut": "LUT", "registers": "Register"}


def gather_json(directory, typ):
    with (directory / "data.csv").open("w") as csvfile:
        wr = csv.writer(csvfile, delimiter=",")
        wr.writerow(["benchmark", "type", "key", "value"])

        for bench in directory.glob("*.json"):
            benchname = bench.stem
            if "linear-algebra" in str(bench):
                benchname = bench.stem.split("-")[2]
            try:
                for key, value in json.load(bench.open()).items():
                    wr.writerow([benchname, typ, key, value])
            except json.JSONDecodeError as e:
                print(f"{bench} decode error: {e}")


def cleanup(df, rename, include):
    df = df.copy()
    # rename
    for (key_name, key), v in rename.items():
        df.loc[df[key_name] == key, key_name] = v

    # only keep things in include
    return df[df["key"].isin(include)].reset_index(drop=True)


def match(df, benchmark, typ):
    return df[(df["benchmark"] == benchmark) & (df["type"] == typ)]


def _row_math(df, top_key, bot_key, name, op):
    df = df.copy()
    for bench in df["benchmark"].unique():
        norm = match(df, bench, top_key).copy()
        top = match(df, bench, top_key)["value"]
        bot = match(df, bench, bot_key)["value"]
        if len(top.values) == len(bot.values):
            norm["value"] = op(top.values, bot.values)
            norm["type"] = name
            df = pd.concat([df, norm])
    return df


def norm(df, top_key, bot_key, name):
    return _row_math(df, top_key, bot_key, name, lambda a, b: a / b)


def pivot_and_order(df, order):
    df = df.pivot(
        index=["benchmark", "type"], columns="key", values="value"
    ).reset_index()
    df["benchmark"] = pd.Categorical(df["benchmark"], order)
    return df


def apply_legend(df, name, legend):
    df = df.copy()
    df = df[df[name].isin(list(legend.keys()))]
    df[name] = df[name].apply(lambda x: legend[x])
    return df


def polybench_cycles_graph(polybench, fig_fontsize, legend_fontsize):
    # figure 6 font settings
    legend = {"norm-futil": "Calyx", "norm-piezo": "Piezo"}

    df = polybench[polybench["type"].isin(["norm-futil", "norm-piezo"])]
    df = df.copy()
    df["latency-1"] = df["latency"] - 1
    g = sns.catplot(
        x="benchmark",
        y="latency-1",
        hue="type",
        data=apply_legend(df, "type", legend),
        kind="bar",
        palette="muted",
        legend=False,
        bottom=1,
    )
    g.despine(left=True)
    g.set_ylabels("Simulation Cycle Slowdown", fontsize=fig_fontsize)
    g.set_xlabels("", fontsize=fig_fontsize)
    g.set_xticklabels(fontsize=fig_fontsize, rotation=90)
    g.axes[0, 0].legend(loc="upper left", fontsize=legend_fontsize).set_title("")
    g.fig.set_size_inches(10, 5)
    g.axes[0, 0].axhline(1, color="gray", linewidth=0.5)

    plt.yscale("log", base=2)
    plt.ylim([1 / 8, 4])
    plt.yticks(fontsize=fig_fontsize)
    g.axes[0, 0].get_yaxis().set_major_formatter(
        matplotlib.ticker.FuncFormatter(lambda x, pos: f"{1/x:.9g}")
    )

    from scipy import stats

    df_futil = df[df["type"].str.contains("norm-futil")]
    df_piezo = df[df["type"].str.contains("norm-piezo")]
    gmean_futil = stats.gmean(df_futil["latency"])
    gmean_piezo = stats.gmean(df_piezo["latency"])
    print(f"Gmean Cycles Calyx: {gmean_futil}")
    print(f"Gmean Cycles Piezo: {gmean_piezo}")
    g.axes[0, 0].axhline(
        gmean_futil, color="black", linestyle="dashed", label="Geo Mean"
    )
    g.axes[0, 0].axhline(
        gmean_piezo, color="black", linestyle="dashed", label="Geo Mean"
    )
    plt.text(12, gmean_futil - 0.055, "Geo Mean Calyx", fontsize=20)
    plt.text(12, gmean_piezo + 0.025, "Geo Mean Piezo", fontsize=20)
    plt.show()
    g.savefig("graphs/dahlia_polybench_cycles.pdf")


def polybench_resources_graph(polybench, fig_fontsize, resource):
    sns.set_theme(style="whitegrid")
    legend = {"norm-futil": "Calyx", "norm-piezo": "Piezo"}
    df = polybench[polybench["type"].isin(["norm-futil", "norm-piezo"])]
    df[f"{resource}-1"] = df[resource] - 1
    g = sns.catplot(
        x="benchmark",
        y=f"{resource}-1",
        hue="type",
        data=apply_legend(df, "type", legend),
        kind="bar",
        palette="muted",
        legend=False,
        bottom=1,
    )
    g.despine(left=True)
    g.set_ylabels(f"{resource_rename[resource]} Increase Factor", fontsize=fig_fontsize)
    g.set_xlabels("", fontsize=fig_fontsize)
    g.set_xticklabels(fontsize=fig_fontsize, rotation=90)
    # g.axes[0,0].legend(loc='upper left', fontsize=legend_fontsize).set_title('')
    g.axes[0, 0].axhline(1, color="gray", linewidth=0.5)
    g.figure.set_size_inches(10, 5)

    plt.yscale("log", base=2)
    plt.yticks(fontsize=fig_fontsize)
    g.axes[0, 0].get_yaxis().set_major_formatter(
        matplotlib.ticker.FuncFormatter(lambda x, pos: f"{1/x:.3g}")
    )
    plt.ylim([1 / 8, 4])

    from scipy import stats

    df_futil = df[df["type"].str.contains("norm-futil")]
    df_piezo = df[df["type"].str.contains("norm-piezo")]
    gmean_futil = stats.gmean(df_futil[resource])
    gmean_piezo = stats.gmean(df_piezo[resource])
    print("Gmean LUT Calyx: ", gmean_futil)
    print("Gmean LUT Piezo: ", gmean_piezo)
    g.axes[0, 0].axhline(
        gmean_futil, color="black", linestyle="dashed", label="Geo Mean"
    )
    g.axes[0, 0].axhline(
        gmean_piezo, color="black", linestyle="dashed", label="Geo Mean"
    )
    plt.text(12, gmean_futil - 0.15, "Geo Mean Calyx", fontsize=20)
    plt.text(7.5, gmean_piezo + 0.075, "Geo Mean Piezo", fontsize=20)
    plt.show()
    g.savefig(f"graphs/dahlia_polybench_{resource}.pdf")


def futil_phases_cycles_graph(polybench, fig_fontsize, legend_fontsize):
    # figure 6 font settings
    legend = {
        "norm-sh": "SH",
        "norm-sh-sc": "SH→SC",
        "norm-sc": "SC",
    }

    df = polybench[polybench["type"].isin(["norm-sh", "norm-sh-sc", "norm-sc"])]
    df["latency-1"] = df["latency"] - 1
    g = sns.catplot(
        x="benchmark",
        y="latency-1",
        hue="type",
        data=apply_legend(df, "type", legend),
        kind="bar",
        palette="muted",
        legend=False,
        bottom=1,
    )
    g.despine(left=True)
    g.set_ylabels("Simulation Cycle Slowdown", fontsize=fig_fontsize)
    g.set_xlabels("", fontsize=fig_fontsize)
    g.set_xticklabels(fontsize=fig_fontsize, rotation=90)
    g.axes[0, 0].legend(loc="upper left", fontsize=legend_fontsize).set_title("")
    g.figure.set_size_inches(10, 5)
    g.axes[0, 0].axhline(1, color="gray", linewidth=0.5)

    # plt.yscale('log', base=2)
    plt.yticks([0.5, 0.75, 1, 1.25], fontsize=fig_fontsize)
    g.axes[0, 0].get_yaxis().set_major_formatter(
        matplotlib.ticker.FuncFormatter(lambda x, pos: f"{1/x:.3g}")
    )
    # plt.ylim([0.75, 2.25])

    # from scipy import stats
    df_sh = df[df["type"].str.contains("norm-sh")]
    df_sh_sc = df[df["type"].str.contains("norm-sh-sc")]
    # Shoudl be identical to sc_sh
    df_sc = df[df["type"].str.contains("norm-sc")]

    gmean_sh = stats.gmean(df_sh["latency"])
    gmean_sh_sc = stats.gmean(df_sh_sc["latency"])
    gmean_sc = stats.gmean(df_sc["latency"])

    print("Gmean Cycles SH: ", gmean_sh)
    print("Gmean Cycles SH->SC: ", gmean_sh_sc)
    print("Gmean Cycles SC: ", gmean_sc)
    g.axes[0, 0].axhline(gmean_sh, color="black", linestyle="dashed", label="Geo Mean")
    g.axes[0, 0].axhline(
        gmean_sh_sc, color="black", linestyle="dashed", label="Geo Mean"
    )
    plt.text(12, gmean_sh - 0.055, "Geo Mean SH", fontsize=20)
    plt.text(11, gmean_sh_sc + 0.015, "Geo Mean SH→SC", fontsize=20)
    plt.show()
    g.savefig("graphs/futil_ordering_cycles.pdf")


def futil_phases_resources_graph(polybench, fig_fontsize, legend_fontsize, resource):
    # figure 6 font settings
    legend = {
        "norm-sh": "SH",
        "norm-sh-sc": "SH→SC",
        "norm-sc": "SC",
    }

    df = polybench[polybench["type"].isin(["norm-sh", "norm-sh-sc", "norm-sc"])]
    df[f"{resource}-1"] = df[resource] - 1
    g = sns.catplot(
        x="benchmark",
        y=f"{resource}-1",
        hue="type",
        data=apply_legend(df, "type", legend),
        kind="bar",
        palette="muted",
        legend=False,
        bottom=1,
    )
    g.despine(left=True)
    g.set_ylabels(f"{resource_rename[resource]} Increase Factor", fontsize=fig_fontsize)
    g.set_xlabels("", fontsize=fig_fontsize)
    g.set_xticklabels(fontsize=fig_fontsize, rotation=90)
    # g.axes[0,0].legend(loc='lower left', fontsize=legend_fontsize).set_title('')
    g.axes[0, 0].axhline(1, color="gray", linewidth=0.5)
    g.figure.set_size_inches(10, 5)

    plt.yticks([0.5, 0.75, 1, 1.25], fontsize=fig_fontsize)
    g.axes[0, 0].get_yaxis().set_major_formatter(
        matplotlib.ticker.FuncFormatter(lambda x, pos: f"{1/x:.3g}")
    )

    # from scipy import stats
    df_sh = df[df["type"].str.contains("norm-sh")]
    df_sh_sc = df[df["type"].str.contains("norm-sh-sc")]
    df_sc = df[df["type"].str.contains("norm-sc")]

    gmean_sh = stats.gmean(df_sh[resource])
    gmean_sh_sc = stats.gmean(df_sh_sc[resource])
    gmean_sc = stats.gmean(df_sc[resource])

    print(f"Gmean SH {resource}: {gmean_sh}")
    print(f"Gmean SH->SC {resource}: {gmean_sh_sc}")
    print(f"Gmean SC {resource}: {gmean_sc}")
    g.axes[0, 0].axhline(gmean_sh, color="black", linestyle="dashed", label="Geo Mean")
    g.axes[0, 0].axhline(
        gmean_sh_sc, color="black", linestyle="dashed", label="Geo Mean"
    )
    g.axes[0, 0].axhline(gmean_sc, color="black", linestyle="dashed", label="Geo Mean")
    # plt.text(10, gmean_sh-0.055, "Geo Mean SH", fontsize=20)

    # Text Placement for LUT
    if resource == "lut":
        plt.text(7.9, gmean_sh_sc + 0.015, "Geo Mean SH→SC and SH", fontsize=20)
        plt.text(4, gmean_sc - 0.04, "Geo Mean SC", fontsize=20)
    elif resource == "registers":
        plt.text(9.45, gmean_sh_sc + 0.015, "Geo Mean SH→SC and SH", fontsize=20)
        plt.text(0.7, gmean_sc - 0.075, "Geo Mean SC", fontsize=20)

    plt.show()
    g.savefig(f"graphs/futil_ordering_{resource}.pdf")


if __name__ == "__main__":
    gather_json(Path("results/results-asplos21/standard/hls/"), "hls")

    gather_json(Path("results/results-asplos21/standard/futil/"), "futil")
    gather_json(Path("results/results-asplos21/standard/futil-latency/"), "futil")

    gather_json(Path("results/results-static-calyx/futil-sc-sh/"), "futil-sc-sh")
    gather_json(
        Path("results/results-static-calyx/futil-sc-sh-latency/"), "futil-sc-sh"
    )

    gather_json(Path("results/results-static-calyx/futil-sc/"), "futil-sc")
    gather_json(Path("results/results-static-calyx/futil-sc-latency/"), "futil-sc")

    gather_json(Path("results/results-static-calyx/futil-sh/"), "futil-sh")
    gather_json(Path("results/results-static-calyx/futil-sh-latency/"), "futil-sh")

    gather_json(Path("results/results-static-calyx/futil-sh-sc/"), "futil-sh-sc")
    gather_json(
        Path("results/results-static-calyx/futil-sh-sc-latency/"), "futil-sh-sc"
    )

    standard_hls = pd.read_csv("results/results-asplos21//standard/hls/data.csv")

    standard_futil = pd.read_csv("results/results-asplos21//standard/futil/data.csv")
    standard_futil_lat = pd.read_csv(
        "results/results-asplos21//standard/futil-latency/data.csv"
    )

    sc_sh_futil = pd.read_csv("results/results-static-calyx/futil-sc-sh/data.csv")
    sc_sh_futil_lat = pd.read_csv(
        "results/results-static-calyx/futil-sc-sh-latency/data.csv"
    )

    sc_futil = pd.read_csv("results/results-static-calyx/futil-sc/data.csv")
    sc_futil_lat = pd.read_csv("results/results-static-calyx/futil-sc-latency/data.csv")

    sh_futil = pd.read_csv("results/results-static-calyx/futil-sh/data.csv")
    sh_futil_lat = pd.read_csv("results/results-static-calyx/futil-sh-latency/data.csv")

    sh_sc_futil = pd.read_csv("results/results-static-calyx/futil-sh-sc/data.csv")
    sh_sc_futil_lat = pd.read_csv(
        "results/results-static-calyx/futil-sh-sc-latency/data.csv"
    )

    polybench_raw = pd.concat(
        [standard_hls, standard_futil, standard_futil_lat, sc_sh_futil, sc_sh_futil_lat]
    )

    futil_phases_raw = pd.concat(
        [
            sc_sh_futil,
            sc_sh_futil_lat,
            sc_futil,
            sc_futil_lat,
            sh_futil,
            sh_futil_lat,
            sh_sc_futil,
            sh_sc_futil_lat,
        ]
    )

    polybench = cleanup(
        polybench_raw,
        {("key", "avg_latency"): "latency", **polybench_rename},
        ["dsp", "lut", "latency"],
    )
    polybench = norm(polybench, "hls", "futil-sc-sh", "norm-piezo")
    polybench = norm(polybench, "hls", "futil", "norm-futil")
    polybench = pivot_and_order(polybench, polybench_order)

    futil_phases = cleanup(
        futil_phases_raw,
        {("key", "avg_latency"): "latency", **polybench_rename},
        ["dsp", "lut", "registers", "latency"],
    )
    futil_phases = norm(futil_phases, "futil-sc-sh", "futil-sc", "norm-sc")
    futil_phases = norm(futil_phases, "futil-sc-sh", "futil-sh", "norm-sh")
    futil_phases = norm(futil_phases, "futil-sc-sh", "futil-sh-sc", "norm-sh-sc")
    futil_phases = pivot_and_order(futil_phases, polybench_order)

    print("Comparison relative to Vitis HLS")
    polybench_cycles_graph(polybench=polybench, fig_fontsize=27, legend_fontsize=24)
    polybench_resources_graph(polybench=polybench, fig_fontsize=27, resource="lut")

    print("\nComparison relative to SC->SH ordering")
    futil_phases_cycles_graph(
        polybench=futil_phases, fig_fontsize=27, legend_fontsize=24
    )
    futil_phases_resources_graph(
        polybench=futil_phases, fig_fontsize=27, legend_fontsize=24, resource="lut"
    )
    futil_phases_resources_graph(
        polybench=futil_phases,
        fig_fontsize=27,
        legend_fontsize=24,
        resource="registers",
    )
