# calyx-resource-eval
Evaluation for Calyx/Piezo

You first have to install and build Calyx and fud (including the Xilinx tools).
You also need Python (I used 3.10.12 but I think other versions should work).

## Creating a virtual environment
```
python3 -m venv piezo
source piezo/bin/activate
pip3 install -r requirements.txt
```
note: weirdly `calyx-py` wasn't working until I did only `flit install` (no symlink).

## Dahlia Polybench Evaluation
To remove existing results:
```
rm -rf dahlia-polybench/results/results-static-calyx
```
```
cd dahlia-polybench
source scripts/polybench_calyx.sh
```

## Dahlia Polybench Graphs
```
cd dahlia-polybench
python3 dahlia_polybench_graph.py
```

## Systolic Evaluation
```
cd piezo-systolic/systolic
python3 drive.py -j simulation.json
python3 drive.py -j resources.json
```

## Systolic Graphs
```
cd piezo-systolic
python3 pretty-graph-cycles.py -j cycles-systolic-mmult.json -s cycles-systolic-mmult
python3 pretty-graph-cycles.py -j cycles-systolic-relu.json  -s cycles-systolic-relu
python3 pretty-graph-resources.py -j resources-systolic-mmult.json -s resources-systolic-mmult
python3 pretty-graph-resources.py -j resources-systolic-relu.json -s resources-systolic-relu
```

## Packet Scheduler Evaluation
```
cd sdn
./scripts/sdn_four_ways.sh
```