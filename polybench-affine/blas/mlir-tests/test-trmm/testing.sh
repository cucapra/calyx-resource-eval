mlir-opt trmm.mlir --lower-affine --convert-scf-to-cf --convert-cf-to-llvm --convert-memref-to-llvm --convert-arith-to-llvm --convert-func-to-llvm --reconcile-unrealized-casts > trmm-lowered.mlir

mlir-translate --mlir-to-llvmir trmm-lowered.mlir > trmm.llc

llc -filetype=obj trmm.llc 

clang++  trmm.llc.o  main.cpp

./a.out > results-trmm-mlir.txt

./a.out thru-gcc > results-trmm-gcc.txt

cmp --silent results-trmm-mlir.txt results-trmm-gcc.txt && echo '### Success ###' || echo '### Failure ###'

rm trmm.llc trmm.llc.o trmm-lowered.mlir a.out results-trmm-mlir.txt results-trmm-gcc.txt
