mlir-opt syr2k.mlir --lower-affine --convert-scf-to-cf --convert-cf-to-llvm --convert-memref-to-llvm --convert-arith-to-llvm --convert-func-to-llvm --reconcile-unrealized-casts > syr2k-lowered.mlir

mlir-translate --mlir-to-llvmir syr2k-lowered.mlir > syr2k.llc

llc -filetype=obj syr2k.llc 

clang++  syr2k.llc.o  main.cpp

./a.out > results-syr2k-mlir.txt

./a.out thru-gcc > results-syr2k-gcc.txt

cmp --silent results-syr2k-mlir.txt results-syr2k-gcc.txt && echo '### Success ###' || echo '### Failure ###'

rm syr2k.llc syr2k.llc.o syr2k-lowered.mlir a.out results-syr2k-mlir.txt results-syr2k-gcc.txt
