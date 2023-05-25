#!/bin/bash

set -euf -o pipefail

# first argument is Calyx commit (defaults to most recent master commit) 
# second argument is Dahlia version (defaults to most recent master commit)
calyx_commit=${1:-'master'}
dahlia_commit=${2:-'master'}

# install calyx for fud 
if [ ! -d "calyx-for-fud" ] 
then
    >&2 echo "Cloning calyx-for-fud"
    git clone git@github.com:cucapra/calyx.git calyx-for-fud 
fi

# install calyx for compiler evaluation  
if [ ! -d "calyx-for-eval" ] 
then
    >&2 echo "Cloning calyx-for-eval"
    git clone git@github.com:cucapra/calyx.git calyx-for-eval 
fi 

# install dahlia 
if [ ! -d "dahlia" ] 
then
    >&2 echo "Cloning dahlia"
    git clone git@github.com:cucapra/dahlia.git
fi

# Install fud
## Check if flit is installed
if ! command -v flit &> /dev/null
then
    >&2 echo "Flit is not installed. Installing..."
    python3 -m pip install flit
fi
## Check if fud is installed
if ! command -v fud &> /dev/null
then
    >&2 echo "Fud is not installed. Installing..."
    cd calyx-for-fud/fud && flit install -s && cd ../..
fi

# Build the tools
cd calyx-for-eval && git checkout $calyx_commit && cargo build && cd ..
cd dahlia && git checkout $dahlia_commit && sbt compile && sbt assembly && chmod +x ./fuse & cd .. 

# Configure fud
fud config --create global.futil_directory "$(pwd)/calyx-for-fud"

# Configure fud
fud config stages.calyx.exec "$(pwd)/calyx-for-eval/target/debug/calyx"
fud config stages.dahlia.exec "$(pwd)/dahlia/fuse"
