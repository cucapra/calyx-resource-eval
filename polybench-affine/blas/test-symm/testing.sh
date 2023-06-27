mlir-opt symm.mlir --lower-affine --convert-scf-to-cf --convert-cf-to-llvm --convert-memref-to-llvm --convert-arith-to-llvm --convert-func-to-llvm --reconcile-unrealized-casts > symm-lowered.mlir

mlir-translate --mlir-to-llvmir symm-lowered.mlir > symm.llc

llc -filetype=obj symm.llc 

clang++  symm.llc.o  main.cpp

./a.out > results-symm-mlir.txt

./a.out thru-gcc > results-symm-gcc.txt

cmp --silent results-symm-mlir.txt results-symm-gcc.txt && echo '### Success ###' || echo '### Failure ###'

rm symm.llc symm.llc.o symm-lowered.mlir a.out results-symm-mlir.txt results-symm-gcc.txt
