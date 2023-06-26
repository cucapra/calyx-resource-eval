func.func @kernel_3mm_affine(%arg0: memref<?x1000xf64>, %arg1: memref<?x900xf64>, %arg2: memref<?x1200xf64>, %arg3: memref<?x1100xf64>, %arg4: memref<?x900xf64>, %arg5: memref<?x1100xf64>, %arg6: memref<?x1100xf64>) attributes {llvm.linkage = #llvm.linkage<external>} {
  %cst = arith.constant 0.000000e+00 : f64
  affine.for %arg7 = 0 to 800 {
    affine.for %arg8 = 0 to 900 {
      affine.store %cst, %arg4[%arg7, %arg8] : memref<?x900xf64>
      affine.for %arg9 = 0 to 1000 {
        %0 = affine.load %arg0[%arg7, %arg9] : memref<?x1000xf64>
        %1 = affine.load %arg1[%arg9, %arg8] : memref<?x900xf64>
        %2 = arith.mulf %0, %1 : f64
        %3 = affine.load %arg4[%arg7, %arg8] : memref<?x900xf64>
        %4 = arith.addf %3, %2 : f64
        affine.store %4, %arg4[%arg7, %arg8] : memref<?x900xf64>
      }
    }
  }
  affine.for %arg7 = 0 to 900 {
    affine.for %arg8 = 0 to 1100 {
      affine.store %cst, %arg5[%arg7, %arg8] : memref<?x1100xf64>
      affine.for %arg9 = 0 to 1200 {
        %0 = affine.load %arg2[%arg7, %arg9] : memref<?x1200xf64>
        %1 = affine.load %arg3[%arg9, %arg8] : memref<?x1100xf64>
        %2 = arith.mulf %0, %1 : f64
        %3 = affine.load %arg5[%arg7, %arg8] : memref<?x1100xf64>
        %4 = arith.addf %3, %2 : f64
        affine.store %4, %arg5[%arg7, %arg8] : memref<?x1100xf64>
      }
    }
  }
  affine.for %arg7 = 0 to 800 {
    affine.for %arg8 = 0 to 1100 {
      affine.store %cst, %arg6[%arg7, %arg8] : memref<?x1100xf64>
      affine.for %arg9 = 0 to 900 {
        %0 = affine.load %arg4[%arg7, %arg9] : memref<?x900xf64>
        %1 = affine.load %arg5[%arg9, %arg8] : memref<?x1100xf64>
        %2 = arith.mulf %0, %1 : f64
        %3 = affine.load %arg6[%arg7, %arg8] : memref<?x1100xf64>
        %4 = arith.addf %3, %2 : f64
        affine.store %4, %arg6[%arg7, %arg8] : memref<?x1100xf64>
      }
    }
  }
  return
}

