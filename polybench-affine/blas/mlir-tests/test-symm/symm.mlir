#map = affine_map<(d0) -> (d0)>
func.func @kernel_symm_affine(%arg0: f64, %arg1: f64, %arg2: memref<?x1000xf64>, %arg3: memref<?x1200xf64>, %arg4: memref<?x1200xf64>) attributes {llvm.linkage = #llvm.linkage<external>} {
  %cst = arith.constant 0.000000e+00 : f64
  %alloca = memref.alloca() : memref<f64>
  %0 = llvm.mlir.undef : f64
  affine.store %0, %alloca[] : memref<f64>
  affine.for %arg5 = 0 to 1000 {
    affine.for %arg6 = 0 to 1200 {
      affine.store %cst, %alloca[] : memref<f64>
      affine.for %arg7 = 0 to #map(%arg5) {
        %11 = affine.load %arg3[%arg5, %arg6] : memref<?x1200xf64>
        %12 = arith.mulf %arg0, %11 : f64
        %13 = affine.load %arg2[%arg5, %arg7] : memref<?x1000xf64>
        %14 = arith.mulf %12, %13 : f64
        %15 = affine.load %arg4[%arg7, %arg6] : memref<?x1200xf64>
        %16 = arith.addf %15, %14 : f64
        affine.store %16, %arg4[%arg7, %arg6] : memref<?x1200xf64>
        %17 = affine.load %arg3[%arg7, %arg6] : memref<?x1200xf64>
        %18 = affine.load %arg2[%arg5, %arg7] : memref<?x1000xf64>
        %19 = arith.mulf %17, %18 : f64
        %20 = affine.load %alloca[] : memref<f64>
        %21 = arith.addf %20, %19 : f64
        affine.store %21, %alloca[] : memref<f64>
      }
      %1 = affine.load %arg4[%arg5, %arg6] : memref<?x1200xf64>
      %2 = arith.mulf %arg1, %1 : f64
      %3 = affine.load %arg3[%arg5, %arg6] : memref<?x1200xf64>
      %4 = arith.mulf %arg0, %3 : f64
      %5 = affine.load %arg2[%arg5, %arg5] : memref<?x1000xf64>
      %6 = arith.mulf %4, %5 : f64
      %7 = arith.addf %2, %6 : f64
      %8 = affine.load %alloca[] : memref<f64>
      %9 = arith.mulf %arg0, %8 : f64
      %10 = arith.addf %7, %9 : f64
      affine.store %10, %arg4[%arg5, %arg6] : memref<?x1200xf64>
    }
  }
  return
}

