# calyx-resource-eval
Evaluation for Calyx/Piezo

## Creating a virtual environment
```
python -m venv piezo
source piezo/bin/activate
pip3 install -r requirements.txt
```

## Dahlia Polybench Evaluation
```
cd paper-results/dahlia-polybench
source scripts/polybench_calyx.sh
```

## Dahlia Polybench Graphs
```
cd paper-results/dahlia-polybench
python3 dahlia_polybench_graph.py
```

## Systolic Evaluation
```
cd paper-results/systolic
python3 drive.py -j simulation.json
python3 drive.py -j resources.json
```

## Systolic Graphs
```
cd paper-results
python3 pretty-graph-cycles.py -j cycles-systolic-mmult.json -s cycles-systolic-mmult
python3 pretty-graph-cycles.py -j cycles-systolic-relu.json  -s cycles-systolic-relu
python3 pretty-graph-resources.py -j resources-systolic-mmult.json -s resources-systolic-mmult
python3 pretty-graph-resources.py -j resources-systolic-relu.json -s resources-systolic-relu
```