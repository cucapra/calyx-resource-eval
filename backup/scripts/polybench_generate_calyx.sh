#!/bin/bash

if [ ! -z "$1" ]; then
    parallelism="$1"
else
    parallelism="-j1"
fi

# SH->SC (25 minutes)
mkdir -p results/standard/futil-sh-sc
ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "fud e -q {} --to calyx > results/raw-calyx/{/.}.futil"
