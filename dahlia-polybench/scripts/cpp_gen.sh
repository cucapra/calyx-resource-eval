#!/bin/bash

if [ ! -z "$1" ]; then
    parallelism="$1"
else
    parallelism="-j1"
fi

# SH->SC (25 minutes)
mkdir -p cpp_benchmarks/
ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "/scratch/cmk265/learning/dahlia/fuse run {} -o cpp_benchmarks/{/.}.cpp"