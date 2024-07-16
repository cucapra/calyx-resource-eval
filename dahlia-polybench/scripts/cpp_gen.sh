#!/bin/bash

if [ ! -z "$1" ]; then
    parallelism="$1"
else
    parallelism="-j1"
fi

# SH->SC (25 minutes)
mkdir -p cpp_benchmarks/
ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "fud e --from dahlia --to vivado-hls {} > cpp_benchmarks/{/.}.cpp"