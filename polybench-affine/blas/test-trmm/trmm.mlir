#map = affine_map<(d0) -> (d0 + 1)>
func.func @kernel_trmm_affine(%arg0: f64, %arg1: memref<?x1000xf64>, %arg2: memref<?x1200xf64>) attributes {llvm.linkage = #llvm.linkage<external>} {
  affine.for %arg3 = 0 to 1000 {
    affine.for %arg4 = 0 to 1200 {
      affine.for %arg5 = #map(%arg3) to 1000 {
        %2 = affine.load %arg1[%arg5, %arg3] : memref<?x1000xf64>
        %3 = affine.load %arg2[%arg5, %arg4] : memref<?x1200xf64>
        %4 = arith.mulf %2, %3 : f64
        %5 = affine.load %arg2[%arg3, %arg4] : memref<?x1200xf64>
        %6 = arith.addf %5, %4 : f64
        affine.store %6, %arg2[%arg3, %arg4] : memref<?x1200xf64>
      }
      %0 = affine.load %arg2[%arg3, %arg4] : memref<?x1200xf64>
      %1 = arith.mulf %arg0, %0 : f64
      affine.store %1, %arg2[%arg3, %arg4] : memref<?x1200xf64>
    }
  }
  return
}

