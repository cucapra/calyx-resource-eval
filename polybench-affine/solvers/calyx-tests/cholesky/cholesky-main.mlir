#map = affine_map<(d0) -> (d0)>
func.func @main() {
  %c75_i32 = arith.constant 75 : i32
  %alloca = memref.alloca() : memref<40x40xi32>
  affine.for %arg0 = 0 to 40 {
    affine.for %arg1 = 0 to #map(%arg0) {
      affine.for %arg2 = 0 to #map(%arg1) {
        %5 = affine.load %alloca[%arg0, %arg2] : memref<40x40xi32>
        %6 = affine.load %alloca[%arg1, %arg2] : memref<40x40xi32>
        %7 = arith.muli %5, %6 : i32
        %8 = affine.load %alloca[%arg0, %arg1] : memref<40x40xi32>
        %9 = arith.subi %8, %7 : i32
        affine.store %9, %alloca[%arg0, %arg1] : memref<40x40xi32>
      }
      %2 = affine.load %alloca[%arg1, %arg1] : memref<40x40xi32>
      %3 = affine.load %alloca[%arg0, %arg1] : memref<40x40xi32>
      %4 = arith.divsi %3, %2 : i32
      affine.store %4, %alloca[%arg0, %arg1] : memref<40x40xi32>
    }
    affine.for %arg1 = 0 to #map(%arg0) {
      %2 = affine.load %alloca[%arg0, %arg1] : memref<40x40xi32>
      %3 = arith.muli %2, %2 : i32
      %4 = affine.load %alloca[%arg0, %arg0] : memref<40x40xi32>
      %5 = arith.subi %4, %3 : i32
      affine.store %5, %alloca[%arg0, %arg0] : memref<40x40xi32>
    }
    %0 = affine.load %alloca[%arg0, %arg0] : memref<40x40xi32>
    %1 = arith.addi %0, %c75_i32 : i32
    affine.store %1, %alloca[%arg0, %arg0] : memref<40x40xi32>
  }
  return
}

