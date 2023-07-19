#map = affine_map<(d0) -> (d0 + 1)>
module {
  func.func @main() {
    %c2_i32 = arith.constant 2 : i32
    %alloca = memref.alloca() : memref<200x240xi32>
    %alloca_0 = memref.alloca() : memref<200x200xi32>
    affine.for %arg0 = 0 to 200 {
      affine.for %arg1 = 0 to 240 {
        affine.for %arg2 = #map(%arg0) to 200 {
          %2 = affine.load %alloca_0[%arg2, %arg0] : memref<200x200xi32>
          %3 = affine.load %alloca[%arg2, %arg1] : memref<200x240xi32>
          %4 = arith.muli %2, %3 : i32
          %5 = affine.load %alloca[%arg0, %arg1] : memref<200x240xi32>
          %6 = arith.addi %5, %4 : i32
          affine.store %6, %alloca[%arg0, %arg1] : memref<200x240xi32>
        }
        %0 = affine.load %alloca[%arg0, %arg1] : memref<200x240xi32>
        %1 = arith.muli %0, %c2_i32 : i32
        affine.store %1, %alloca[%arg0, %arg1] : memref<200x240xi32>
      }
    }
    return
  }
}
