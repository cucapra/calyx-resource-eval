func.func @main() attributes {llvm.linkage = #llvm.linkage<external>} {
  %c0_i32 = arith.constant 0 : i32
  %alloca = memref.alloca() : memref<38xi32>
  %alloca_0 = memref.alloca() : memref<42xi32>
  %alloca_1 = memref.alloca() : memref<42xi32>
  %alloca_2 = memref.alloca() : memref<38x42xi32>
  affine.for %arg0 = 0 to 42 {
    affine.store %c0_i32, %alloca_0[%arg0] : memref<42xi32>
  }
  affine.for %arg0 = 0 to 38 {
    affine.store %c0_i32, %alloca[%arg0] : memref<38xi32>
    affine.for %arg1 = 0 to 42 {
      %1 = affine.load %alloca[%arg0] : memref<38xi32>
      %2 = affine.load %alloca_2[%arg0, %arg1] : memref<38x42xi32>
      %3 = affine.load %alloca_1[%arg1] : memref<42xi32>
      %4 = arith.muli %2, %3 : i32
      %5 = arith.addi %1, %4 : i32
      affine.store %5, %alloca[%arg0] : memref<38xi32>
    }
    %0 = affine.load %alloca[%arg0] : memref<38xi32>
    affine.for %arg1 = 0 to 42 {
      %1 = affine.load %alloca_0[%arg1] : memref<42xi32>
      %2 = affine.load %alloca_2[%arg0, %arg1] : memref<38x42xi32>
      %3 = arith.muli %2, %0 : i32
      %4 = arith.addi %1, %3 : i32
      affine.store %4, %alloca_0[%arg1] : memref<42xi32>
    }
  }
  return
}
