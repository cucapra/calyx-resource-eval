#!/bin/bash

#from https://stackoverflow.com/questions/16483119/an-example-of-how-to-use-getopts-in-bash
usage() { echo "Usage: $0 [-r <0|1>] [-s <string>]" 1>&2; exit 1; }

while getopts ":r:s:" o; do
    case "${o}" in
        r)
            r=${OPTARG}
            ((r == 0 || r == 1)) || usage
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

if [ -z "${r}" ] || [ -z "${s}" ]; then
    usage
fi

run_arg=""

if [ $r == 1 ]; then
  run_arg="run-op"
fi

g++ -std=c++11 $s -o $s.o 

./$s.o $run_arg

rm $s.o