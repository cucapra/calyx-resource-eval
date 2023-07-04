func.func @main() {
  %c0_i32 = arith.constant 0 : i32
  %alloca = memref.alloca() : memref<12xi32>
  %alloca_0 = memref.alloca() : memref<12x12xi32>
  %alloca_1 = memref.alloca() : memref<10x8x12xi32>
  affine.for %arg0 = 0 to 10 {
    affine.for %arg1 = 0 to 8 {
      affine.for %arg2 = 0 to 12 {
        affine.store %c0_i32, %alloca[%arg2] : memref<12xi32>
        affine.for %arg3 = 0 to 12 {
          %0 = affine.load %alloca_1[%arg0, %arg1, %arg3] : memref<10x8x12xi32>
          %1 = affine.load %alloca_0[%arg3, %arg2] : memref<12x12xi32>
          %2 = arith.muli %0, %1 : i32
          %3 = affine.load %alloca[%arg2] : memref<12xi32>
          %4 = arith.addi %3, %2 : i32
          affine.store %4, %alloca[%arg2] : memref<12xi32>
        }
      }
      affine.for %arg2 = 0 to 12 {
        %0 = affine.load %alloca[%arg2] : memref<12xi32>
        affine.store %0, %alloca_1[%arg0, %arg1, %arg2] : memref<10x8x12xi32>
      }
    }
  }
  return
}
