#!/bin/bash

if [ ! -z "$1" ]; then
    parallelism="$1"
else
    parallelism="-j1"
fi

# make results directory and run hls-estimate for all polybench benchmarks
mkdir -p results/hls
ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "fud e -q {} --to hls-estimate > results/standard/hls/{/.}.json"