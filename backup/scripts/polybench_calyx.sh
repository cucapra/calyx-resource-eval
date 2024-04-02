#!/bin/bash

if [ ! -z "$1" ]; then
    parallelism="$1"
else
    parallelism="-j1"
fi

# # SH->SC (25 minutes)
# mkdir -p results/standard/futil-sh-sc
# ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "fud e -q {} --to resource-estimate > results/standard/futil-sh-sc/{/.}.json"

# # SH->SC latency (7 minutes)
# mkdir -p results/standard/futil-sh-sc-latency
# ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "fud e -q {} --to dat --through verilog -s verilog.data '{}.data' | jq '{ "latency": .cycles }' > results/standard/futil-sh-sc-latency/{/.}.json"

# # SC (25 minutes)
# mkdir -p results/standard/futil-sc
# ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "fud e -q {} --to resource-estimate -s calyx.flags '-d cell-share' > results/standard/futil-sc/{/.}.json"

# # SC (7 minutes)
# mkdir -p results/standard/futil-sc-latency
# ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "fud e -q {} --to dat --through verilog -s verilog.data '{}.data' -s calyx.flags '-d cell-share' | jq '{ "latency": .cycles }' > results/standard/futil-sc-latency/{/.}.json"

# # SH (25 minutes)
# mkdir -p results/standard/futil-sh
# ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "fud e -q {} --to resource-estimate -s calyx.flags '-x static-promotion:compaction=false' > results/standard/futil-sh/{/.}.json"

# # SH (7 minutes)
# mkdir -p results/standard/futil-sh-latency
# ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "fud e -q {} --to dat --through verilog -s verilog.data '{}.data' -s calyx.flags '-x static-promotion:compaction=false' | jq '{ "latency": .cycles }' > results/standard/futil-sh-latency/{/.}.json"

# NOW YOU HAVE TO CHECK OUT A NEW BRANCH THAT HAS REORDERED THE PASSES

# SC->SH (25 minutes)
mkdir -p results/standard/futil-sc-sh
ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "fud e -q {} --to resource-estimate > results/standard/futil-sc-sh/{/.}.json"

# SC->SH latency (7 minutes)
mkdir -p results/standard/futil-sc-sh-latency
ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "fud e -q {} --to dat --through verilog -s verilog.data '{}.data' | jq '{ "latency": .cycles }' > results/standard/futil-sc-sh-latency/{/.}.json"

# # unrolled (25 minutes)
# mkdir -p results/unrolled/futil
# ls benchmarks/unrolled/*.fuse | parallel --bar $parallelism "fud e -q {} --to resource-estimate > results/unrolled/futil/{/.}.json"

# # unrolled latency (7 minutes)
# mkdir -p results/unrolled/futil-latency
# ls benchmarks/unrolled/*.fuse | parallel --bar $parallelism "fud e -q {} --to vcd_json -s verilog.data '{}.data' | jq '{\"latency\":.TOP.main.clk | add}' > results/unrolled/futil-latency/{/.}.json"
