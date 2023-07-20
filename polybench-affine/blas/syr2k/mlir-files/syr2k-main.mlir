#map = affine_map<(d0) -> (d0 + 1)>
func.func @main() {
  %c2_i32 = arith.constant 2 : i32
  %alloca = memref.alloca() : memref<30x30xi32>
  %alloca_0 = memref.alloca() : memref<30x20xi32>
  %alloca_1 = memref.alloca() : memref<30x20xi32>
  affine.for %arg0 = 0 to 30 {
    affine.for %arg1 = 0 to #map(%arg0) {
      %0 = affine.load %alloca[%arg0, %arg1] : memref<30x30xi32>
      affine.store %0, %alloca[%arg0, %arg1] : memref<30x30xi32>
    }
    affine.for %arg1 = 0 to 20 {
      %0 = affine.load %alloca_0[%arg0, %arg1] : memref<30x20xi32>
      %1 = affine.load %alloca_1[%arg0, %arg1] : memref<30x20xi32>
      affine.for %arg2 = 0 to #map(%arg0) {
        %2 = affine.load %alloca_1[%arg2, %arg1] : memref<30x20xi32>
        %3 = arith.muli %2, %c2_i32 : i32
        %4 = arith.muli %3, %0 : i32
        %5 = affine.load %alloca_0[%arg2, %arg1] : memref<30x20xi32>
        %6 = arith.muli %5, %c2_i32 : i32
        %7 = arith.muli %6, %1 : i32
        %8 = arith.addi %4, %7 : i32
        %9 = affine.load %alloca[%arg0, %arg2] : memref<30x30xi32>
        %10 = arith.addi %9, %8 : i32
        affine.store %10, %alloca[%arg0, %arg2] : memref<30x30xi32>
      }
    }
  }
  return
}

