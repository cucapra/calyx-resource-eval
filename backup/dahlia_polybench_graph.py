
from pathlib import Path
import json
import csv
import pandas as pd
import numpy as np
import matplotlib
import seaborn as sns
import matplotlib.pyplot as plt

matplotlib.rcParams['pdf.fonttype'] = 42
matplotlib.rcParams['ps.fonttype'] = 42
matplotlib.rcParams['text.usetex'] = True

polybench_rename = {
    ('benchmark', '2mm'): '2mm',
    ('benchmark', '3mm'): '3mm',
    ('benchmark', 'atax'): 'ata',
    ('benchmark', 'doitgen'): 'dtg',
    ('benchmark', 'gemm'): 'gmm',
    ('benchmark', 'gemver'): 'gmv',
    ('benchmark', 'gesummv'): 'gev',
    ('benchmark', 'gramschmidt'): "gmt",
    ('benchmark', 'mvt'): "mvt",
    ('benchmark', 'syr2k'): "s2k",
    ('benchmark', 'syrk'): "sk",
    ('benchmark', 'bicg'): "bcg",
    ('benchmark', 'cholesky'): "cky",
    ('benchmark', 'durbin'): "dbn",
    ('benchmark', 'lu'): "lu",
    ('benchmark', 'ludcmp'): "lcp",
    ('benchmark', 'symm'): "sym",
    ('benchmark', 'trisolv'): "tsv",
    ('benchmark', 'trmm'): "trm"
}

polybench_order = [
    '2mm', '3mm', 'ata',
    'dtg', 'gmm', 'gmv',
    'gev', "gmt", "mvt",
    "s2k", "sk", "bcg",
    "cky", "dbn", "lu",
    "lcp", "sym", "tsv",
    "trm"
]


def gather_json(directory, typ):
  with (directory / 'data.csv').open('w') as csvfile:
      wr = csv.writer(csvfile, delimiter=',')
      wr.writerow(['benchmark', 'type', 'key', 'value'])

      for bench in directory.glob("*.json"):
          benchname = bench.stem
          if 'linear-algebra' in str(bench):
              benchname = bench.stem.split('-')[2]
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
    return df[df['key'].isin(include)].reset_index(drop=True)

def match(df, benchmark, typ):
    return df[(df['benchmark'] == benchmark) & (df['type'] == typ)]

def _row_math(df, top_key, bot_key, name, op):
    df = df.copy()
    for bench in df['benchmark'].unique():
        norm = match(df, bench, top_key).copy()
        top = match(df, bench, top_key)['value']
        bot = match(df, bench, bot_key)['value']
        if len(top.values) == len(bot.values):
            norm['value'] = op(top.values,bot.values)
            norm['type'] = name
            df = df.append(norm)
    return df

def norm(df, top_key, bot_key, name):
    return _row_math(df, top_key, bot_key, name, lambda a, b: a / b)

def pivot_and_order(df, order):
    df = df.pivot(index=['benchmark', 'type'], columns='key', values='value').reset_index()
    df['benchmark'] = pd.Categorical(df['benchmark'], order)
    return df

def apply_legend(df, name, legend):
    df = df.copy()
    df = df[df[name].isin(list(legend.keys()))]
    df[name] = df[name].apply(lambda x: legend[x])
    return df

def polybench_cycles_graph(polybench, fig_fontsize, legend_fontsize):
  # figure 6 font settings
  legend = {
    'norm-futil': 'Calyx',
    'norm-piezo': 'Piezo'
  }

  df = polybench[polybench['type'].isin(['norm-futil', 'norm-piezo'])]
  df['latency-1'] = df['latency'] - 1
  g = sns.catplot(
      x="benchmark",
      y="latency-1",
      hue="type",
      data=apply_legend(df, 'type', legend),
      kind="bar",
      palette="muted",
      legend=False,
      bottom=1
  )
  g.despine(left=True)
  g.set_ylabels("Simulation Cycle Slowdown", fontsize=fig_fontsize)
  g.set_xlabels("", fontsize=fig_fontsize)
  g.set_xticklabels(fontsize=fig_fontsize, rotation=90)
  g.axes[0,0].legend(loc='upper left', fontsize=legend_fontsize).set_title('')
  g.fig.set_size_inches(10,5)
  g.axes[0,0].axhline(1, color="gray", linewidth=0.5)

  plt.yscale('log', base=2)
  plt.ylim([1/8, 4])
  plt.yticks(fontsize=fig_fontsize)
  g.axes[0,0].get_yaxis().set_major_formatter(matplotlib.ticker.FuncFormatter(lambda x, pos: f"{1/x:.9g}"))

  from scipy import stats
  df_futil = df[df['type'].str.contains('norm-futil')]
  df_piezo = df[df['type'].str.contains('norm-piezo')]
  gmean_futil = stats.gmean(df_futil['latency'])
  gmean_piezo = stats.gmean(df_piezo['latency'])
  # print("Gmean: ", gmean)
  g.axes[0,0].axhline(gmean_futil, color="black", linestyle="dashed", label="Geo Mean")
  g.axes[0,0].axhline(gmean_piezo, color="black", linestyle="dashed", label="Geo Mean")
  plt.text(12, gmean_futil-0.055, "Geo Mean Futil", fontsize=20)
  plt.text(12, gmean_piezo+0.025, "Geo Mean Piezo", fontsize=20)
  plt.show()

def polybench_resources_graph(polybench, fig_fontsize):
  sns.set_theme(style="whitegrid")
  legend = {
      'norm-futil': 'Calyx',
      'norm-piezo': 'Piezo'
  }
  df = polybench[polybench['type'].isin(['norm-futil', 'norm-piezo'])]
  df['lut-1'] = df['lut'] - 1
  g = sns.catplot(
      x="benchmark",
      y="lut-1",
      hue="type",
      data=apply_legend(df, 'type', legend),
      kind="bar",
      palette="muted",
      legend=False,
      bottom=1
  )
  g.despine(left=True)
  g.set_ylabels("LUT Increase Factor", fontsize=fig_fontsize)
  g.set_xlabels("", fontsize=fig_fontsize)
  g.set_xticklabels(fontsize=fig_fontsize, rotation=90)
  # g.axes[0,0].legend(loc='upper left', fontsize=legend_fontsize).set_title('')
  g.axes[0,0].axhline(1, color="gray", linewidth=0.5)
  g.fig.set_size_inches(10,5)

  plt.yscale('log', base=2)
  plt.yticks(fontsize=fig_fontsize)
  g.axes[0,0].get_yaxis().set_major_formatter(matplotlib.ticker.FuncFormatter(lambda x, pos: f"{1/x:.3g}"))
  plt.ylim([1/8, 4])

  from scipy import stats
  df_futil = df[df['type'].str.contains('norm-futil')]
  df_piezo = df[df['type'].str.contains('norm-piezo')]
  gmean_futil = stats.gmean(df_futil['lut'])
  gmean_piezo = stats.gmean(df_piezo['lut'])
  # print("Gmean: ", gmean)
  g.axes[0,0].axhline(gmean_futil, color="black", linestyle="dashed", label="Geo Mean")
  g.axes[0,0].axhline(gmean_piezo, color="black", linestyle="dashed", label="Geo Mean")
  plt.text(12, gmean_futil-0.15, "Geo Mean Futil", fontsize=20)
  plt.text(7.5, gmean_piezo+0.075, "Geo Mean Piezo", fontsize=20)
  plt.show()


if __name__ == "__main__":
  gather_json(Path("results_asplos21/standard/hls/"), 'hls')
  gather_json(Path("results_asplos21/standard/futil/"), 'futil')
  gather_json(Path("results_asplos21/standard/futil-latency/"), 'futil')
  gather_json(Path("results/standard/futil-sc-sh/"), 'futil-sc-sh')
  gather_json(Path("results/standard/futil-sc-sh-latency/"), 'futil-sc-sh')
  standard_hls = pd.read_csv("results_asplos21/standard/hls/data.csv")
  standard_futil = pd.read_csv("results_asplos21/standard/futil/data.csv")
  standard_futil_lat = pd.read_csv("results_asplos21/standard/futil-latency/data.csv")
  sc_sh_futil = pd.read_csv("results/standard/futil-sc-sh/data.csv")
  sc_sh_futil_lat = pd.read_csv("results/standard/futil-sc-sh-latency/data.csv")
  polybench_raw = standard_hls.append(standard_futil).append(standard_futil_lat).append(sc_sh_futil).append(sc_sh_futil_lat).reset_index(drop=True)
  polybench = cleanup(polybench_raw, {
      ('key', 'avg_latency'): 'latency',
      **polybench_rename
  }, ['dsp', 'lut', 'latency'])
  polybench = norm(polybench, 'hls', 'futil-sc-sh', 'norm-piezo')
  polybench = norm(polybench, 'hls', 'futil', 'norm-futil')
  pd.set_option('display.max_rows', None)
  pd.set_option('display.max_columns', None)
  polybench = pivot_and_order(polybench, polybench_order)
  polybench_cycles_graph(polybench=polybench, fig_fontsize=27, legend_fontsize=24)
  # polybench_resources_graph(polybench=polybench, fig_fontsize=27)


