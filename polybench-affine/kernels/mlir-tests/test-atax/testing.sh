mlir-opt atax.mlir --lower-affine --convert-scf-to-cf --convert-cf-to-llvm --convert-memref-to-llvm --convert-arith-to-llvm --convert-func-to-llvm --reconcile-unrealized-casts > atax-lowered.mlir

mlir-translate --mlir-to-llvmir atax-lowered.mlir > atax.llc

llc -filetype=obj atax.llc 

clang++  atax.llc.o  main.cpp

./a.out > results-atax-mlir.txt

./a.out thru-gcc > results-atax-gcc.txt

cmp --silent results-atax-mlir.txt results-atax-gcc.txt && echo '### Success ###' || echo '### Failure ###'

rm atax.llc atax.llc.o atax-lowered.mlir results-atax-mlir.txt results-atax-gcc.txt a.out 
