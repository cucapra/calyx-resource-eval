#map = affine_map<(d0) -> (d0 + 1)>
func.func @kernel_syr2k_affine(%arg0: f64, %arg1: f64, %arg2: memref<?x1000xf64>, %arg3: memref<?x1000xf64>, %arg4: memref<?x1200xf64>) attributes {llvm.linkage = #llvm.linkage<external>} {
  affine.for %arg5 = 0 to 1200 {
    affine.for %arg6 = 0 to #map(%arg5) {
      %0 = affine.load %arg4[%arg5, %arg6] : memref<?x1200xf64>
      %1 = arith.mulf %0, %arg1 : f64
      affine.store %1, %arg4[%arg5, %arg6] : memref<?x1200xf64>
    }
    affine.for %arg6 = 0 to 1000 {
      affine.for %arg7 = 0 to #map(%arg5) {
        %0 = affine.load %arg2[%arg7, %arg6] : memref<?x1000xf64>
        %1 = arith.mulf %0, %arg0 : f64
        %2 = affine.load %arg3[%arg5, %arg6] : memref<?x1000xf64>
        %3 = arith.mulf %1, %2 : f64
        %4 = affine.load %arg3[%arg7, %arg6] : memref<?x1000xf64>
        %5 = arith.mulf %4, %arg0 : f64
        %6 = affine.load %arg2[%arg5, %arg6] : memref<?x1000xf64>
        %7 = arith.mulf %5, %6 : f64
        %8 = arith.addf %3, %7 : f64
        %9 = affine.load %arg4[%arg5, %arg7] : memref<?x1200xf64>
        %10 = arith.addf %9, %8 : f64
        affine.store %10, %arg4[%arg5, %arg7] : memref<?x1200xf64>
      }
    }
  }
  return
}

