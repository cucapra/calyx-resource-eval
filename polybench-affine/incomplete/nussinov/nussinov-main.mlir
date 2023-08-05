#map = affine_map<(d0) -> (-d0 + 60)>
#map1 = affine_map<(d0) -> (d0)>
#set = affine_set<(d0) : (d0 - 1 >= 0)>
#set1 = affine_set<(d0, d1) : (d0 - 1 >= 0, d1 - 1 >= 0)>
#set2 = affine_set<(d0, d1) : (d0 + d1 - 61 >= 0)>
module {
  func.func @main() {
    %c3_i32 = arith.constant 3 : i32
    %alloca = memref.alloca() : memref<60x60xi32>
    %alloca_0 = memref.alloca() : memref<60xi32>
    affine.for %arg0 = 0 to 60 {
      affine.for %arg1 = #map(%arg0) to 60 {
        affine.if #set(%arg1) {
          %0 = affine.load %alloca[-%arg0 + 59, %arg1] : memref<60x60xi32>
          %1 = affine.load %alloca[-%arg0 + 59, %arg1 - 1] : memref<60x60xi32>
          %2 = arith.cmpi sge, %0, %1 : i32
          %3 = arith.addi %0, %1 : i32
          affine.store %3, %alloca[-%arg0 + 59, %arg1] : memref<60x60xi32>
        }
        affine.if #set(%arg0) {
          %0 = affine.load %alloca[-%arg0 + 59, %arg1] : memref<60x60xi32>
          %1 = affine.load %alloca[-%arg0 + 60, %arg1] : memref<60x60xi32>
          %2 = arith.cmpi sge, %0, %1 : i32
          %3 = arith.addi %0, %1 : i32
          affine.store %3, %alloca[-%arg0 + 59, %arg1] : memref<60x60xi32>
        }
        affine.if #set1(%arg1, %arg0) {
          affine.if #set2(%arg0, %arg1) {
            %0 = affine.load %alloca[-%arg0 + 59, %arg1] : memref<60x60xi32>
            %1 = affine.load %alloca[-%arg0 + 60, %arg1 - 1] : memref<60x60xi32>
            %2 = affine.load %alloca_0[-%arg0 + 59] : memref<60xi32>
            %3 = affine.load %alloca_0[%arg1] : memref<60xi32>
            %4 = arith.addi %2, %3 : i32
            %5 = arith.cmpi eq, %4, %c3_i32 : i32
            %6 = arith.extui %5 : i1 to i32
            %7 = arith.addi %1, %6 : i32
            %8 = arith.cmpi sge, %0, %7 : i32
            %9 = arith.addi %0, %7 : i32
            affine.store %9, %alloca[-%arg0 + 59, %arg1] : memref<60x60xi32>
          } else {
            %0 = affine.load %alloca[-%arg0 + 59, %arg1] : memref<60x60xi32>
            %1 = affine.load %alloca[-%arg0 + 60, %arg1 - 1] : memref<60x60xi32>
            %2 = arith.cmpi sge, %0, %1 : i32
            %3 = arith.addi %0, %1 : i32
            affine.store %3, %alloca[-%arg0 + 59, %arg1] : memref<60x60xi32>
          }
        }
        affine.for %arg2 = #map(%arg0) to #map1(%arg1) {
          %0 = affine.load %alloca[-%arg0 + 59, %arg1] : memref<60x60xi32>
          %1 = affine.load %alloca[-%arg0 + 59, %arg2] : memref<60x60xi32>
          %2 = affine.load %alloca[%arg2 + 1, %arg1] : memref<60x60xi32>
          %3 = arith.addi %1, %2 : i32
          %4 = arith.cmpi sge, %0, %3 : i32
          %5 = arith.addi %0, %3 : i32
          affine.store %5, %alloca[-%arg0 + 59, %arg1] : memref<60x60xi32>
        }
      }
    }
    return
  }
}
