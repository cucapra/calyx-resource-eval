#map = affine_map<(d0) -> (d0)>
module {
  func.func @main() {
    %c1_i32 = arith.constant 1 : i32
    %c0_i32 = arith.constant 0 : i32
    %alloca = memref.alloca() : memref<400xi32>
    %alloca_0 = memref.alloca() : memref<400xi32>
    %alloca_1 = memref.alloca() : memref<400xi32>
    %0 = affine.load %alloca_1[0] : memref<400xi32>
    %1 = arith.subi %c0_i32, %0 : i32
    %alloca_2 = memref.alloca() : memref<i32>
    %alloca_3 = memref.alloca() : memref<i32>
    %alloca_4 = memref.alloca() : memref<i32>
    affine.store %1, %alloca_4[] : memref<i32>
    affine.store %c1_i32, %alloca_3[] : memref<i32>
    affine.store %c0_i32, %alloca_2[] : memref<i32>
    affine.store %1, %alloca_0[0] : memref<400xi32>
    affine.for %arg0 = 1 to 400 {
      %2 = affine.load %alloca_4[] : memref<i32>
      %3 = arith.muli %2, %2 : i32
      %4 = arith.subi %c1_i32, %3 : i32
      %5 = affine.load %alloca_3[] : memref<i32>
      %6 = arith.muli %4, %5 : i32
      affine.store %6, %alloca_3[] : memref<i32>
      affine.store %c0_i32, %alloca_2[] : memref<i32>
      affine.for %arg1 = 0 to #map(%arg0) {
        %12 = affine.load %alloca_1[%arg0 - %arg1 - 1] : memref<400xi32>
        %13 = affine.load %alloca_0[%arg1] : memref<400xi32>
        %14 = arith.muli %12, %13 : i32
        %15 = affine.load %alloca_2[] : memref<i32>
        %16 = arith.addi %15, %14 : i32
        affine.store %16, %alloca_2[] : memref<i32>
      }
      %7 = affine.load %alloca_1[%arg0] : memref<400xi32>
      %8 = affine.load %alloca_2[] : memref<i32>
      %9 = arith.addi %7, %8 : i32
      %10 = arith.subi %c0_i32, %9 : i32
      %11 = arith.divsi %10, %6 : i32
      affine.store %11, %alloca_4[] : memref<i32>
      affine.for %arg1 = 0 to #map(%arg0) {
        %12 = affine.load %alloca_0[%arg1] : memref<400xi32>
        %13 = affine.load %alloca_0[%arg0 - %arg1 - 1] : memref<400xi32>
        %14 = arith.muli %11, %13 : i32
        %15 = arith.addi %12, %14 : i32
        affine.store %15, %alloca[%arg1] : memref<400xi32>
      }
      affine.for %arg1 = 0 to #map(%arg0) {
        %12 = affine.load %alloca[%arg1] : memref<400xi32>
        affine.store %12, %alloca_0[%arg1] : memref<400xi32>
      }
      affine.store %11, %alloca_0[%arg0] : memref<400xi32>
    }
    return
  }
}
