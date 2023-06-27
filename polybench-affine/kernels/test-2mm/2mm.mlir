func.func @kernel_2mm_affine(%arg0: f64, %arg1: f64, %arg2: memref<?x900xf64>, %arg3: memref<?x1100xf64>, %arg4: memref<?x900xf64>, %arg5: memref<?x1200xf64>, %arg6: memref<?x1200xf64>) attributes {llvm.emit_c_interface} {
  %cst = arith.constant 0.000000e+00 : f64
  affine.for %arg7 = 0 to 800 {
    affine.for %arg8 = 0 to 900 {
      affine.store %cst, %arg2[%arg7, %arg8] : memref<?x900xf64>
      affine.for %arg9 = 0 to 1100 {
        %0 = affine.load %arg3[%arg7, %arg9] : memref<?x1100xf64>
        %1 = arith.mulf %arg0, %0 : f64
        %2 = affine.load %arg4[%arg9, %arg8] : memref<?x900xf64>
        %3 = arith.mulf %1, %2 : f64
        %4 = affine.load %arg2[%arg7, %arg8] : memref<?x900xf64>
        %5 = arith.addf %4, %3 : f64
        affine.store %5, %arg2[%arg7, %arg8] : memref<?x900xf64>
      }
    }
  }
  affine.for %arg7 = 0 to 800 {
    affine.for %arg8 = 0 to 1200 {
      %0 = affine.load %arg6[%arg7, %arg8] : memref<?x1200xf64>
      %1 = arith.mulf %0, %arg1 : f64
      affine.store %1, %arg6[%arg7, %arg8] : memref<?x1200xf64>
      affine.for %arg9 = 0 to 900 {
        %2 = affine.load %arg2[%arg7, %arg9] : memref<?x900xf64>
        %3 = affine.load %arg5[%arg9, %arg8] : memref<?x1200xf64>
        %4 = arith.mulf %2, %3 : f64
        %5 = affine.load %arg6[%arg7, %arg8] : memref<?x1200xf64>
        %6 = arith.addf %5, %4 : f64
        affine.store %6, %arg6[%arg7, %arg8] : memref<?x1200xf64>
      }
    }
  }
  return
}
