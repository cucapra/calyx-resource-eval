#map = affine_map<(d0) -> (d0 + 1)>
module {
  func.func @main() {
    %c2_i32 = arith.constant 2 : i32
    %alloca = memref.alloca() : memref<240x240xi32>
    %alloca_0 = memref.alloca() : memref<240x200xi32>
    affine.for %arg0 = 0 to 240 {
      affine.for %arg1 = 0 to #map(%arg0) {
        %0 = affine.load %alloca[%arg0, %arg1] : memref<240x240xi32>
        affine.store %0, %alloca[%arg0, %arg1] : memref<240x240xi32>
      }
      affine.for %arg1 = 0 to 200 {
        %0 = affine.load %alloca_0[%arg0, %arg1] : memref<240x200xi32>
        %1 = arith.muli %0, %c2_i32 : i32
        affine.for %arg2 = 0 to #map(%arg0) {
          %2 = affine.load %alloca_0[%arg2, %arg1] : memref<240x200xi32>
          %3 = arith.muli %1, %2 : i32
          %4 = affine.load %alloca[%arg0, %arg2] : memref<240x240xi32>
          %5 = arith.addi %4, %3 : i32
          affine.store %5, %alloca[%arg0, %arg2] : memref<240x240xi32>
        }
      }
    }
    return
  }
}