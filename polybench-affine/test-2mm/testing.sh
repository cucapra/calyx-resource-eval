mlir-opt 2mm.mlir --lower-affine --convert-scf-to-cf --convert-cf-to-llvm --convert-memref-to-llvm --convert-arith-to-llvm --convert-func-to-llvm --reconcile-unrealized-casts > 2mm-lowered.mlir

mlir-translate --mlir-to-llvmir 2mm-lowered.mlir > 2mm.llc

llc -filetype=obj 2mm.llc 

clang++  2mm.llc.o  main.cpp

./a.out > results-2mm-mlir.txt

./a.out thru-gcc > results-2mm-gcc.txt

cmp --silent results-2mm-mlir.txt results-2mm-gcc.txt && echo '### Success ###' || echo '### Failure ###'