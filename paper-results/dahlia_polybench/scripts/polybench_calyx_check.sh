#!/bin/bash

if [ ! -z "$1" ]; then
    parallelism="$1"
else
    parallelism="-j1"
fi

# SH->SC latency (7 minutes)
# ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "fud e -q {} --to dat --through verilog -s verilog.data '{}.data'| diff -q <(jq .memories) benchmarks/polybench-expect/{/.}.expect >> check-results.txt"

# # SC (7 minutes)
# ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "fud e -q {} --to dat --through verilog -s verilog.data '{}.data' -s calyx.flags '-d cell-share' | diff -q <(jq .memories) benchmarks/polybench-expect/{/.}.expect >> check-results.txt"

# # SH (7 minutes)
# ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "fud e -q {} --to dat --through verilog -s verilog.data '{}.data' -s calyx.flags '-x static-promotion:compaction=false' | diff -q <(jq .memories) benchmarks/polybench-expect/{/.}.expect >> check-results.txt"

# NOW YOU HAVE TO CHECK OUT A NEW BRANCH THAT HAS REORDERED THE PASSES

# # SC->SH latency (7 minutes)
ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "fud e -q {} --to dat --through verilog -s verilog.data '{}.data'| diff -q <(jq .memories) benchmarks/polybench-expect/{/.}.expect >> check-results.txt"

# # unrolled (25 minutes)
# mkdir -p results/unrolled/futil
# ls benchmarks/unrolled/*.fuse | parallel --bar $parallelism "fud e -q {} --to resource-estimate > results/unrolled/futil/{/.}.json"

# # unrolled latency (7 minutes)
# mkdir -p results/unrolled/futil-latency
# ls benchmarks/unrolled/*.fuse | parallel --bar $parallelism "fud e -q {} --to vcd_json -s verilog.data '{}.data' | jq '{\"latency\":.TOP.main.clk | add}' > results/unrolled/futil-latency/{/.}.json"
