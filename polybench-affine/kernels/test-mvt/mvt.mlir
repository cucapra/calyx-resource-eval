func.func @kernel_mvt_affine(%arg0: memref<?xf64>, %arg1: memref<?xf64>, %arg2: memref<?xf64>, %arg3: memref<?xf64>, %arg4: memref<?x2000xf64>) attributes {llvm.linkage = #llvm.linkage<external>} {
  affine.for %arg5 = 0 to 2000 {
    affine.for %arg6 = 0 to 2000 {
      %0 = affine.load %arg0[%arg5] : memref<?xf64>
      %1 = affine.load %arg4[%arg5, %arg6] : memref<?x2000xf64>
      %2 = affine.load %arg2[%arg6] : memref<?xf64>
      %3 = arith.mulf %1, %2 : f64
      %4 = arith.addf %0, %3 : f64
      affine.store %4, %arg0[%arg5] : memref<?xf64>
    }
  }
  affine.for %arg5 = 0 to 2000 {
    affine.for %arg6 = 0 to 2000 {
      %0 = affine.load %arg1[%arg5] : memref<?xf64>
      %1 = affine.load %arg4[%arg6, %arg5] : memref<?x2000xf64>
      %2 = affine.load %arg3[%arg6] : memref<?xf64>
      %3 = arith.mulf %1, %2 : f64
      %4 = arith.addf %0, %3 : f64
      affine.store %4, %arg1[%arg5] : memref<?xf64>
    }
  }
  return
}

