module {
  func.func @main() {
    %alloca = memref.alloca() : memref<400x400xi32>
    %alloca_0 = memref.alloca() : memref<400xi32>
    %alloca_1 = memref.alloca() : memref<400xi32>
    %alloca_2 = memref.alloca() : memref<400xi32>
    %alloca_3 = memref.alloca() : memref<400xi32>
    affine.for %arg0 = 0 to 400 {
      affine.for %arg1 = 0 to 400 {
        %0 = affine.load %alloca_3[%arg0] : memref<400xi32>
        %1 = affine.load %alloca[%arg0, %arg1] : memref<400x400xi32>
        %2 = affine.load %alloca_1[%arg1] : memref<400xi32>
        %3 = arith.muli %1, %2 : i32
        %4 = arith.addi %0, %3 : i32
        affine.store %4, %alloca_3[%arg0] : memref<400xi32>
      }
    }
    affine.for %arg0 = 0 to 400 {
      affine.for %arg1 = 0 to 400 {
        %0 = affine.load %alloca_2[%arg0] : memref<400xi32>
        %1 = affine.load %alloca[%arg1, %arg0] : memref<400x400xi32>
        %2 = affine.load %alloca_0[%arg1] : memref<400xi32>
        %3 = arith.muli %1, %2 : i32
        %4 = arith.addi %0, %3 : i32
        affine.store %4, %alloca_2[%arg0] : memref<400xi32>
      }
    }
    return
  }
}