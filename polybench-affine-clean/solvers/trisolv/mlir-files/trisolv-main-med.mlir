#map = affine_map<(d0) -> (d0)>
module {
  func.func @main() {
    %alloca = memref.alloca() : memref<400xi32>
    %alloca_0 = memref.alloca() : memref<400x400xi32>
    %alloca_1 = memref.alloca() : memref<400xi32>
    affine.for %arg0 = 0 to 400 {
      %0 = affine.load %alloca_1[%arg0] : memref<400xi32>
      affine.store %0, %alloca[%arg0] : memref<400xi32>
      affine.for %arg1 = 0 to #map(%arg0) {
        %4 = affine.load %alloca_0[%arg0, %arg1] : memref<400x400xi32>
        %5 = affine.load %alloca[%arg1] : memref<400xi32>
        %6 = arith.muli %4, %5 : i32
        %7 = affine.load %alloca[%arg0] : memref<400xi32>
        %8 = arith.subi %7, %6 : i32
        affine.store %8, %alloca[%arg0] : memref<400xi32>
      }
      %1 = affine.load %alloca[%arg0] : memref<400xi32>
      %2 = affine.load %alloca_0[%arg0, %arg0] : memref<400x400xi32>
      %3 = arith.divsi %1, %2 : i32
      affine.store %3, %alloca[%arg0] : memref<400xi32>
    }
    return
  }
}
