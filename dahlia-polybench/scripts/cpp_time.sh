#!/bin/bash

if [ ! -z "$1" ]; then
    parallelism="$1"
else
    parallelism="-j1"
fi

# SH->SC (25 minutes)
mkdir -p cpp_benchmarks
ls cpp_benchmarks/*.o | parallel --bar $parallelism "{} {}.json > {}.csv"