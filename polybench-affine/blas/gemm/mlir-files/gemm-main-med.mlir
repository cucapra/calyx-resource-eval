module {
  func.func @main() {
    %c2_i32 = arith.constant 2 : i32
    %c3_i32 = arith.constant 3 : i32
    %alloca = memref.alloca() : memref<200x220xi32>
    %alloca_0 = memref.alloca() : memref<240x220xi32>
    %alloca_1 = memref.alloca() : memref<200x240xi32>
    affine.for %arg0 = 0 to 200 {
      affine.for %arg1 = 0 to 220 {
        %0 = affine.load %alloca[%arg0, %arg1] : memref<200x220xi32>
        %1 = arith.muli %0, %c2_i32 : i32
        affine.store %1, %alloca[%arg0, %arg1] : memref<200x220xi32>
      }
      affine.for %arg1 = 0 to 240 {
        %0 = affine.load %alloca_1[%arg0, %arg1] : memref<200x240xi32>
        %1 = arith.muli %0, %c3_i32 : i32
        affine.for %arg2 = 0 to 220 {
          %2 = affine.load %alloca_0[%arg1, %arg2] : memref<240x220xi32>
          %3 = arith.muli %1, %2 : i32
          %4 = affine.load %alloca[%arg0, %arg2] : memref<200x220xi32>
          %5 = arith.addi %4, %3 : i32
          affine.store %5, %alloca[%arg0, %arg2] : memref<200x220xi32>
        }
      }
    }
    return
  }
}
