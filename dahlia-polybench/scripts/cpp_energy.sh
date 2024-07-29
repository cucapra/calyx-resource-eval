#!/bin/bash

if [ ! -z "$1" ]; then
    parallelism="$1"
else
    parallelism="-j1"
fi

# SH->SC (25 minutes)
ls cpp_benchmarks/*.o | parallel --bar $parallelism "sudo perf stat -e power/energy-pkg/ {} {}.json 2>&1 | grep power/energy-pkg/ | awk -F, '{print $1}' | sed 's/[^0-9.]//g' > {}_energy_pkg.csv"
ls cpp_benchmarks/*.o | parallel --bar $parallelism "sudo perf stat -e power/energy-ram/ {} {}.json 2>&1 | grep power/energy-ram/ | awk -F, '{print $1}' | sed 's/[^0-9.]//g' > {}_energy_ram.csv"