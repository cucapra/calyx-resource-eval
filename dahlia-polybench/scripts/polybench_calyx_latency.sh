#!/bin/bash

if [ ! -z "$1" ]; then
    parallelism="$1"
else
    parallelism="-j1"
fi

# SH->SC latency (7 minutes)
mkdir -p results/results-static-calyx/futil-sh-sc-latency
ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "fud e -q {} --to dat --through verilog -s verilog.data '{}.data' | jq '{ "latency": .cycles }' > results/results-static-calyx/futil-sh-sc-latency/{/.}.json"

# SC latency (7 minutes)
mkdir -p results/results-static-calyx/futil-sc-latency
ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "fud e -q {} --to dat --through verilog -s verilog.data '{}.data' -s calyx.flags '-d cell-share' | jq '{ "latency": .cycles }' > results/results-static-calyx/futil-sc-latency/{/.}.json"

# SH latency (7 minutes)
mkdir -p results/results-static-calyx/futil-sh-latency
ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "fud e -q {} --to dat --through verilog -s verilog.data '{}.data' -s calyx.flags '-x static-promotion:compaction=false' | jq '{ "latency": .cycles }' > results/results-static-calyx/futil-sh-latency/{/.}.json"

# SC->SH latency (7 minutes)
mkdir -p results/results-static-calyx/futil-sc-sh-latency
ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "fud e -q {} --to dat --through verilog -s verilog.data '{}.data' -s calyx.flags '-i static-promotion:cell-share' | jq '{ "latency": .cycles }' > results/results-static-calyx/futil-sc-sh-latency/{/.}.json"
