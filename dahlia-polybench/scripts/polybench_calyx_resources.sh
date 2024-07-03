#!/bin/bash

if [ ! -z "$1" ]; then
    parallelism="$1"
else
    parallelism="-j1"
fi

# SH->SC (25 minutes)
mkdir -p results/results-static-calyx/futil-sh-sc
ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "fud e -q {} --to resource-estimate > results/results-static-calyx/futil-sh-sc/{/.}.json"

# SC (25 minutes)
mkdir -p results/results-static-calyx/futil-sc
ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "fud e -q {} --to resource-estimate -s calyx.flags '-d cell-share' > results/results-static-calyx/futil-sc/{/.}.json"

# SH (25 minutes)
mkdir -p results/results-static-calyx/futil-sh
ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "fud e -q {} --to resource-estimate -s calyx.flags '-x static-promotion:compaction=false' > results/results-static-calyx/futil-sh/{/.}.json"

# SC->SH (25 minutes)
mkdir -p results/results-static-calyx/futil-sc-sh
ls benchmarks/polybench/*.fuse | parallel --bar $parallelism "fud e -q {} --to resource-estimate -s calyx.flags '-i static-promotion:cell-share' > results/results-static-calyx/futil-sc-sh/{/.}.json"
