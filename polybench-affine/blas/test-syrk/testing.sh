mlir-opt syrk.mlir --lower-affine --convert-scf-to-cf --convert-cf-to-llvm --convert-memref-to-llvm --convert-arith-to-llvm --convert-func-to-llvm --reconcile-unrealized-casts > syrk-lowered.mlir

mlir-translate --mlir-to-llvmir syrk-lowered.mlir > syrk.llc

llc -filetype=obj syrk.llc 

clang++  syrk.llc.o  main.cpp

./a.out > results-syrk-mlir.txt

./a.out thru-gcc > results-syrk-gcc.txt

cmp --silent results-syrk-mlir.txt results-syrk-gcc.txt && echo '### Success ###' || echo '### Failure ###'

rm syrk.llc syrk.llc.o syrk-lowered.mlir a.out results-syrk-mlir.txt results-syrk-gcc.txt
