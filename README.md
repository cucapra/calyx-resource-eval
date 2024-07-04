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

# Hardware Dependencies 
No specific hardware dependencies, although our evaluation uses Xilinx's Vivado tools to generate area and resource estimates. Unfortunately due to licensing restrictions, we can't distribute the VM with these tools installed. However, the tools are freely available and we provide instructions on how to install them (see "Getting Started" section). 

# Getting Started 
Our virtual machine has all dependencies apart from Xilinx's Vivado tools (see next paragraph). 
You can download our .ova file. (Link TK), and use import our VM on VirtualBox. 
username is "vboxuser", pw is "piezo". 

XXX(Caleb): copied these instructions over from Calyx repository.  

1. The desktop should have a file named: Xilinx Installer. Double click on this to launch the installer.
2. Ignore the warning and press Ok.
3. When the box pops up asking you for a new version, click Continue.
4. Enter your Xilinx credentials. If you don't have them, create a Xilinx account.
5. Note When you create an account, you need to fill out all the required information on your profile. Otherwise the Xilinx installer will reject your login.
6. The "User ID" is the email address of the Xilinx account you created.
7. Agree to the contract and press Next.
8. Choose Vivado and click Next.
9. Choose Vivado HL WebPACK and click Next.
10. Leave the defaults for selecting devices and click Next.
11. Important! Change the install path from /tools/Xilinx to /home/vboxuser/Xilinx.
12. Confirm that you want to create the directory.
13. Install. Depending on the speed of your connection, the whole process should take about 2 - 4 hrs.

# Step-by-Step Instructions
Our evaluation is broadly split into 3 parts: Polybench Kernels (section 6.1), PIFO Tree Packet Scheduler (section 6.2), and Systolic Arrays (section 7). 

The step-by-step guide is organized as follows: 
- Experimental data and graph generation: generate the graphs found in the paper using pre-supplied data.
  - Polybench graphs: comparison to Calyx/Vitis HLS (Figure 6) and comparison of different optimization pass orderings (Figure 7)
  - PIFO tree table (look at "Results" paragraph in section 6.2 for table)
  - Systolic array results (section 7.2, Figure 10).
- Data collection
  - Effects of different optimization pass orderings (6.1.2)
  - PIFO tree packet scheduler (6.2)
  - Systolic array results (7.2)

## Experimental Data and Graph Generation
Since the process to collecting data takes several hours, we will first regenerate the graphs presented in the paper from data already committed to the repository. The next section will demonstrate how to collect this data.

Open the File Explorer, go to `piezo-eval` directory and then `calyx-resource-eval` direcotry. Then select `Open in Terminal`.  

XXX(Caleb): things only work if I type this first:  
```
su - 
```
I have tried other solutions ([example](https://stackoverflow.com/questions/26740113/virtualbox-shared-folder-permissions)) but they haven't worked. 

Activate the Python virtual environment by running: 
```
source /opt/venv/bin/activate
```
Navigate to directory by: 
```
cd /home/vboxuser/piezo-eval/calyx-resource-eval
```

### Polybench (Section 6.1) 
To generate the **Polybench Graphs** (Figures 6 and 7), run this (there will be some warnings which you can ignore):  
```
cd dahlia-polybench && python3 dahlia_polybench_graph.py > gmeans.txt
```
Graphs should appear in `calyx-resource-eval/dahlia-polybench/graphs`. 
`dahlia_polybench_cycles.pdf` = Figure 6a, `dahlia_polybench_lut.pdf` = Figure 6b, `futil_ordering_cycles.pdf` = Figure 7a, `futil_ordering_lut.pdf` = Figure 7b, `futil_ordering_registers` = Figure 7c. 
`gemans.txt` should contain information about the geometric means: these numbers, in addition to being displayed visually on Figures 6 and 7, are referenceed throughout section 6.1 of our paper. 

### PIFO Trees (Section 6.2) 
To generate the **PIFO Tree Table** (from "Results" paragraph of Section 6.2): 
```
cd ../sdn && python3 make_table.py
```
The table should be seen in `table.csv`.  To look at the table you can just do `vi table.csv`. 

To generate the **Systolic Array Results** (from section 7.2): 
```
cd ../piezo-systolic/systolic
```

### Systolic Arrays (Section 7) 
There are 3 main claims we make in section 7.2: one per paragraph ("Effect of pipelining", "Configurable matrix dimensions", "Overhead of dynamic post operations").
For **"Effect of pipelining"**: run `python3 compare_vs_calyx.py`: you should see the claims made in the paper. 
This script simply looks through the following files: `resources/max-freq-calyx/16.systolic.json`, `resources/max-freq-piezo/16.systolic.json`, `simulation/calyx-mmult/16-compute.json`, and `simulation/static-mmult/16.systolic.json`. You can look through these files yourself to validate them.

Then navigate back to `piezo-systolic` and organize the data. 
```
cd..
python3 merge_data.py systolic/resources systolic-resources
python3 merge_data.py systolic/simulation systolic-simulation
```

For **"Configurable matrix dimensions"**
```
python3 pretty-graph-cycles.py -j cycles-systolic-mmult.json
python3 pretty-graph-resources.py -j resources-systolic-mmult.json 
```
This will generate graphs (which you can ignore, since we did not include graphs in our paper). 
Instead pay attention to the printed output of these commands.
This will match up with the claims made in  the "Configurable matrix dimensions" section. 

For **"Overhead of dynamic post operations"**
```
python3 pretty-graph-cycles.py -j cycles-systolic-relu.json  -s cycles-systolic-relu
python3 pretty-graph-resources.py -j resources-systolic-relu.json -s resources-systolic-relu
```
Graphs should be found in `piezo-systolic/graphs`. `cycles-systolic-relu.pdf` = Figure 10a, `resources-systolic-relu-LUT` = Figure 10b, `resources-systolic-relu-Registers` = Figure 10c. 
(The graphs should also align with the printed information when you run the scripts). 

## Data Collection 


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
