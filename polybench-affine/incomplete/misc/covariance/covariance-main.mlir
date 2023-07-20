#map = affine_map<(d0) -> (d0)>
module {
  func.func @main() {
    %c31_i32 = arith.constant 31 : i32
    %c0_i32 = arith.constant 0 : i32
    %c32_i32 = arith.constant 32 : i32
    %alloca = memref.alloca() : memref<28xi32>
    %alloca_0 = memref.alloca() : memref<28x28xi32>
    %alloca_1 = memref.alloca() : memref<32x28xi32>
    affine.for %arg0 = 0 to 28 {
      affine.store %c0_i32, %alloca[%arg0] : memref<28xi32>
      affine.for %arg1 = 0 to 32 {
        %2 = affine.load %alloca_1[%arg1, %arg0] : memref<32x28xi32>
        %3 = affine.load %alloca[%arg0] : memref<28xi32>
        %4 = arith.addi %3, %2 : i32
        affine.store %4, %alloca[%arg0] : memref<28xi32>
      }
      %0 = affine.load %alloca[%arg0] : memref<28xi32>
      %1 = arith.divsi %0, %c32_i32 : i32
      affine.store %1, %alloca[%arg0] : memref<28xi32>
    }
    affine.for %arg0 = 0 to 32 {
      affine.for %arg1 = 0 to 28 {
        %0 = affine.load %alloca[%arg1] : memref<28xi32>
        %1 = affine.load %alloca_1[%arg0, %arg1] : memref<32x28xi32>
        %2 = arith.subi %1, %0 : i32
        affine.store %2, %alloca_1[%arg0, %arg1] : memref<32x28xi32>
      }
    }
    affine.for %arg0 = 0 to 28 {
      affine.for %arg1 = #map(%arg0) to 28 {
        affine.store %c0_i32, %alloca_0[%arg0, %arg1] : memref<28x28xi32>
        affine.for %arg2 = 0 to 32 {
          %2 = affine.load %alloca_1[%arg2, %arg0] : memref<32x28xi32>
          %3 = affine.load %alloca_1[%arg2, %arg1] : memref<32x28xi32>
          %4 = arith.muli %2, %3 : i32
          %5 = affine.load %alloca_0[%arg0, %arg1] : memref<28x28xi32>
          %6 = arith.addi %5, %4 : i32
          affine.store %6, %alloca_0[%arg0, %arg1] : memref<28x28xi32>
        }
        %0 = affine.load %alloca_0[%arg0, %arg1] : memref<28x28xi32>
        %1 = arith.divsi %0, %c31_i32 : i32
        affine.store %1, %alloca_0[%arg0, %arg1] : memref<28x28xi32>
        affine.store %1, %alloca_0[%arg1, %arg0] : memref<28x28xi32>
      }
    }
    return
  }
}
