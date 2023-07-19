module {
  func.func @main() {
    %c0_i32 = arith.constant 0 : i32
    %alloca = memref.alloca() : memref<60xi32>
    %alloca_0 = memref.alloca() : memref<60x60xi32>
    %alloca_1 = memref.alloca() : memref<50x40x60xi32>
    affine.for %arg0 = 0 to 50 {
      affine.for %arg1 = 0 to 40 {
        affine.for %arg2 = 0 to 60 {
          affine.store %c0_i32, %alloca[%arg2] : memref<60xi32>
          affine.for %arg3 = 0 to 60 {
            %0 = affine.load %alloca_1[%arg0, %arg1, %arg3] : memref<50x40x60xi32>
            %1 = affine.load %alloca_0[%arg3, %arg2] : memref<60x60xi32>
            %2 = arith.muli %0, %1 : i32
            %3 = affine.load %alloca[%arg2] : memref<60xi32>
            %4 = arith.addi %3, %2 : i32
            affine.store %4, %alloca[%arg2] : memref<60xi32>
          }
        }
        affine.for %arg2 = 0 to 60 {
          %0 = affine.load %alloca[%arg2] : memref<60xi32>
          affine.store %0, %alloca_1[%arg0, %arg1, %arg2] : memref<50x40x60xi32>
        }
      }
    }
    return
  }
}
