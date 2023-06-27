func.func @kernel_bicg_affine(%arg0: memref<?x1900xf64>, %arg1: memref<?xf64>, %arg2: memref<?xf64>, %arg3: memref<?xf64>, %arg4: memref<?xf64>) attributes {llvm.linkage = #llvm.linkage<external>} {
  %cst = arith.constant 0.000000e+00 : f64
  affine.for %arg5 = 0 to 1900 {
    affine.store %cst, %arg1[%arg5] : memref<?xf64>
  }
  affine.for %arg5 = 0 to 2100 {
    affine.store %cst, %arg2[%arg5] : memref<?xf64>
    affine.for %arg6 = 0 to 1900 {
      %0 = affine.load %arg1[%arg6] : memref<?xf64>
      %1 = affine.load %arg4[%arg5] : memref<?xf64>
      %2 = affine.load %arg0[%arg5, %arg6] : memref<?x1900xf64>
      %3 = arith.mulf %1, %2 : f64
      %4 = arith.addf %0, %3 : f64
      affine.store %4, %arg1[%arg6] : memref<?xf64>
      %5 = affine.load %arg2[%arg5] : memref<?xf64>
      %6 = affine.load %arg0[%arg5, %arg6] : memref<?x1900xf64>
      %7 = affine.load %arg3[%arg6] : memref<?xf64>
      %8 = arith.mulf %6, %7 : f64
      %9 = arith.addf %5, %8 : f64
      affine.store %9, %arg2[%arg5] : memref<?xf64>
    }
  }
  return
}

