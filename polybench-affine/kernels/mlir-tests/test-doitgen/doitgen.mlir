func.func @kernel_doitgen_affine(%arg0: memref<?x140x160xf64>, %arg1: memref<?x160xf64>, %arg2: memref<?xf64>) attributes {llvm.linkage = #llvm.linkage<external>} {
  %cst = arith.constant 0.000000e+00 : f64
  affine.for %arg3 = 0 to 150 {
    affine.for %arg4 = 0 to 140 {
      affine.for %arg5 = 0 to 160 {
        affine.store %cst, %arg2[%arg5] : memref<?xf64>
        affine.for %arg6 = 0 to 160 {
          %0 = affine.load %arg0[%arg3, %arg4, %arg6] : memref<?x140x160xf64>
          %1 = affine.load %arg1[%arg6, %arg5] : memref<?x160xf64>
          %2 = arith.mulf %0, %1 : f64
          %3 = affine.load %arg2[%arg5] : memref<?xf64>
          %4 = arith.addf %3, %2 : f64
          affine.store %4, %arg2[%arg5] : memref<?xf64>
        }
      }
      affine.for %arg5 = 0 to 160 {
        %0 = affine.load %arg2[%arg5] : memref<?xf64>
        affine.store %0, %arg0[%arg3, %arg4, %arg5] : memref<?x140x160xf64>
      }
    }
  }
  return
}

