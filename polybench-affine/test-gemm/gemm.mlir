func.func @kernel_gemm_affine(%arg0: f64, %arg1: f64, %arg2: memref<?x1200xf64>, %arg3: memref<?x1100xf64>, %arg4: memref<?x1100xf64>) attributes {llvm.linkage = #llvm.linkage<external>} {
  affine.for %arg5 = 0 to 1000 {
    affine.for %arg6 = 0 to 1100 {
      %0 = affine.load %arg4[%arg5, %arg6] : memref<?x1100xf64>
      %1 = arith.mulf %0, %arg1 : f64
      affine.store %1, %arg4[%arg5, %arg6] : memref<?x1100xf64>
    }
    affine.for %arg6 = 0 to 1200 {
      affine.for %arg7 = 0 to 1100 {
        %0 = affine.load %arg2[%arg5, %arg6] : memref<?x1200xf64>
        %1 = arith.mulf %arg0, %0 : f64
        %2 = affine.load %arg3[%arg6, %arg7] : memref<?x1100xf64>
        %3 = arith.mulf %1, %2 : f64
        %4 = affine.load %arg4[%arg5, %arg7] : memref<?x1100xf64>
        %5 = arith.addf %4, %3 : f64
        affine.store %5, %arg4[%arg5, %arg7] : memref<?x1100xf64>
      }
    }
  }
  return
}

