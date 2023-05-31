#!/bin/bash

set -euf -o pipefail

# first argument is Calyx commit (defaults to most recent master commit) 
# second argument is Dahlia version (defaults to most recent master commit)
# third argument is extension for fud to use for Calyx (either futil or calyx)
calyx_commit=${1:-'master'}
dahlia_commit=${2:-'master'}
fud_calyx_extension=${3:-'calyx'}

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


## Check if flit is installed
if ! command -v flit &> /dev/null
then
    >&2 echo "Flit is not installed. Installing..."
    python3 -m pip install flit
fi 

# Install fud, since this is the installation we want to use (not my other fud installation on another Calyx repo)
>&2 echo "Installing fud..."
cd calyx-for-fud/fud && flit install -s && cd ../..

# Checkout correct Calyx commit, write commit info into temp/calyx-version.txt
cd calyx-for-eval && git checkout $calyx_commit && git show --no-patch --no-notes --pretty='%h || %ci || %s'  > ../tmp-version-info/calyx-version.txt 
# build Calyx 
cargo build && cd ..

# Checkout correct Dahlia commit, write commit info into temp/dahlia-version.txt
cd dahlia && git checkout $dahlia_commit && git show --no-patch --no-notes --pretty='%h || %ci || %s'  > ../tmp-version-info/dahlia-version.txt 
#build Dahlia
sbt compile && sbt assembly && chmod +x ./fuse && cd .. 

# Configure fud
fud config global.root "$(pwd)/calyx-for-eval"

# Configure fud
fud config stages.calyx.exec "$(pwd)/calyx-for-eval/target/debug/$fud_calyx_extension"
fud config stages.dahlia.exec "$(pwd)/dahlia/fuse"
