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
    cf.br ^bb1(%c0 : index)
  ^bb1(%0: index):  // 2 preds: ^bb0, ^bb17
    %1 = arith.cmpi slt, %0, %c60 : index
    cf.cond_br %1, ^bb2(%0 : index), ^bb18
  ^bb2(%2: index):  // pred: ^bb1
    %3 = arith.addi %2, %c1 : index
    %4 = arith.muli %2, %c-1 : index
    %5 = arith.addi %4, %c60 : index
    cf.br ^bb3(%5 : index)
  ^bb3(%6: index):  // 2 preds: ^bb2, ^bb16
    %7 = arith.cmpi slt, %6, %c60 : index
    cf.cond_br %7, ^bb4(%6 : index), ^bb17
  ^bb4(%8: index):  // pred: ^bb3
    %9 = arith.addi %8, %c1 : index
    %10 = arith.addi %8, %c-1 : index
    %11 = arith.cmpi sge, %10, %c0 : index
    cf.cond_br %11, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %12 = arith.muli %2, %c-1 : index
    %13 = arith.addi %12, %c59 : index
    %14 = memref.load %alloca[%13, %8] : memref<60x60xi32>
    %15 = arith.muli %2, %c-1 : index
    %16 = arith.addi %15, %c59 : index
    %17 = arith.addi %8, %c-1 : index
    %18 = memref.load %alloca[%16, %17] : memref<60x60xi32>
    %19 = arith.cmpi sge, %14, %18 : i32
    %20 = arith.select %19, %14, %18 : i32
    %21 = arith.muli %2, %c-1 : index
    %22 = arith.addi %21, %c59 : index
    memref.store %20, %alloca[%22, %8] : memref<60x60xi32>
    cf.br ^bb6
  ^bb6:  // 2 preds: ^bb4, ^bb5
    %23 = arith.addi %2, %c-1 : index
    %24 = arith.cmpi sge, %23, %c0 : index
    cf.cond_br %24, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %25 = arith.muli %2, %c-1 : index
    %26 = arith.addi %25, %c59 : index
    %27 = memref.load %alloca[%26, %8] : memref<60x60xi32>
    %28 = arith.muli %2, %c-1 : index
    %29 = arith.addi %28, %c60 : index
    %30 = memref.load %alloca[%29, %8] : memref<60x60xi32>
    %31 = arith.cmpi sge, %27, %30 : i32
    %32 = arith.select %31, %27, %30 : i32
    %33 = arith.muli %2, %c-1 : index
    %34 = arith.addi %33, %c59 : index
    memref.store %32, %alloca[%34, %8] : memref<60x60xi32>
    cf.br ^bb8
  ^bb8:  // 2 preds: ^bb6, ^bb7
    %35 = arith.addi %8, %c-1 : index
    %36 = arith.cmpi sge, %35, %c0 : index
    %37 = arith.addi %2, %c-1 : index
    %38 = arith.cmpi sge, %37, %c0 : index
    %39 = arith.andi %36, %38 : i1
    cf.cond_br %39, ^bb9, ^bb13
  ^bb9:  // pred: ^bb8
    %40 = arith.addi %2, %8 : index
    %41 = arith.addi %40, %c-61 : index
    %42 = arith.cmpi sge, %41, %c0 : index
    cf.cond_br %42, ^bb10, ^bb11
  ^bb10:  // pred: ^bb9
    %43 = arith.muli %2, %c-1 : index
    %44 = arith.addi %43, %c59 : index
    %45 = memref.load %alloca[%44, %8] : memref<60x60xi32>
    %46 = arith.muli %2, %c-1 : index
    %47 = arith.addi %46, %c60 : index
    %48 = arith.addi %8, %c-1 : index
    %49 = memref.load %alloca[%47, %48] : memref<60x60xi32>
    %50 = arith.muli %2, %c-1 : index
    %51 = arith.addi %50, %c59 : index
    %52 = memref.load %alloca_0[%51] : memref<60xi32>
    %53 = memref.load %alloca_0[%8] : memref<60xi32>
    %54 = arith.addi %52, %53 : i32
    %55 = arith.cmpi eq, %54, %c3_i32 : i32
    %56 = arith.extui %55 : i1 to i32
    %57 = arith.addi %49, %56 : i32
    %58 = arith.cmpi sge, %45, %57 : i32
    %59 = arith.select %58, %45, %57 : i32
    %60 = arith.muli %2, %c-1 : index
    %61 = arith.addi %60, %c59 : index
    memref.store %59, %alloca[%61, %8] : memref<60x60xi32>
    cf.br ^bb12
  ^bb11:  // pred: ^bb9
    %62 = arith.muli %2, %c-1 : index
    %63 = arith.addi %62, %c59 : index
    %64 = memref.load %alloca[%63, %8] : memref<60x60xi32>
    %65 = arith.muli %2, %c-1 : index
    %66 = arith.addi %65, %c60 : index
    %67 = arith.addi %8, %c-1 : index
    %68 = memref.load %alloca[%66, %67] : memref<60x60xi32>
    %69 = arith.cmpi sge, %64, %68 : i32
    %70 = arith.select %69, %64, %68 : i32
    %71 = arith.muli %2, %c-1 : index
    %72 = arith.addi %71, %c59 : index
    memref.store %70, %alloca[%72, %8] : memref<60x60xi32>
    cf.br ^bb12
  ^bb12:  // 2 preds: ^bb10, ^bb11
    cf.br ^bb13
  ^bb13:  // 2 preds: ^bb8, ^bb12
    %73 = arith.muli %2, %c-1 : index
    %74 = arith.addi %73, %c60 : index
    cf.br ^bb14(%74 : index)
  ^bb14(%75: index):  // 2 preds: ^bb13, ^bb15
    %76 = arith.cmpi slt, %75, %8 : index
    cf.cond_br %76, ^bb15(%75 : index), ^bb16
  ^bb15(%77: index):  // pred: ^bb14
    %78 = arith.addi %77, %c1 : index
    %79 = arith.muli %2, %c-1 : index
    %80 = arith.addi %79, %c59 : index
    %81 = memref.load %alloca[%80, %8] : memref<60x60xi32>
    %82 = arith.muli %2, %c-1 : index
    %83 = arith.addi %82, %c59 : index
    %84 = memref.load %alloca[%83, %77] : memref<60x60xi32>
    %85 = arith.addi %77, %c1 : index
    %86 = memref.load %alloca[%85, %8] : memref<60x60xi32>
    %87 = arith.addi %84, %86 : i32
    %88 = arith.cmpi sge, %81, %87 : i32
    %89 = arith.select %88, %81, %87 : i32
    %90 = arith.muli %2, %c-1 : index
    %91 = arith.addi %90, %c59 : index
    memref.store %89, %alloca[%91, %8] : memref<60x60xi32>
    cf.br ^bb14(%78 : index)
  ^bb16:  // pred: ^bb14
    cf.br ^bb3(%9 : index)
  ^bb17:  // pred: ^bb3
    cf.br ^bb1(%3 : index)
  ^bb18:  // pred: ^bb1
    return
  }
}

