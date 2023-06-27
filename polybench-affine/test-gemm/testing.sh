mlir-opt gemm.mlir --lower-affine --convert-scf-to-cf --convert-cf-to-llvm --convert-memref-to-llvm --convert-arith-to-llvm --convert-func-to-llvm --reconcile-unrealized-casts > gemm-lowered.mlir

mlir-translate --mlir-to-llvmir gemm-lowered.mlir > gemm.llc

llc -filetype=obj gemm.llc 

clang++  gemm.llc.o  main.cpp

./a.out > results-gemm-mlir.txt

./a.out thru-gcc > results-gemm-gcc.txt

cmp --silent results-gemm-mlir.txt results-gemm-gcc.txt && echo '### Success ###' || echo '### Failure ###'

rm gemm.llc gemm.llc.o gemm-lowered.mlir a.out results-gemm-mlir.txt results-gemm-gcc.txt
