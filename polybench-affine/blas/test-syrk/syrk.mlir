#map = affine_map<(d0) -> (d0 + 1)>
func.func @kernel_syrk_affine(%arg0: f64, %arg1: f64, %arg2: memref<?x1000xf64>, %arg3: memref<?x1200xf64>) attributes {llvm.linkage = #llvm.linkage<external>} {
  affine.for %arg4 = 0 to 1200 {
    affine.for %arg5 = 0 to #map(%arg4) {
      %0 = affine.load %arg3[%arg4, %arg5] : memref<?x1200xf64>
      %1 = arith.mulf %0, %arg1 : f64
      affine.store %1, %arg3[%arg4, %arg5] : memref<?x1200xf64>
    }
    affine.for %arg5 = 0 to 1000 {
      affine.for %arg6 = 0 to #map(%arg4) {
        %0 = affine.load %arg2[%arg4, %arg5] : memref<?x1000xf64>
        %1 = arith.mulf %arg0, %0 : f64
        %2 = affine.load %arg2[%arg6, %arg5] : memref<?x1000xf64>
        %3 = arith.mulf %1, %2 : f64
        %4 = affine.load %arg3[%arg4, %arg6] : memref<?x1200xf64>
        %5 = arith.addf %4, %3 : f64
        affine.store %5, %arg3[%arg4, %arg6] : memref<?x1200xf64>
      }
    }
  }
  return
}

