mlir-opt bicg.mlir --lower-affine --convert-scf-to-cf --convert-cf-to-llvm --convert-memref-to-llvm --convert-arith-to-llvm --convert-func-to-llvm --reconcile-unrealized-casts > bicg-lowered.mlir

mlir-translate --mlir-to-llvmir bicg-lowered.mlir > bicg.llc

llc -filetype=obj bicg.llc 

clang++  bicg.llc.o  main.cpp

./a.out > results-bicg-mlir.txt

./a.out thru-gcc > results-bicg-gcc.txt

cmp --silent results-bicg-mlir.txt results-bicg-gcc.txt && echo '### Success ###' || echo '### Failure ###'

rm bicg.llc bicg.llc.o bicg-lowered.mlir results-bicg-mlir.txt results-bicg-gcc.txt a.out 
