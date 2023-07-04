mlir-opt gemver.mlir --lower-affine --convert-scf-to-cf --convert-cf-to-llvm --convert-memref-to-llvm --convert-arith-to-llvm --convert-func-to-llvm --reconcile-unrealized-casts > gemver-lowered.mlir

mlir-translate --mlir-to-llvmir gemver-lowered.mlir > gemver.llc

llc -filetype=obj gemver.llc 

clang++  gemver.llc.o  main.cpp

./a.out > results-gemver-mlir.txt

./a.out thru-gcc > results-gemver-gcc.txt

cmp --silent results-gemver-mlir.txt results-gemver-gcc.txt && echo '### Success ###' || echo '### Failure ###'

rm gemver.llc gemver.llc.o gemver-lowered.mlir a.out results-gemver-mlir.txt results-gemver-gcc.txt
