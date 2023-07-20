#map = affine_map<(d0) -> (d0)>
module {
  func.func @main() {
    %alloca = memref.alloca() : memref<400x400xi32>
    affine.for %arg0 = 0 to 400 {
      affine.for %arg1 = 0 to #map(%arg0) {
        affine.for %arg2 = 0 to #map(%arg1) {
          %3 = affine.load %alloca[%arg0, %arg2] : memref<400x400xi32>
          %4 = affine.load %alloca[%arg2, %arg1] : memref<400x400xi32>
          %5 = arith.muli %3, %4 : i32
          %6 = affine.load %alloca[%arg0, %arg1] : memref<400x400xi32>
          %7 = arith.subi %6, %5 : i32
          affine.store %7, %alloca[%arg0, %arg1] : memref<400x400xi32>
        }
        %0 = affine.load %alloca[%arg1, %arg1] : memref<400x400xi32>
        %1 = affine.load %alloca[%arg0, %arg1] : memref<400x400xi32>
        %2 = arith.divsi %1, %0 : i32
        affine.store %2, %alloca[%arg0, %arg1] : memref<400x400xi32>
      }
      affine.for %arg1 = #map(%arg0) to 400 {
        affine.for %arg2 = 0 to #map(%arg0) {
          %0 = affine.load %alloca[%arg0, %arg2] : memref<400x400xi32>
          %1 = affine.load %alloca[%arg2, %arg1] : memref<400x400xi32>
          %2 = arith.muli %0, %1 : i32
          %3 = affine.load %alloca[%arg0, %arg1] : memref<400x400xi32>
          %4 = arith.subi %3, %2 : i32
          affine.store %4, %alloca[%arg0, %arg1] : memref<400x400xi32>
        }
      }
    }
    return
  }
}
