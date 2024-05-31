#!/bin/bash

if [ ! -z "$1" ]; then
    parallelism="$1"
else
    parallelism="-j1"
fi

SH->SC latency (7 minutes)
ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "fud e -q {} --to dat --through verilog -s verilog.data '{}.data'| diff -q <(jq .memories) benchmarks/polybench-expect/{/.}.expect >> results-diff.txt"

# SC (7 minutes)
ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "fud e -q {} --to dat --through verilog -s verilog.data '{}.data' -s calyx.flags '-d cell-share' | diff -q <(jq .memories) benchmarks/polybench-expect/{/.}.expect >> results-diff.txt"

# SH (7 minutes)
ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "fud e -q {} --to dat --through verilog -s verilog.data '{}.data' -s calyx.flags '-x static-promotion:compaction=false' | diff -q <(jq .memories) benchmarks/polybench-expect/{/.}.expect >> results-diff.txt"

# SC->SH latency (7 minutes)
ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "fud e -q {} --to dat --through verilog -s verilog.data '{}.data' -s calyx.flags '-r static-promotion -r cell-share' | diff -q <(jq .memories) benchmarks/polybench-expect/{/.}.expect >> results-diff.txt"
