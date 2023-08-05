module {
  func.func @main() {
    %c9_i32 = arith.constant 9 : i32
    %alloca = memref.alloca() : memref<40x40xi32>
    affine.for %arg0 = 0 to 20 {
      affine.for %arg1 = 1 to 39 {
        affine.for %arg2 = 1 to 39 {
          %0 = affine.load %alloca[%arg1 - 1, %arg2 - 1] : memref<40x40xi32>
          %1 = affine.load %alloca[%arg1 - 1, %arg2] : memref<40x40xi32>
          %2 = arith.addi %0, %1 : i32
          %3 = affine.load %alloca[%arg1 - 1, %arg2 + 1] : memref<40x40xi32>
          %4 = arith.addi %2, %3 : i32
          %5 = affine.load %alloca[%arg1, %arg2 - 1] : memref<40x40xi32>
          %6 = arith.addi %4, %5 : i32
          %7 = affine.load %alloca[%arg1, %arg2] : memref<40x40xi32>
          %8 = arith.addi %6, %7 : i32
          %9 = affine.load %alloca[%arg1, %arg2 + 1] : memref<40x40xi32>
          %10 = arith.addi %8, %9 : i32
          %11 = affine.load %alloca[%arg1 + 1, %arg2 - 1] : memref<40x40xi32>
          %12 = arith.addi %10, %11 : i32
          %13 = affine.load %alloca[%arg1 + 1, %arg2] : memref<40x40xi32>
          %14 = arith.addi %12, %13 : i32
          %15 = affine.load %alloca[%arg1 + 1, %arg2 + 1] : memref<40x40xi32>
          %16 = arith.addi %14, %15 : i32
          %17 = arith.divsi %16, %c9_i32 : i32
          affine.store %17, %alloca[%arg1, %arg2] : memref<40x40xi32>
        }
      }
    }
    return
  }
}
