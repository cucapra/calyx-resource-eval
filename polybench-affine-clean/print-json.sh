#!/bin/bash

#from https://stackoverflow.com/questions/16483119/an-example-of-how-to-use-getopts-in-bash
usage() { echo "Usage: $0 [-r <0|1>] [-p <string>]" 1>&2; exit 1; }

while getopts ":s:r:p:" o; do
    case "${o}" in
        r)
            r=${OPTARG}
            ((r == 0 || r == 1)) || usage
            ;;
        p)
            p=${OPTARG}
            ;;
        s)
            s=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${s}" ] || [ -z "${r}" ] || [ -z "${p}" ]; then
    usage
fi

run_arg=""

if [ $r == 1 ]; then
  run_arg="run-op"
fi

g++ -std=c++11 $p -D $s -o $p.o 

./$p.o $run_arg

rm $p.o