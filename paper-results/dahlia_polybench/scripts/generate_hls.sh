#!/bin/bash

mkdir -p benchmarks/hls

cd benchmarks/polybench
for file in *.fuse; do
    # Extract the name without extension
    name="${file%.*}"

    cd ../hls

    # Create a directory with the same name if it doesn't exist
    if [ ! -d "$name" ]; then
        mkdir "$name"
    fi

    fud e -q ../polybench/$file --to vivado-hls > $name/$name.cpp

    # Copy the file to the newly created directory
    cp "../../synthesis_scripts/fxp_sqrt.h" "$name/"
done
