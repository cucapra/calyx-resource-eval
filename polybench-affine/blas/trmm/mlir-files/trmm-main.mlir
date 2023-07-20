#map = affine_map<(d0) -> (d0 + 1)>
func.func @main() attributes {llvm.linkage = #llvm.linkage<external>} {
  %c2_i32 = arith.constant 2 : i32
  %alloca = memref.alloca() : memref<20x30xi32>
  %alloca_0 = memref.alloca() : memref<20x20xi32>
  affine.for %arg0 = 0 to 20 {
    affine.for %arg1 = 0 to 30 {
      affine.for %arg2 = #map(%arg0) to 20 {
        %2 = affine.load %alloca_0[%arg2, %arg0] : memref<20x20xi32>
        %3 = affine.load %alloca[%arg2, %arg1] : memref<20x30xi32>
        %4 = arith.muli %2, %3 : i32
        %5 = affine.load %alloca[%arg0, %arg1] : memref<20x30xi32>
        %6 = arith.addi %5, %4 : i32
        affine.store %6, %alloca[%arg0, %arg1] : memref<20x30xi32>
      }
      %0 = affine.load %alloca[%arg0, %arg1] : memref<20x30xi32>
      %1 = arith.muli %0, %c2_i32 : i32
      affine.store %1, %alloca[%arg0, %arg1] : memref<20x30xi32>
    }
  }
  return
}

