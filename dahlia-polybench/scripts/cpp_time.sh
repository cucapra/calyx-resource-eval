#!/bin/bash

if [ ! -z "$1" ]; then
    parallelism="$1"
else
    parallelism="-j1"
fi

# SH->SC (25 minutes)
mkdir -p cpp_benchmarks_250
ls cpp_benchmarks_250/*.o | parallel --bar $parallelism '
    for i in {1..250}; do
        {} {}.json >> {}_time.csv
    done
'