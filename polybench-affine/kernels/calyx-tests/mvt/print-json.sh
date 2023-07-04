run_flag=${1:-''}

g++ -std=c++11 print-json.cpp  -o print-json.o 

./print-json.o $run_flag

rm print-json.o