mlir-opt mvt.mlir --lower-affine --convert-scf-to-cf --convert-cf-to-llvm --convert-memref-to-llvm --convert-arith-to-llvm --convert-func-to-llvm --reconcile-unrealized-casts > mvt-lowered.mlir

mlir-translate --mlir-to-llvmir mvt-lowered.mlir > mvt.llc

llc -filetype=obj mvt.llc 

clang++  mvt.llc.o  main.cpp

./a.out > results-mvt-mlir.txt

./a.out thru-gcc > results-mvt-gcc.txt

cmp --silent results-mvt-mlir.txt results-mvt-gcc.txt && echo '### Success ###' || echo '### Failure ###'

rm mvt.llc mvt.llc.o mvt-lowered.mlir a.out results-mvt-mlir.txt results-mvt-gcc.txt
