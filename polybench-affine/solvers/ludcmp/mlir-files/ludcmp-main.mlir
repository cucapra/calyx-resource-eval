#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (-d0 + 40)>
func.func @main() attributes {llvm.linkage = #llvm.linkage<external>} {
  %c0_i32 = arith.constant 0 : i32
  %alloca = memref.alloca() : memref<40xi32>
  %alloca_0 = memref.alloca() : memref<40xi32>
  %alloca_1 = memref.alloca() : memref<40xi32>
  %alloca_2 = memref.alloca() : memref<40x40xi32>
  %alloca_3 = memref.alloca() : memref<i32>
  affine.store %c0_i32, %alloca_3[] : memref<i32>
  affine.for %arg0 = 0 to 40 {
    affine.for %arg1 = 0 to #map(%arg0) {
      %0 = affine.load %alloca_2[%arg0, %arg1] : memref<40x40xi32>
      affine.store %0, %alloca_3[] : memref<i32>
      affine.for %arg2 = 0 to #map(%arg1) {
        %4 = affine.load %alloca_2[%arg0, %arg2] : memref<40x40xi32>
        %5 = affine.load %alloca_2[%arg2, %arg1] : memref<40x40xi32>
        %6 = arith.muli %4, %5 : i32
        %7 = affine.load %alloca_3[] : memref<i32>
        %8 = arith.subi %7, %6 : i32
        affine.store %8, %alloca_3[] : memref<i32>
      }
      %1 = affine.load %alloca_3[] : memref<i32>
      %2 = affine.load %alloca_2[%arg1, %arg1] : memref<40x40xi32>
      %3 = arith.divsi %1, %2 : i32
      affine.store %3, %alloca_2[%arg0, %arg1] : memref<40x40xi32>
    }
    affine.for %arg1 = #map(%arg0) to 40 {
      %0 = affine.load %alloca_2[%arg0, %arg1] : memref<40x40xi32>
      affine.store %0, %alloca_3[] : memref<i32>
      affine.for %arg2 = 0 to #map(%arg0) {
        %2 = affine.load %alloca_2[%arg0, %arg2] : memref<40x40xi32>
        %3 = affine.load %alloca_2[%arg2, %arg1] : memref<40x40xi32>
        %4 = arith.muli %2, %3 : i32
        %5 = affine.load %alloca_3[] : memref<i32>
        %6 = arith.subi %5, %4 : i32
        affine.store %6, %alloca_3[] : memref<i32>
      }
      %1 = affine.load %alloca_3[] : memref<i32>
      affine.store %1, %alloca_2[%arg0, %arg1] : memref<40x40xi32>
    }
  }
  affine.for %arg0 = 0 to 40 {
    %0 = affine.load %alloca_1[%arg0] : memref<40xi32>
    affine.store %0, %alloca_3[] : memref<i32>
    affine.for %arg1 = 0 to #map(%arg0) {
      %2 = affine.load %alloca_2[%arg0, %arg1] : memref<40x40xi32>
      %3 = affine.load %alloca[%arg1] : memref<40xi32>
      %4 = arith.muli %2, %3 : i32
      %5 = affine.load %alloca_3[] : memref<i32>
      %6 = arith.subi %5, %4 : i32
      affine.store %6, %alloca_3[] : memref<i32>
    }
    %1 = affine.load %alloca_3[] : memref<i32>
    affine.store %1, %alloca[%arg0] : memref<40xi32>
  }
  affine.for %arg0 = 0 to 40 {
    %0 = affine.load %alloca[-%arg0 + 39] : memref<40xi32>
    affine.store %0, %alloca_3[] : memref<i32>
    affine.for %arg1 = #map1(%arg0) to 40 {
      %4 = affine.load %alloca_2[-%arg0 + 39, %arg1] : memref<40x40xi32>
      %5 = affine.load %alloca_0[%arg1] : memref<40xi32>
      %6 = arith.muli %4, %5 : i32
      %7 = affine.load %alloca_3[] : memref<i32>
      %8 = arith.subi %7, %6 : i32
      affine.store %8, %alloca_3[] : memref<i32>
    }
    %1 = affine.load %alloca_3[] : memref<i32>
    %2 = affine.load %alloca_2[-%arg0 + 39, -%arg0 + 39] : memref<40x40xi32>
    %3 = arith.divsi %1, %2 : i32
    affine.store %3, %alloca_0[-%arg0 + 39] : memref<40xi32>
  }
  return
}

