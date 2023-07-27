func.func @main() {
  %c0_i32 = arith.constant 0 : i32
  %c4_i32 = arith.constant 4 : i32
  %c5_i32 = arith.constant 5 : i32
  %alloca = memref.alloca() : memref<16x24xi32>
  %alloca_0 = memref.alloca() : memref<18x24xi32>
  %alloca_1 = memref.alloca() : memref<22x18xi32>
  %alloca_2 = memref.alloca() : memref<16x22xi32>
  %alloca_3 = memref.alloca() : memref<16x18xi32>
  affine.for %arg0 = 0 to 16 {
    affine.for %arg1 = 0 to 18 {
      affine.store %c0_i32, %alloca_3[%arg0, %arg1] : memref<16x18xi32>
      affine.for %arg2 = 0 to 22 {
        %0 = affine.load %alloca_2[%arg0, %arg2] : memref<16x22xi32>
        %1 = arith.muli %0, %c5_i32 : i32
        %2 = affine.load %alloca_1[%arg2, %arg1] : memref<22x18xi32>
        %3 = arith.muli %1, %2 : i32
        %4 = affine.load %alloca_3[%arg0, %arg1] : memref<16x18xi32>
        %5 = arith.addi %4, %3 : i32
        affine.store %5, %alloca_3[%arg0, %arg1] : memref<16x18xi32>
      }
    }
  }
  affine.for %arg0 = 0 to 16 {
    affine.for %arg1 = 0 to 24 {
      %0 = affine.load %alloca[%arg0, %arg1] : memref<16x24xi32>
      %1 = arith.muli %0, %c4_i32 : i32
      affine.store %1, %alloca[%arg0, %arg1] : memref<16x24xi32>
      affine.for %arg2 = 0 to 18 {
        %2 = affine.load %alloca_3[%arg0, %arg2] : memref<16x18xi32>
        %3 = affine.load %alloca_0[%arg2, %arg1] : memref<18x24xi32>
        %4 = arith.muli %2, %3 : i32
        %5 = affine.load %alloca[%arg0, %arg1] : memref<16x24xi32>
        %6 = arith.addi %5, %4 : i32
        affine.store %6, %alloca[%arg0, %arg1] : memref<16x24xi32>
      }
    }
  }
  return
}

