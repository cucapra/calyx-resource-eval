func.func @main() {
  %c0_i32 = arith.constant 0 : i32
  %alloca = memref.alloca() : memref<16x22xi32>
  %alloca_0 = memref.alloca() : memref<18x22xi32>
  %alloca_1 = memref.alloca() : memref<16x18xi32>
  %alloca_2 = memref.alloca() : memref<24x22xi32>
  %alloca_3 = memref.alloca() : memref<18x24xi32>
  %alloca_4 = memref.alloca() : memref<20x18xi32>
  %alloca_5 = memref.alloca() : memref<16x20xi32>
  affine.for %arg0 = 0 to 16 {
    affine.for %arg1 = 0 to 18 {
      affine.store %c0_i32, %alloca_1[%arg0, %arg1] : memref<16x18xi32>
      affine.for %arg2 = 0 to 20 {
        %0 = affine.load %alloca_5[%arg0, %arg2] : memref<16x20xi32>
        %1 = affine.load %alloca_4[%arg2, %arg1] : memref<20x18xi32>
        %2 = arith.muli %0, %1 : i32
        %3 = affine.load %alloca_1[%arg0, %arg1] : memref<16x18xi32>
        %4 = arith.addi %3, %2 : i32
        affine.store %4, %alloca_1[%arg0, %arg1] : memref<16x18xi32>
      }
    }
  }
  affine.for %arg0 = 0 to 18 {
    affine.for %arg1 = 0 to 22 {
      affine.store %c0_i32, %alloca_0[%arg0, %arg1] : memref<18x22xi32>
      affine.for %arg2 = 0 to 24 {
        %0 = affine.load %alloca_3[%arg0, %arg2] : memref<18x24xi32>
        %1 = affine.load %alloca_2[%arg2, %arg1] : memref<24x22xi32>
        %2 = arith.muli %0, %1 : i32
        %3 = affine.load %alloca_0[%arg0, %arg1] : memref<18x22xi32>
        %4 = arith.addi %3, %2 : i32
        affine.store %4, %alloca_0[%arg0, %arg1] : memref<18x22xi32>
      }
    }
  }
  affine.for %arg0 = 0 to 16 {
    affine.for %arg1 = 0 to 22 {
      affine.store %c0_i32, %alloca[%arg0, %arg1] : memref<16x22xi32>
      affine.for %arg2 = 0 to 18 {
        %0 = affine.load %alloca_1[%arg0, %arg2] : memref<16x18xi32>
        %1 = affine.load %alloca_0[%arg2, %arg1] : memref<18x22xi32>
        %2 = arith.muli %0, %1 : i32
        %3 = affine.load %alloca[%arg0, %arg1] : memref<16x22xi32>
        %4 = arith.addi %3, %2 : i32
        affine.store %4, %alloca[%arg0, %arg1] : memref<16x22xi32>
      }
    }
  }
  return
}

