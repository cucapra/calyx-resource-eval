func.func @kernel_gemver_affine(%arg0: f64, %arg1: f64, %arg2: memref<?x2000xf64>, %arg3: memref<?xf64>, %arg4: memref<?xf64>, %arg5: memref<?xf64>, %arg6: memref<?xf64>, %arg7: memref<?xf64>, %arg8: memref<?xf64>, %arg9: memref<?xf64>, %arg10: memref<?xf64>) attributes {llvm.linkage = #llvm.linkage<external>} {
  affine.for %arg11 = 0 to 2000 {
    affine.for %arg12 = 0 to 2000 {
      %0 = affine.load %arg2[%arg11, %arg12] : memref<?x2000xf64>
      %1 = affine.load %arg3[%arg11] : memref<?xf64>
      %2 = affine.load %arg4[%arg12] : memref<?xf64>
      %3 = arith.mulf %1, %2 : f64
      %4 = arith.addf %0, %3 : f64
      %5 = affine.load %arg5[%arg11] : memref<?xf64>
      %6 = affine.load %arg6[%arg12] : memref<?xf64>
      %7 = arith.mulf %5, %6 : f64
      %8 = arith.addf %4, %7 : f64
      affine.store %8, %arg2[%arg11, %arg12] : memref<?x2000xf64>
    }
  }
  affine.for %arg11 = 0 to 2000 {
    affine.for %arg12 = 0 to 2000 {
      %0 = affine.load %arg8[%arg11] : memref<?xf64>
      %1 = affine.load %arg2[%arg12, %arg11] : memref<?x2000xf64>
      %2 = arith.mulf %arg1, %1 : f64
      %3 = affine.load %arg9[%arg12] : memref<?xf64>
      %4 = arith.mulf %2, %3 : f64
      %5 = arith.addf %0, %4 : f64
      affine.store %5, %arg8[%arg11] : memref<?xf64>
    }
  }
  affine.for %arg11 = 0 to 2000 {
    %0 = affine.load %arg8[%arg11] : memref<?xf64>
    %1 = affine.load %arg10[%arg11] : memref<?xf64>
    %2 = arith.addf %0, %1 : f64
    affine.store %2, %arg8[%arg11] : memref<?xf64>
  }
  affine.for %arg11 = 0 to 2000 {
    affine.for %arg12 = 0 to 2000 {
      %0 = affine.load %arg7[%arg11] : memref<?xf64>
      %1 = affine.load %arg2[%arg11, %arg12] : memref<?x2000xf64>
      %2 = arith.mulf %arg0, %1 : f64
      %3 = affine.load %arg8[%arg12] : memref<?xf64>
      %4 = arith.mulf %2, %3 : f64
      %5 = arith.addf %0, %4 : f64
      affine.store %5, %arg7[%arg11] : memref<?xf64>
    }
  }
  return
}

