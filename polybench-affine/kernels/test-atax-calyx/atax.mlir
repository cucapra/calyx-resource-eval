func.func @kernel_atax_affine(%arg0: memref<?x2100xf64>, %arg1: memref<?xf64>, %arg2: memref<?xf64>, %arg3: memref<?xf64>) attributes {llvm.linkage = #llvm.linkage<external>} {
  %cst = arith.constant 0.000000e+00 : f64
  affine.for %arg4 = 0 to 2100 {
    affine.store %cst, %arg2[%arg4] : memref<?xf64>
  }
  affine.for %arg4 = 0 to 1900 {
    affine.store %cst, %arg3[%arg4] : memref<?xf64>
    affine.for %arg5 = 0 to 2100 {
      %0 = affine.load %arg3[%arg4] : memref<?xf64>
      %1 = affine.load %arg0[%arg4, %arg5] : memref<?x2100xf64>
      %2 = affine.load %arg1[%arg5] : memref<?xf64>
      %3 = arith.mulf %1, %2 : f64
      %4 = arith.addf %0, %3 : f64
      affine.store %4, %arg3[%arg4] : memref<?xf64>
    }
    affine.for %arg5 = 0 to 2100 {
      %0 = affine.load %arg2[%arg5] : memref<?xf64>
      %1 = affine.load %arg0[%arg4, %arg5] : memref<?x2100xf64>
      %2 = affine.load %arg3[%arg4] : memref<?xf64>
      %3 = arith.mulf %1, %2 : f64
      %4 = arith.addf %0, %3 : f64
      affine.store %4, %arg2[%arg5] : memref<?xf64>
    }
  }
  return
}

