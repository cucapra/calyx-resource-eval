#!/bin/bash

if [ ! -z "$1" ]; then
    parallelism="$1"
else
    parallelism="-j1"
fi

# # make results directory and run hls-estimate for all polybench benchmarks
mkdir -p results/standard/hls
ls benchmarks/hls/*/*.cpp | parallel --bar $parallelism "fud e -q {} --from vivado-hls --to hls-detailed-estimate > results/standard/hls/{/.}.json"

# make results directory and run hls-estimate for all polybench benchmarks
# mkdir -p results/standard/hls-latency
# ls benchmarks/hls/*/*.cpp | parallel --bar $parallelism "fud e -q {} --from vivado-hls --to hls-cycles-estimate > results/standard/hls-latency/{/.}.json"

# make results directory and run hls-estimate on unrolled polybench benchmarks
# mkdir -p results/unrolled/hls
# ls benchmarks/unrolled/*.fuse | parallel --bar $parallelism "fud e -q {} --to hls-estimate > results/unrolled/hls/{/.}.json"
