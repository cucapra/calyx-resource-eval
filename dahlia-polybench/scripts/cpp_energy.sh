#!/bin/bash

if [ ! -z "$1" ]; then
    parallelism="$1"
else
    parallelism="-j1"
fi

# SH->SC (25 minutes)
ls cpp_benchmarks/*.o | parallel --bar $parallelism '
    for i in {1..250}; do
        sudo perf stat -e power/energy-pkg/ {} {}.json 2>&1 > /dev/null | grep "power/energy-pkg/" | awk "{print \$1}" >> {}_energy_pkg.csv
    done
'
# ls cpp_benchmarks/*.o | parallel --bar $parallelism "sudo perf stat -e power/energy-ram/ {} {}.json 2>&1 | grep power/energy-ram/ | awk -F, '{print $1}' | sed 's/[^0-9.]//g' > {}_energy_ram.csv"