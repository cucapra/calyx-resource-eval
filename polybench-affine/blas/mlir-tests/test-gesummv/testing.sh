mlir-opt gesummv.mlir --lower-affine --convert-scf-to-cf --convert-cf-to-llvm --convert-memref-to-llvm --convert-arith-to-llvm --convert-func-to-llvm --reconcile-unrealized-casts > gesummv-lowered.mlir

mlir-translate --mlir-to-llvmir gesummv-lowered.mlir > gesummv.llc

llc -filetype=obj gesummv.llc 

clang++  gesummv.llc.o  main.cpp

./a.out > results-gesummv-mlir.txt

./a.out thru-gcc > results-gesummv-gcc.txt

cmp --silent results-gesummv-mlir.txt results-gesummv-gcc.txt && echo '### Success ###' || echo '### Failure ###'

rm gesummv.llc gesummv.llc.o gesummv-lowered.mlir a.out results-gesummv-mlir.txt results-gesummv-gcc.txt
