module {
  func.func @main() {
    %c0_i32 = arith.constant 0 : i32
    %alloca = memref.alloca() : memref<180x210xi32>
    %alloca_0 = memref.alloca() : memref<190x210xi32>
    %alloca_1 = memref.alloca() : memref<180x190xi32>
    %alloca_2 = memref.alloca() : memref<220x210xi32>
    %alloca_3 = memref.alloca() : memref<190x220xi32>
    %alloca_4 = memref.alloca() : memref<200x190xi32>
    %alloca_5 = memref.alloca() : memref<180x200xi32>
    affine.for %arg0 = 0 to 180 {
      affine.for %arg1 = 0 to 190 {
        affine.store %c0_i32, %alloca_1[%arg0, %arg1] : memref<180x190xi32>
        affine.for %arg2 = 0 to 200 {
          %0 = affine.load %alloca_5[%arg0, %arg2] : memref<180x200xi32>
          %1 = affine.load %alloca_4[%arg2, %arg1] : memref<200x190xi32>
          %2 = arith.muli %0, %1 : i32
          %3 = affine.load %alloca_1[%arg0, %arg1] : memref<180x190xi32>
          %4 = arith.addi %3, %2 : i32
          affine.store %4, %alloca_1[%arg0, %arg1] : memref<180x190xi32>
        }
      }
    }
    affine.for %arg0 = 0 to 190 {
      affine.for %arg1 = 0 to 210 {
        affine.store %c0_i32, %alloca_0[%arg0, %arg1] : memref<190x210xi32>
        affine.for %arg2 = 0 to 220 {
          %0 = affine.load %alloca_3[%arg0, %arg2] : memref<190x220xi32>
          %1 = affine.load %alloca_2[%arg2, %arg1] : memref<220x210xi32>
          %2 = arith.muli %0, %1 : i32
          %3 = affine.load %alloca_0[%arg0, %arg1] : memref<190x210xi32>
          %4 = arith.addi %3, %2 : i32
          affine.store %4, %alloca_0[%arg0, %arg1] : memref<190x210xi32>
        }
      }
    }
    affine.for %arg0 = 0 to 180 {
      affine.for %arg1 = 0 to 210 {
        affine.store %c0_i32, %alloca[%arg0, %arg1] : memref<180x210xi32>
        affine.for %arg2 = 0 to 190 {
          %0 = affine.load %alloca_1[%arg0, %arg2] : memref<180x190xi32>
          %1 = affine.load %alloca_0[%arg2, %arg1] : memref<190x210xi32>
          %2 = arith.muli %0, %1 : i32
          %3 = affine.load %alloca[%arg0, %arg1] : memref<180x210xi32>
          %4 = arith.addi %3, %2 : i32
          affine.store %4, %alloca[%arg0, %arg1] : memref<180x210xi32>
        }
      }
    }
    return
  }
}
