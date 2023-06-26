mlir-opt 3mm.mlir --lower-affine --convert-scf-to-cf --convert-cf-to-llvm --convert-memref-to-llvm --convert-arith-to-llvm --convert-func-to-llvm --reconcile-unrealized-casts > 3mm-lowered.mlir

mlir-translate --mlir-to-llvmir 3mm-lowered.mlir > 3mm.llc

llc -filetype=obj 3mm.llc 

clang++  3mm.llc.o  main.cpp

./a.out > results-3mm-mlir.txt

./a.out thru-gcc > results-3mm-gcc.txt

cmp --silent results-3mm-mlir.txt results-3mm-gcc.txt && echo '### Success ###' || echo '### Failure ###'