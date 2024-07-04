# Static Calyx Eval
Evaluation for Static Calyx (aka Piezo). 

# Introduction 

The purpose of the artifact is to support the main claims made in our paper, in particular sections 6 and 7 (the evaluation sections). 

We make the following claims, all of which our artifact can help reproduce: 
- We compare Piezo (our new system) against Calyx (the original system we built off) and Vitis HLS on Polybench benchmarks in terms of latency (cycle counts) and LUTs. See Figure 6. 
- We examine effects of the ordering of different optimization passes on Piezo's performance on Polybench benchmarks in terms of latency (cycle counts), LUTs, and register usage. See Figure 7. 
- We examine of certain optimizations on Piezo's performance on a PIFO tree packet scheduler. See table of section 6.2. 
- We compare Piezo's systolic array generator with Calyx's systolic array generator in terms of latency (cycle counts) and max frequency. See paragraph "Effect of Pipelining" in section 7.2.
- We comapre Piezo's systolic array generator's performance using fixed contraction dimension vs. a flexible contraction dimension in terms of latency (cycle counts), LUTs, and register usage. See paragraph "Configurable Matrix Dimensions" in section 7.2.  
- We compare  Piezo's systolic array generator's performance on differently implemented post operations. See Figure 10 in the paper. 

briefly explain the purpose of the artifact and how it supports the paper. We recommend listing all claims in the paper and stating whether or not each is supported. For supported claims, say how the artifact provides support. For unsupported claims, explain why they are omitted.

# Hardware Dependencies 

# Getting Started 

# Step-by-Step Instructions

# Reusability Guide

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

## Running Old Calyx Systolic Arrays
(assumes you have checked out to 9e15fe00)

Just compute
```
fud e --to dat --from futil -s verilog.data input-data/calyx-data/16-compute.json -q max-freq-inputs/calyx/16-comp.futil -s futil.flags "-d minimize-regs" -o simulation/calyx-mmult/16-compute.json
```

compute and write
```
fud e --to dat --from futil -s verilog.data input-data/calyx-data/16-unbanked.json -q max-freq-inputs/calyx/16.futil -s futil.flags "-d minimize-regs" -o simulation/calyx-mmult/16.json
```

check
```
python3 check_mmult_output.py -j simulation/calyx-mmult/16.json
```

calyx max freq
```
fud e -q max-freq-inputs/calyx/16-calyx.sv --to resource-estimate -o resources/max-freq-calyx/16.systolic.json -s synth-verilog.tcl synth-files/synth.tcl -s synth-verilog.constraints synth-files/device4.xdc --from synth-verilog
```
