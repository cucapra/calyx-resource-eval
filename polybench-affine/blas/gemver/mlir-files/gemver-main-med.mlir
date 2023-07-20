module {
  func.func @main() {
    %c2_i32 = arith.constant 2 : i32
    %c3_i32 = arith.constant 3 : i32
    %alloca = memref.alloca() : memref<400xi32>
    %alloca_0 = memref.alloca() : memref<400xi32>
    %alloca_1 = memref.alloca() : memref<400xi32>
    %alloca_2 = memref.alloca() : memref<400xi32>
    %alloca_3 = memref.alloca() : memref<400xi32>
    %alloca_4 = memref.alloca() : memref<400xi32>
    %alloca_5 = memref.alloca() : memref<400xi32>
    %alloca_6 = memref.alloca() : memref<400xi32>
    %alloca_7 = memref.alloca() : memref<400x400xi32>
    affine.for %arg0 = 0 to 400 {
      %0 = affine.load %alloca_6[%arg0] : memref<400xi32>
      %1 = affine.load %alloca_4[%arg0] : memref<400xi32>
      affine.for %arg1 = 0 to 400 {
        %2 = affine.load %alloca_7[%arg0, %arg1] : memref<400x400xi32>
        %3 = affine.load %alloca_5[%arg1] : memref<400xi32>
        %4 = arith.muli %0, %3 : i32
        %5 = arith.addi %2, %4 : i32
        %6 = affine.load %alloca_3[%arg1] : memref<400xi32>
        %7 = arith.muli %1, %6 : i32
        %8 = arith.addi %5, %7 : i32
        affine.store %8, %alloca_7[%arg0, %arg1] : memref<400x400xi32>
      }
    }
    affine.for %arg0 = 0 to 400 {
      affine.for %arg1 = 0 to 400 {
        %0 = affine.load %alloca_1[%arg0] : memref<400xi32>
        %1 = affine.load %alloca_7[%arg1, %arg0] : memref<400x400xi32>
        %2 = arith.muli %1, %c2_i32 : i32
        %3 = affine.load %alloca_0[%arg1] : memref<400xi32>
        %4 = arith.muli %2, %3 : i32
        %5 = arith.addi %0, %4 : i32
        affine.store %5, %alloca_1[%arg0] : memref<400xi32>
      }
    }
    affine.for %arg0 = 0 to 400 {
      %0 = affine.load %alloca_1[%arg0] : memref<400xi32>
      %1 = affine.load %alloca[%arg0] : memref<400xi32>
      %2 = arith.addi %0, %1 : i32
      affine.store %2, %alloca_1[%arg0] : memref<400xi32>
    }
    affine.for %arg0 = 0 to 400 {
      affine.for %arg1 = 0 to 400 {
        %0 = affine.load %alloca_2[%arg0] : memref<400xi32>
        %1 = affine.load %alloca_7[%arg0, %arg1] : memref<400x400xi32>
        %2 = arith.muli %1, %c3_i32 : i32
        %3 = affine.load %alloca_1[%arg1] : memref<400xi32>
        %4 = arith.muli %2, %3 : i32
        %5 = arith.addi %0, %4 : i32
        affine.store %5, %alloca_2[%arg0] : memref<400xi32>
      }
    }
    return
  }
}
