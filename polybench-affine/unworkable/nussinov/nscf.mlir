module {
  func.func @main() {
    %c-61 = arith.constant -61 : index
    %c59 = arith.constant 59 : index
    %c-1 = arith.constant -1 : index
    %c1 = arith.constant 1 : index
    %c60 = arith.constant 60 : index
    %c0 = arith.constant 0 : index
    %c3_i32 = arith.constant 3 : i32
    %alloca = memref.alloca() : memref<60x60xi32>
    %alloca_0 = memref.alloca() : memref<60xi32>
    %0 = scf.while (%arg0 = %c0) : (index) -> index {
      %1 = arith.cmpi slt, %arg0, %c60 : index
      scf.condition(%1) %arg0 : index
    } do {
    ^bb0(%arg0: index):
      %1 = arith.addi %arg0, %c1 : index
      %2 = arith.muli %arg0, %c-1 : index
      %3 = arith.addi %2, %c60 : index
      %4 = scf.while (%arg1 = %3) : (index) -> index {
        %5 = arith.cmpi slt, %arg1, %c60 : index
        scf.condition(%5) %arg1 : index
      } do {
      ^bb0(%arg1: index):
        %5 = arith.addi %arg1, %c1 : index
        %6 = arith.addi %arg1, %c-1 : index
        %7 = arith.cmpi sge, %6, %c0 : index
        scf.if %7 {
          %18 = arith.muli %arg0, %c-1 : index
          %19 = arith.addi %18, %c59 : index
          %20 = memref.load %alloca[%19, %arg1] : memref<60x60xi32>
          %21 = arith.muli %arg0, %c-1 : index
          %22 = arith.addi %21, %c59 : index
          %23 = arith.addi %arg1, %c-1 : index
          %24 = memref.load %alloca[%22, %23] : memref<60x60xi32>
          %25 = arith.cmpi sge, %20, %24 : i32
          %26 = arith.select %25, %20, %24 : i32
          %27 = arith.muli %arg0, %c-1 : index
          %28 = arith.addi %27, %c59 : index
          memref.store %26, %alloca[%28, %arg1] : memref<60x60xi32>
        }
        %8 = arith.addi %arg0, %c-1 : index
        %9 = arith.cmpi sge, %8, %c0 : index
        scf.if %9 {
          %18 = arith.muli %arg0, %c-1 : index
          %19 = arith.addi %18, %c59 : index
          %20 = memref.load %alloca[%19, %arg1] : memref<60x60xi32>
          %21 = arith.muli %arg0, %c-1 : index
          %22 = arith.addi %21, %c60 : index
          %23 = memref.load %alloca[%22, %arg1] : memref<60x60xi32>
          %24 = arith.cmpi sge, %20, %23 : i32
          %25 = arith.select %24, %20, %23 : i32
          %26 = arith.muli %arg0, %c-1 : index
          %27 = arith.addi %26, %c59 : index
          memref.store %25, %alloca[%27, %arg1] : memref<60x60xi32>
        }
        %10 = arith.addi %arg1, %c-1 : index
        %11 = arith.cmpi sge, %10, %c0 : index
        %12 = arith.addi %arg0, %c-1 : index
        %13 = arith.cmpi sge, %12, %c0 : index
        %14 = arith.andi %11, %13 : i1
        scf.if %14 {
          %18 = arith.addi %arg0, %arg1 : index
          %19 = arith.addi %18, %c-61 : index
          %20 = arith.cmpi sge, %19, %c0 : index
          scf.if %20 {
            %21 = arith.muli %arg0, %c-1 : index
            %22 = arith.addi %21, %c59 : index
            %23 = memref.load %alloca[%22, %arg1] : memref<60x60xi32>
            %24 = arith.muli %arg0, %c-1 : index
            %25 = arith.addi %24, %c60 : index
            %26 = arith.addi %arg1, %c-1 : index
            %27 = memref.load %alloca[%25, %26] : memref<60x60xi32>
            %28 = arith.muli %arg0, %c-1 : index
            %29 = arith.addi %28, %c59 : index
            %30 = memref.load %alloca_0[%29] : memref<60xi32>
            %31 = memref.load %alloca_0[%arg1] : memref<60xi32>
            %32 = arith.addi %30, %31 : i32
            %33 = arith.cmpi eq, %32, %c3_i32 : i32
            %34 = arith.extui %33 : i1 to i32
            %35 = arith.addi %27, %34 : i32
            %36 = arith.cmpi sge, %23, %35 : i32
            %37 = arith.select %36, %23, %35 : i32
            %38 = arith.muli %arg0, %c-1 : index
            %39 = arith.addi %38, %c59 : index
            memref.store %37, %alloca[%39, %arg1] : memref<60x60xi32>
          } else {
            %21 = arith.muli %arg0, %c-1 : index
            %22 = arith.addi %21, %c59 : index
            %23 = memref.load %alloca[%22, %arg1] : memref<60x60xi32>
            %24 = arith.muli %arg0, %c-1 : index
            %25 = arith.addi %24, %c60 : index
            %26 = arith.addi %arg1, %c-1 : index
            %27 = memref.load %alloca[%25, %26] : memref<60x60xi32>
            %28 = arith.cmpi sge, %23, %27 : i32
            %29 = arith.select %28, %23, %27 : i32
            %30 = arith.muli %arg0, %c-1 : index
            %31 = arith.addi %30, %c59 : index
            memref.store %29, %alloca[%31, %arg1] : memref<60x60xi32>
          }
        }
        %15 = arith.muli %arg0, %c-1 : index
        %16 = arith.addi %15, %c60 : index
        %17 = scf.while (%arg2 = %16) : (index) -> index {
          %18 = arith.cmpi slt, %arg2, %arg1 : index
          scf.condition(%18) %arg2 : index
        } do {
        ^bb0(%arg2: index):
          %18 = arith.addi %arg2, %c1 : index
          %19 = arith.muli %arg0, %c-1 : index
          %20 = arith.addi %19, %c59 : index
          %21 = memref.load %alloca[%20, %arg1] : memref<60x60xi32>
          %22 = arith.muli %arg0, %c-1 : index
          %23 = arith.addi %22, %c59 : index
          %24 = memref.load %alloca[%23, %arg2] : memref<60x60xi32>
          %25 = arith.addi %arg2, %c1 : index
          %26 = memref.load %alloca[%25, %arg1] : memref<60x60xi32>
          %27 = arith.addi %24, %26 : i32
          %28 = arith.cmpi sge, %21, %27 : i32
          %29 = arith.select %28, %21, %27 : i32
          %30 = arith.muli %arg0, %c-1 : index
          %31 = arith.addi %30, %c59 : index
          memref.store %29, %alloca[%31, %arg1] : memref<60x60xi32>
          scf.yield %18 : index
        }
        scf.yield %5 : index
      }
      scf.yield %1 : index
    }
    return
  }
}

