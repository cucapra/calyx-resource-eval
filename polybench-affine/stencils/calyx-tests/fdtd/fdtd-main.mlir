module {
  func.func @main() {
    %alloca = memref.alloca() : memref<20xi32>
    %alloca_0 = memref.alloca() : memref<20x30xi32>
    %alloca_1 = memref.alloca() : memref<20x30xi32>
    %alloca_2 = memref.alloca() : memref<20x30xi32>
    affine.for %arg0 = 0 to 20 {
      %0 = affine.load %alloca[%arg0] : memref<20xi32>
      affine.for %arg1 = 0 to 30 {
        affine.store %0, %alloca_1[0, %arg1] : memref<20x30xi32>
      }
      affine.for %arg1 = 1 to 20 {
        affine.for %arg2 = 0 to 30 {
          %1 = affine.load %alloca_1[%arg1, %arg2] : memref<20x30xi32>
          affine.store %1, %alloca_1[%arg1, %arg2] : memref<20x30xi32>
        }
      }
      affine.for %arg1 = 0 to 20 {
        affine.for %arg2 = 1 to 30 {
          %1 = affine.load %alloca_2[%arg1, %arg2] : memref<20x30xi32>
          affine.store %1, %alloca_2[%arg1, %arg2] : memref<20x30xi32>
        }
      }
      affine.for %arg1 = 0 to 19 {
        affine.for %arg2 = 0 to 29 {
          %1 = affine.load %alloca_0[%arg1, %arg2] : memref<20x30xi32>
          affine.store %1, %alloca_0[%arg1, %arg2] : memref<20x30xi32>
        }
      }
    }
    return
  }
}
