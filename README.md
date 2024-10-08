# Static-Calyx (Piezo) Evaluation
Evaluation for Static-Calyx (aka Piezo).

If you are reading this as a pdf, it will probably be easier to read from the `calyx-resource-eval` repo (which can be found at https://github.com/cucapra/calyx-resource-eval) and then read as a markdown.


# Introduction

The purpose of the artifact is to support the main claims made in our paper, in particular sections 6 and 7 (the evaluation sections).
We assume you are using VirtualBox and have provided .ova file to import using VirtualBox.

The Virtual Machine uses [Ubuntu 22.04.4](https://releases.ubuntu.com/22.04/?_gl=1*7cdg4v*_gcl_au*MzQyMzUxNjUwLjE3MTk5NTE0MzQ.&_ga=2.264619983.1704083987.1720401194-2094654659.1720401194) operating system. 

Our evaluation has 3 main parts: Polybench Kernels (section 6.1), PIFO Tree Packet Scheduler (section 6.2), and Systolic Arrays (section 7).

**Important Note**:
The resource numbers (LUTs and register usage) in our evaluation require Vivado synthesis tools.
Due to licensing restrictions, we can't distribute the VM with these tools installed.
However, our VM has the installer and detailed instructions on how to install (see "Getting Started" section).
This is the one dependency that requires manual effort to install (i.e., not already installed on the VM).
The simulation numbers (i.e., cycle counts) can be obtained without any manual installation of dependencies.

We make the following claims regarding our *Polybench Kernel* evaluation, all of which are supported by the artifact:
- We compare Piezo (our new system) against Calyx (the original system we built off) and Vitis HLS on Polybench benchmarks in terms of latency (cycle counts) and LUTs. See Figure 6 from the paper.
- We examine effects of the ordering of different optimization passes on Piezo's performance on Polybench benchmarks in terms of latency (cycle counts), LUTs, and register usage. See Figure 7 from the paper.

We make the following claims regarding our *PIFO Tree Packet Scheduling* evaluation, all of which are supported by the artifact:
- We examine of certain optimizations on Piezo's performance on a PIFO tree packet scheduler in terms of latency, LUTs, and register usage. See table from Section 6.2 from the paper.

For the *Systolic Array* evaluation:
- The latency numbers can be supported for our evaluation.
However, we performed our resource numbers for the systolic arrays targeting the larger Alveo U250 board, since our 16x16 systolic arrays do not fit on the default Zynq UltraScale+ XCZU3EG board we targeted for the rest of the evaluation.
The Xilinx installation we describe in the "Getting Started" section **does not contain the board to fit the 16x16 systolic arrays, as that installation would require over 200 GB.**
If you do have the space you are welcome to try (we will provide more direction in the "Optional" section of the step-by-step guide) but we have not validated this in our own VM since we do not have the space (we only have validated the results on our own lab server, in which we get the Alveo U250 board).
We have provided a script to validate the claims made about the smaller systolic arrays (4x4 and 8x8) but the Xilinx installation will not have a board large enough to fit the 16x16 systolic arrays.

We make the following claims:
- We compare Piezo's systolic array generator with Calyx's systolic array generator in terms of latency (cycle counts) and max frequency (MHz). See paragraph "Effect of Pipelining" in section 7.2. Since getting max frequency numbers requires targeting the larger board on a 16x16 systolic array our artifact will not support it. You can reproduce the latency numbers.
- We comapre Piezo's systolic array generator's performance using fixed contraction dimension vs. a flexible contraction dimension in terms of latency (cycle counts), LUTs, and register usage. See paragraph "Configurable Matrix Dimensions" in section 7.2. We support all the claims except for the resource usage claims for the largest (16x16) systolic array.
- We compare  Piezo's systolic array generator's performance on differently implemented post operations. See Figure 10 in the paper. We support all the claims except for the resource usage claims for the largest (16x16) systolic array.

**Very Important Note!** There will be some slight discrepencies between our numbers and those from our submission. None of them should change any of the qualitative claims we make in the paper.
This discrepency can be explained by 2 reasons:
1. Because Static-Calyx/Piezo is ongoing research, we are using a slightly more recent version of the compiler than what was included in the paper.
2. The web installer for Vivado 2020.2 (which we used in the paper) is no longer supported, so we provide the installer for Vivado 2022.2. The resource numbers will therefore vary slightly.

The camera-ready version of the paper will incude the updated numbers.

# Hardware Dependencies
No specific known hardware dependencies, although our evaluation uses Xilinx's Vivado tools to generate area and resource estimates.
As previously stated, due to licensing restrictions, we can't distribute the VM with these tools installed.
However, the tools are freely available and we provide instructions on how to install them (see "Getting Started" section).

# Getting Started
You can download our .ova file, and import our VM on VirtualBox.

**username is "vboxuser", pw is "piezo"**

## Installing Vivado Tools (Requires approx 58 GB)
Once on the VM, navigate to `/home/vboxuser` by typing:
```
cd /home/vboxuser
```

Then run the following command:
```
sudo ./Xilinx_Unified_2022.2_1014_8888_Lin64.bin
```
A window should pop up for the Xilinx Tools Installation.
1. Ignore the message about a newer version being available (you can X it out). Press "next".
2. Log in with your Xilinx/AMD credentials, using your email and AMD account password. If you don't have one, create an Xilinx/AMD [account](https://www.amd.com/en/registration/create-account.html). Keep the "Download and Install now" box checked.
4. Click "Vivado" when it asks you to "Select Product to Install". Click next.
5. Click "Vivado ML Standard". Click next.
6. In order to minimize the disk space necessary (and to minimize the chance of something going wrong during the installation), uncheck all unnecessary devices/features, only checking what is necessary for our evaluation. In particular, under "Production Devices": uncheck "7 Series", "UltraScale", and "UltraScale+". You should keep "SOCs" checked: but if you click on the small, blue key icon directly to the left of the "SOC" box, you can uncheck "Zync-7000". **However you should keep Zync UltraScale+ MPSoC** checked. Under "Design Tools": you should uncheck "Vitis Model Composer (Xilinx Toolbox ...) ..." and "DocNav". **However, "Vivado and Vitis HLS should remain checked** (in fact, I believe the installer will force you to keep these options checked).
7. Agree to the licenses.
8. **Important!** Change install directory location to "home/vboxuser/Xilinx", and say "yes" when it asks if you want to create this directory.
9. Click "install". Installation can take in the ballpark from 2-4 hours. It tends to go quicker if you do not let the machine sleep.

## After Installation
Run the following command (**importantly, you must run this command every time you log in**):
```
source /home/vboxuser/Xilinx/Vitis_HLS/2022.2/settings64.sh
```

# Step-by-Step Instructions
As previously stated, our evaluation has 3 main parts: Polybench Kernels (section 6.1), PIFO Tree Packet Scheduler (section 6.2), and Systolic Arrays (section 7).

The step-by-step guide is organized as follows:
- Experimental data and graph generation: generate the graphs found in the paper **using pre-supplied data**.
  - Polybench graphs: comparison to Calyx/Vitis HLS (Figure 6) and comparison of different optimization pass orderings (Figure 7)
  - PIFO tree table (look at "Results" paragraph in section 6.2 for table)
  - Systolic array results (section 7.2, Figure 10).
- Data collection
  - Effects of different optimization pass orderings (6.1.2)
  - PIFO tree packet scheduler (6.2)
  - Systolic array results (7.2)
- Optional Things
  - Installing the larger board

## Experimental Data and Graph Generation
Since the process to collecting data takes several hours, we will first regenerate the graphs presented in the paper from data already committed to the repository. The next section will demonstrate how to collect this data.

### Setting Things Up
**Important! You should do all of these things every time you start up the virtual machine again.**

Give yourself priveleges (password is "piezo" as stated before)
```
su -
```

Activate the Python virtual environment by running:
```
source /opt/venv/bin/activate
```

Re-run the Vivado set-up script if you logged out since the last time you've run it:
```
source /home/vboxuser/Xilinx/Vitis_HLS/2022.2/settings64.sh
```

Navigate to the directory of the evaluation by typing:
```
cd /home/vboxuser/piezo-eval/calyx-resource-eval
```

<details>
<summary><b>Double check you're on the right track</b> [click to expand]</summary>

Run the following command:
```
fud check
```

You should see:
```
interpreter, vivado-hls, mrxl were not installed correctly.
```
*This is fine*.
However, if it says any other tools are not installed correctly (or the command fails for some reason), then there is probably a problem.

Double check you've done everything in the above section, and that you've correctly installed the Vivado tools.
</details>

### Polybench (Section 6.1)
To generate the **Polybench Graphs** (Figures 6 and 7), run this (there will be some warnings which you can ignore):
```
cd dahlia-polybench && python3 dahlia_polybench_graph.py > gmeans.txt
```
If you go to the file explorer, graphs should appear in `/home/vboxuser/piezo-eval/calyx-resource-eval/dahlia-polybench/graphs`.
`dahlia_polybench_cycles.pdf` = Figure 6a, `dahlia_polybench_lut.pdf` = Figure 6b, `futil_ordering_cycles.pdf` = Figure 7a, `futil_ordering_lut.pdf` = Figure 7b, `futil_ordering_registers` = Figure 7c.
`gemans.txt` should contain information about the geometric means: these numbers, in addition to being displayed visually in Figures 6 and 7, are referenceed throughout section 6.1 of our paper.

### PIFO Trees (Section 6.2)
To generate the **PIFO Tree Table** (from "Results" paragraph of Section 6.2):
```
cd ../sdn && python3 make_table.py
```
The table should be seen in `table.csv`.
To look at the table you can just do `vi table.csv`.

### Systolic Arrays (Section 7.2)
There are 3 main claims we make in section 7.2: one per paragraph ("Effect of pipelining", "Configurable matrix dimensions", "Overhead of dynamic post operations").

To generate the **Systolic Array Results** (from section 7.2):
First navigate to the correct directory:
```
cd ../piezo-systolic/systolic
```

For **"Effect of pipelining"**: run `python3 compare_vs_calyx.py`: you should see the claims made in the paper.
This script simply looks through the following files: `resources/max-freq-calyx/16.systolic.json`, `resources/max-freq-piezo/16.systolic.json`, `simulation/calyx-mmult/16-compute.json`, and `simulation/static-mmult/16.systolic.json`. You can look through these files yourself to validate them.

**Important Notes**
- Because the Vivado installation does not have the Alveo Board, you will not be able to reproduce the frequency claims made (you will reproduce the cycle count claims)
- The paper claims Calyx takes 248 cycles: this is a typo. It should say 284 and will be corrected in the camera-ready version.
- The paper claims Piezo takes 54 cycles: this is for the flexible contraction dimension. It should say 53, since that is for the fixed contraction dimension, which is what Calyx implemented.

Then navigate back to `piezo-systolic` and organize the data so that our scripts can easily digest it.
```
cd ..
python3 merge_data.py systolic/resources systolic-resources
python3 merge_data.py systolic/simulation systolic-simulation
```

For **"Configurable matrix dimensions"**
```
python3 pretty-graph-cycles.py -j cycles-systolic-mmult.json
```
Looking at the terminal output, you can see that the flxible contraction dimension takes an extra cycle across all designs.

```
python3 pretty-graph-resources.py -j resources-systolic-mmult.json
```
Looking at the terminal output, you can see that, apart from the 2x2 design (which we decided to ignore in the paper), the flexible contraction dimension takes at most 8% more LUTs.
Also, the flexible contraction dimension uses 2 more registers (the paper claims they use the same amount: this discrepency is likely due to using a newer compiler commit hash).

For **"Overhead of dynamic post operations"**
```
python3 pretty-graph-cycles.py -j cycles-systolic-relu.json  -s cycles-systolic-relu
python3 pretty-graph-resources.py -j resources-systolic-relu.json -s resources-systolic-relu
```
You can ignore the terminal output, instead looking at the graphs.
Graphs should be found in `piezo-systolic/graphs`. `cycles-systolic-relu.pdf` = Figure 10a, `resources-systolic-relu-LUT` = Figure 10b, `resources-systolic-relu-Registers` = Figure 10c. (Again you go to the file explorer to see this.)

## Data Collection (Takes a long time)

Now we will collect the data ourselves.

Start by navigating back to the root of `calyx-resource-eval`.
```
cd ..
```

### Polybench (Section 6.1)
Navigte to the `dahlia-polybench` directory.
```
cd dahlia-polybench
```

**Latency Results (Estimated Time ~30 min)**
For the *latency* data, run (there will be some warnings which you can ignore):
```
source scripts/polybench_calyx_latency.sh
```

**Resource Results (Estimated Time ~4 hrs but can vary depending on how fast your machine is)**
For the *resourcce* data, run:
```
source scripts/polybench_calyx_resources.sh
```

### SDN (Section 6.2)
Navigte to the `sdn` subdirectory.
```
cd ../sdn
```

Then move the results to a separate directory.
```
mv results results_given
```

**Latency Results (Estimated Time <10 min)**
For the *latency* data, run (there will be some warnings which you can ignore):
```
source scripts/sdn_four_ways_latency.sh
```

**Resource Results (Estimated Time <30 min)**
For the *resourcce* data, run:
```
source scripts/sdn_four_ways_resources.sh
```

### Systolic (Section 7)
Navigte to the `piezo-systolic` subdirectory.
```
cd ../piezo-systolic
```

Then move the existing results:
```
rm -rf systolic-resources
rm -rf systolic-simulation
mv systolic/simulation systolic/simulation-given
mv systolic/resources systolic/resources-given
```

**Latency Results (Estimated Time <10 min)**
For the *latency* data, run (there will be some warnings which you can ignore):
```
python3 drive.py -j simulation.json
```

**Resource Results (Estimated Time 1-2 hours)**

For the *resource* data, run:
```
python3 drive.py -j resources-small-board.json
```
(you would run `python3 drive.py -j resources.json` if you had access to the Alveo U250 board).

**Comparison to Calyx**
For the *comparison against Calyx's systolic arrays*:

To do this, we need to check out of the current Calyx branch (i.e., the "Piezo" branch") and go back to an earlier version of the Calyx repo, and rebuild the Calyx compiler and `fud`.
```
cd ../../../calyx && git checkout 9e15fe00 && cargo build && cd fud && FLIT_ROOT_INSTALL=1 flit install --symlink --deps production
```

Then navigate back:
```
cd ../../calyx-resource-eval/piezo-systolic/systolic
```

Get cycle counts:
```
fud e --to dat --from futil -s verilog.data input-data/calyx-data/16-compute.json -q max-freq-inputs/calyx/16-comp.futil -s futil.flags "-d minimize-regs" -o simulation/calyx-mmult/16.json
```

Note that if you want to go back and run any of the Piezo, commands, you must check out the main version of Calyx and rebuild Calyx compiler and `fud`.
```
cd ../../../calyx && git checkout main && cargo build && cd fud && FLIT_ROOT_INSTALL=1 flit install --symlink --deps production
```

<details>
<summary><b>Debugging Help</b> [click to expand]</summary>

If your `fud` commands aren't working, it could be becuase you need to reconfigure `fud` (i.e., tell `fud` which directories it needs to point to).

```
fud config global.root /home/vboxuser/piezo-eval/calyx
fud config stages.calyx.exec /home/vboxuser/piezo-eval/calyx/target/debug/calyx
fud config stages.futil.exec /home/vboxuser/piezo-eval/calyx/target/debug/futil
fud config stages.dahlia.exec /home/vboxuser/piezo-eval/dahlia/fuse
```

</details>

<details>
<summary><b>If you had access to the larger board</b> [click to expand]</summary>

For Calyx's max frequency:
```
fud e -q max-freq-inputs/calyx/16-calyx.sv --to resource-estimate -o resources/max-freq-calyx/16.systolic.json -s synth-verilog.tcl synth-files/synth.tcl -s synth-verilog.constraints synth-files/device4.xdc --from synth-verilog
```

For Piezo's max frequency:
```
python3 drive.py -j max_freq_piezo.json
```

</details>

# Optional Things

<details>
<summary><b>Some optional notes </b> [click to expand]</summary>

## How to install if you want Alveo U250 access.
(Differences from original instructions are bolded).
Then run the following command:
```
sudo ./Xilinx_Unified_2022.2_1014_8888_Lin64.bin
```
A window should pop up for the Xilinx Tools Installation.
1. Ignore the message about a newer version being available (you can X it out). Press "next".
2. Log in with your Xilinx/AMD credentials, using your email and AMD account password. If you don't have one, create an Xilinx/AMD [account](https://www.amd.com/en/registration/create-account.html). Keep the "Download and Install now" box checked.
4. Click **"Vitis"** when it asks you to "Select Product to Install". Click next.
5. In order to minimize the disk space necessary (and to minimize the chance of something going wrong during the installation), uncheck all unnecessary devices/features, only checking what is necessary for our evaluation. In particular, under "Production Devices": uncheck "7 Series", "UltraScale", and "UltraScale+". You should keep "SOCs" checked: but if you click on the small, blue key icon directly to the left of the "SOC" box, you can uncheck "Zync-7000". **However you should keep Zync UltraScale+ MPSoC** checked. **You should also check "Install devices for Alveo and Xilinx edge acceleration platforms"** Under "Design Tools": you should uncheck "Vitis Model Composer (Xilinx Toolbox ...) ..." and "DocNav". **However, "Vivado and Vitis HLS should remain checked** (in fact, I believe the installer will force you to keep these options checked).
6. Agree to the licenses.
7. **Important!** Change install directory location to "home/vboxuser/Xilinx", and say "yes" when it asks if you want to create this directory.
8. Click "install". Installation can take in the ballpark from 2-4 hours. It tends to go quicker if you do not let the machine sleep.

## One note on the comparison to Calyx

The output memory of Piezo's systolic arrays are banked, while Calyx's are unbanked.
To prevent an unfair comparison, we therefore only included the compute cycles of Calyx's systolic array.
To do this, we manually edited a Calyx file and removed the write to memory (this is very easy to do).
However, we still verified correctness of Calyx's design by running the full design (which takes 540 cycles) and checking the output.

You first must navigate to the correct directory (`/home/vboxuser/piezo-eval/calyx-resource-eval/piezo-systolic/systolic`) and then check out the older Calyx commit (see instructions from previous section).

Simulating just the compute (284 cycles).
```
fud e --to dat --from futil -s verilog.data input-data/calyx-data/16-compute.json -q max-freq-inputs/calyx/16-comp.futil -s futil.flags "-d minimize-regs" -o simulation/calyx-mmult/16.json
```

Simulating the full design (compute and write) (540 cycles)
```
fud e --to dat --from futil -s verilog.data input-data/calyx-data/16-unbanked.json -q max-freq-inputs/calyx/16.futil -s futil.flags "-d minimize-regs" -o simulation/calyx-mmult/16.json
```

Check output of the full design.
```
python3 check_mmult_output.py -j simulation/calyx-mmult/16.json
```

</details>


# Reusability Guide
The main Calyx driver is called `fud`.
It's documentation is here: https://docs.calyxir.org/running-calyx/fud/index.html.
This is the tool that orchestrates the commands and compiles designs to and from Calyx, moves data, runs the correct tools, etc.
Most of our scripts are short scripts that simply execute `fud` commands.

Therefore, if you wanted to extend the evaluation, you could probably get `fud` to do most of the work.

