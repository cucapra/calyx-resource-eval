#map = affine_map<(d0) -> (d0)>
func.func @main() attributes {llvm.linkage = #llvm.linkage<external>} {
  %c0_i32 = arith.constant 0 : i32
  %c2_i32 = arith.constant 2 : i32
  %alloca = memref.alloca() : memref<20x30xi32>
  %alloca_0 = memref.alloca() : memref<20x30xi32>
  %alloca_1 = memref.alloca() : memref<20x20xi32>
  %alloca_2 = memref.alloca() : memref<i32>
  affine.store %c0_i32, %alloca_2[] : memref<i32>
  affine.for %arg0 = 0 to 20 {
    %0 = affine.load %alloca_1[%arg0, %arg0] : memref<20x20xi32>
    affine.for %arg1 = 0 to 30 {
      affine.store %c0_i32, %alloca_2[] : memref<i32>
      %1 = affine.load %alloca_0[%arg0, %arg1] : memref<20x30xi32>
      %2 = arith.muli %1, %c2_i32 : i32
      affine.for %arg2 = 0 to #map(%arg0) {
        %11 = affine.load %alloca_1[%arg0, %arg2] : memref<20x20xi32>
        %12 = arith.muli %2, %11 : i32
        %13 = affine.load %alloca[%arg2, %arg1] : memref<20x30xi32>
        %14 = arith.addi %13, %12 : i32
        affine.store %14, %alloca[%arg2, %arg1] : memref<20x30xi32>
        %15 = affine.load %alloca_0[%arg2, %arg1] : memref<20x30xi32>
        %16 = arith.muli %15, %11 : i32
        %17 = affine.load %alloca_2[] : memref<i32>
        %18 = arith.addi %17, %16 : i32
        affine.store %18, %alloca_2[] : memref<i32>
      }
      %3 = affine.load %alloca[%arg0, %arg1] : memref<20x30xi32>
      %4 = affine.load %alloca_0[%arg0, %arg1] : memref<20x30xi32>
      %5 = arith.muli %4, %c2_i32 : i32
      %6 = arith.muli %5, %0 : i32
      %7 = arith.addi %3, %6 : i32
      %8 = affine.load %alloca_2[] : memref<i32>
      %9 = arith.muli %8, %c2_i32 : i32
      %10 = arith.addi %7, %9 : i32
      affine.store %10, %alloca[%arg0, %arg1] : memref<20x30xi32>
    }
  }
  return
}

