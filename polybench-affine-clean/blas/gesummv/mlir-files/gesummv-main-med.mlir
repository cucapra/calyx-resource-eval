module {
  func.func @main() {
    %c0_i32 = arith.constant 0 : i32
    %c2_i32 = arith.constant 2 : i32
    %c3_i32 = arith.constant 3 : i32
    %alloca = memref.alloca() : memref<250xi32>
    %alloca_0 = memref.alloca() : memref<250xi32>
    %alloca_1 = memref.alloca() : memref<250xi32>
    %alloca_2 = memref.alloca() : memref<250x250xi32>
    %alloca_3 = memref.alloca() : memref<250x250xi32>
    affine.for %arg0 = 0 to 250 {
      affine.store %c0_i32, %alloca_1[%arg0] : memref<250xi32>
      affine.store %c0_i32, %alloca[%arg0] : memref<250xi32>
      affine.for %arg1 = 0 to 250 {
        %5 = affine.load %alloca_3[%arg0, %arg1] : memref<250x250xi32>
        %6 = affine.load %alloca_0[%arg1] : memref<250xi32>
        %7 = arith.muli %5, %6 : i32
        %8 = affine.load %alloca_1[%arg0] : memref<250xi32>
        %9 = arith.addi %7, %8 : i32
        affine.store %9, %alloca_1[%arg0] : memref<250xi32>
        %10 = affine.load %alloca_2[%arg0, %arg1] : memref<250x250xi32>
        %11 = arith.muli %10, %6 : i32
        %12 = affine.load %alloca[%arg0] : memref<250xi32>
        %13 = arith.addi %11, %12 : i32
        affine.store %13, %alloca[%arg0] : memref<250xi32>
      }
      %0 = affine.load %alloca_1[%arg0] : memref<250xi32>
      %1 = arith.muli %0, %c3_i32 : i32
      %2 = affine.load %alloca[%arg0] : memref<250xi32>
      %3 = arith.muli %2, %c2_i32 : i32
      %4 = arith.addi %1, %3 : i32
      affine.store %4, %alloca[%arg0] : memref<250xi32>
    }
    return
  }
}
