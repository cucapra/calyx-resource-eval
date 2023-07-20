module {
  func.func @main() {
    %alloca = memref.alloca() : memref<60x60xi32>
    affine.for %arg0 = 0 to 60 {
      affine.for %arg1 = 0 to 60 {
        affine.for %arg2 = 0 to 60 {
          %0 = affine.load %alloca[%arg1, %arg2] : memref<60x60xi32>
          %1 = affine.load %alloca[%arg1, %arg0] : memref<60x60xi32>
          %2 = affine.load %alloca[%arg0, %arg2] : memref<60x60xi32>
          %3 = arith.addi %1, %2 : i32
          %4 = arith.cmpi slt, %0, %3 : i32
          %5 = arith.select %4, %0, %3 : i32
          affine.store %5, %alloca[%arg1, %arg2] : memref<60x60xi32>
        }
      }
    }
    return
  }
}
