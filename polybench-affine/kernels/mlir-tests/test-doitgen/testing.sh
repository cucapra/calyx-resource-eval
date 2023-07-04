mlir-opt doitgen.mlir --lower-affine --convert-scf-to-cf --convert-cf-to-llvm --convert-memref-to-llvm --convert-arith-to-llvm --convert-func-to-llvm --reconcile-unrealized-casts > doitgen-lowered.mlir

mlir-translate --mlir-to-llvmir doitgen-lowered.mlir > doitgen.llc

llc -filetype=obj doitgen.llc 

clang++  doitgen.llc.o  main.cpp

./a.out > results-doitgen-mlir.txt

./a.out thru-gcc > results-doitgen-gcc.txt

cmp --silent results-doitgen-mlir.txt results-doitgen-gcc.txt && echo '### Success ###' || echo '### Failure ###'

rm doitgen.llc doitgen.llc.o doitgen-lowered.mlir results-doitgen-mlir.txt results-doitgen-gcc.txt a.out 
