#map = affine_map<(d0) -> (d0 + 1)>
module {
  func.func @main() {
    %c0_i32 = arith.constant 0 : i32
    %c99_i32 = arith.constant 99 : i32
    %alloca = memref.alloca() : memref<30x30xi32>
    %alloca_0 = memref.alloca() : memref<20x30xi32>
    %alloca_1 = memref.alloca() : memref<20x30xi32>
    %alloca_2 = memref.alloca() : memref<i32>
    affine.store %c0_i32, %alloca_2[] : memref<i32>
    affine.for %arg0 = 0 to 30 {
      affine.store %c0_i32, %alloca_2[] : memref<i32>
      affine.for %arg1 = 0 to 20 {
        %2 = affine.load %alloca_1[%arg1, %arg0] : memref<20x30xi32>
        %3 = arith.muli %2, %2 : i32
        %4 = affine.load %alloca_2[] : memref<i32>
        %5 = arith.addi %4, %3 : i32
        affine.store %5, %alloca_2[] : memref<i32>
      }
      %0 = affine.load %alloca_2[] : memref<i32>
      %1 = arith.muli %0, %c99_i32 : i32
      affine.store %1, %alloca[%arg0, %arg0] : memref<30x30xi32>
      affine.for %arg1 = 0 to 20 {
        %2 = affine.load %alloca_1[%arg1, %arg0] : memref<20x30xi32>
        %3 = arith.divsi %2, %1 : i32
        affine.store %3, %alloca_0[%arg1, %arg0] : memref<20x30xi32>
      }
      affine.for %arg1 = #map(%arg0) to 30 {
        affine.store %c0_i32, %alloca[%arg0, %arg1] : memref<30x30xi32>
        affine.for %arg2 = 0 to 20 {
          %3 = affine.load %alloca_0[%arg2, %arg0] : memref<20x30xi32>
          %4 = affine.load %alloca_1[%arg2, %arg1] : memref<20x30xi32>
          %5 = arith.muli %3, %4 : i32
          %6 = affine.load %alloca[%arg0, %arg1] : memref<30x30xi32>
          %7 = arith.addi %6, %5 : i32
          affine.store %7, %alloca[%arg0, %arg1] : memref<30x30xi32>
        }
        %2 = affine.load %alloca[%arg0, %arg1] : memref<30x30xi32>
        affine.for %arg2 = 0 to 20 {
          %3 = affine.load %alloca_1[%arg2, %arg1] : memref<20x30xi32>
          %4 = affine.load %alloca_0[%arg2, %arg0] : memref<20x30xi32>
          %5 = arith.muli %4, %2 : i32
          %6 = arith.subi %3, %5 : i32
          affine.store %6, %alloca_1[%arg2, %arg1] : memref<20x30xi32>
        }
      }
    }
    return
  }
}
