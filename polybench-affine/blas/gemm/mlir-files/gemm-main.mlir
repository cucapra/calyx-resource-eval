func.func @main() attributes {llvm.linkage = #llvm.linkage<external>} {
  %c2_i32 = arith.constant 2 : i32
  %c3_i32 = arith.constant 3 : i32
  %alloca = memref.alloca() : memref<20x25xi32>
  %alloca_0 = memref.alloca() : memref<30x25xi32>
  %alloca_1 = memref.alloca() : memref<20x30xi32>
  affine.for %arg0 = 0 to 20 {
    affine.for %arg1 = 0 to 25 {
      %0 = affine.load %alloca[%arg0, %arg1] : memref<20x25xi32>
      %1 = arith.muli %0, %c2_i32 : i32
      affine.store %1, %alloca[%arg0, %arg1] : memref<20x25xi32>
    }
    affine.for %arg1 = 0 to 30 {
      %0 = affine.load %alloca_1[%arg0, %arg1] : memref<20x30xi32>
      %1 = arith.muli %0, %c3_i32 : i32
      affine.for %arg2 = 0 to 25 {
        %2 = affine.load %alloca_0[%arg1, %arg2] : memref<30x25xi32>
        %3 = arith.muli %1, %2 : i32
        %4 = affine.load %alloca[%arg0, %arg2] : memref<20x25xi32>
        %5 = arith.addi %4, %3 : i32
        affine.store %5, %alloca[%arg0, %arg2] : memref<20x25xi32>
      }
    }
  }
  return
}

