module attributes {llvm.data_layout = ""} {
  llvm.func @kernel_2mm_affine(%arg0: f64, %arg1: f64, %arg2: !llvm.ptr<f64>, %arg3: !llvm.ptr<f64>, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: i64, %arg8: i64, %arg9: !llvm.ptr<f64>, %arg10: !llvm.ptr<f64>, %arg11: i64, %arg12: i64, %arg13: i64, %arg14: i64, %arg15: i64, %arg16: !llvm.ptr<f64>, %arg17: !llvm.ptr<f64>, %arg18: i64, %arg19: i64, %arg20: i64, %arg21: i64, %arg22: i64, %arg23: !llvm.ptr<f64>, %arg24: !llvm.ptr<f64>, %arg25: i64, %arg26: i64, %arg27: i64, %arg28: i64, %arg29: i64, %arg30: !llvm.ptr<f64>, %arg31: !llvm.ptr<f64>, %arg32: i64, %arg33: i64, %arg34: i64, %arg35: i64, %arg36: i64) attributes {llvm.emit_c_interface} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg2, %0[0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg3, %1[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.insertvalue %arg4, %2[2] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %4 = llvm.insertvalue %arg5, %3[3, 0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.insertvalue %arg7, %4[4, 0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %6 = llvm.insertvalue %arg6, %5[3, 1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.insertvalue %arg8, %6[4, 1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %8 = llvm.mlir.undef : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>
    %9 = llvm.insertvalue %arg9, %8[0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %10 = llvm.insertvalue %arg10, %9[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.insertvalue %arg11, %10[2] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %12 = llvm.insertvalue %arg12, %11[3, 0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.insertvalue %arg14, %12[4, 0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %14 = llvm.insertvalue %arg13, %13[3, 1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.insertvalue %arg15, %14[4, 1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.mlir.undef : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>
    %17 = llvm.insertvalue %arg16, %16[0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %18 = llvm.insertvalue %arg17, %17[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %19 = llvm.insertvalue %arg18, %18[2] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.insertvalue %arg19, %19[3, 0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %21 = llvm.insertvalue %arg21, %20[4, 0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %22 = llvm.insertvalue %arg20, %21[3, 1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.insertvalue %arg22, %22[4, 1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %24 = llvm.mlir.undef : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>
    %25 = llvm.insertvalue %arg23, %24[0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %26 = llvm.insertvalue %arg24, %25[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %27 = llvm.insertvalue %arg25, %26[2] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %28 = llvm.insertvalue %arg26, %27[3, 0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %29 = llvm.insertvalue %arg28, %28[4, 0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %30 = llvm.insertvalue %arg27, %29[3, 1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.insertvalue %arg29, %30[4, 1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %32 = llvm.mlir.undef : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>
    %33 = llvm.insertvalue %arg30, %32[0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %34 = llvm.insertvalue %arg31, %33[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.insertvalue %arg32, %34[2] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %36 = llvm.insertvalue %arg33, %35[3, 0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.insertvalue %arg35, %36[4, 0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %38 = llvm.insertvalue %arg34, %37[3, 1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %39 = llvm.insertvalue %arg36, %38[4, 1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %40 = llvm.mlir.constant(0.000000e+00 : f64) : f64
    %41 = llvm.mlir.constant(0 : index) : i64
    %42 = llvm.mlir.constant(800 : index) : i64
    %43 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb1(%41 : i64)
  ^bb1(%44: i64):  // 2 preds: ^bb0, ^bb8
    %45 = llvm.icmp "slt" %44, %42 : i64
    llvm.cond_br %45, ^bb2, ^bb9
  ^bb2:  // pred: ^bb1
    %46 = llvm.mlir.constant(0 : index) : i64
    %47 = llvm.mlir.constant(900 : index) : i64
    %48 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb3(%46 : i64)
  ^bb3(%49: i64):  // 2 preds: ^bb2, ^bb7
    %50 = llvm.icmp "slt" %49, %47 : i64
    llvm.cond_br %50, ^bb4, ^bb8
  ^bb4:  // pred: ^bb3
    %51 = llvm.extractvalue %7[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %52 = llvm.mlir.constant(900 : index) : i64
    %53 = llvm.mul %44, %52  : i64
    %54 = llvm.add %53, %49  : i64
    %55 = llvm.getelementptr %51[%54] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    llvm.store %40, %55 : !llvm.ptr<f64>
    %56 = llvm.mlir.constant(0 : index) : i64
    %57 = llvm.mlir.constant(1100 : index) : i64
    %58 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb5(%56 : i64)
  ^bb5(%59: i64):  // 2 preds: ^bb4, ^bb6
    %60 = llvm.icmp "slt" %59, %57 : i64
    llvm.cond_br %60, ^bb6, ^bb7
  ^bb6:  // pred: ^bb5
    %61 = llvm.extractvalue %15[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %62 = llvm.mlir.constant(1100 : index) : i64
    %63 = llvm.mul %44, %62  : i64
    %64 = llvm.add %63, %59  : i64
    %65 = llvm.getelementptr %61[%64] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    %66 = llvm.load %65 : !llvm.ptr<f64>
    %67 = llvm.fmul %arg0, %66  : f64
    %68 = llvm.extractvalue %23[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %69 = llvm.mlir.constant(900 : index) : i64
    %70 = llvm.mul %59, %69  : i64
    %71 = llvm.add %70, %49  : i64
    %72 = llvm.getelementptr %68[%71] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    %73 = llvm.load %72 : !llvm.ptr<f64>
    %74 = llvm.fmul %67, %73  : f64
    %75 = llvm.extractvalue %7[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %76 = llvm.mlir.constant(900 : index) : i64
    %77 = llvm.mul %44, %76  : i64
    %78 = llvm.add %77, %49  : i64
    %79 = llvm.getelementptr %75[%78] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    %80 = llvm.load %79 : !llvm.ptr<f64>
    %81 = llvm.fadd %80, %74  : f64
    %82 = llvm.extractvalue %7[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %83 = llvm.mlir.constant(900 : index) : i64
    %84 = llvm.mul %44, %83  : i64
    %85 = llvm.add %84, %49  : i64
    %86 = llvm.getelementptr %82[%85] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    llvm.store %81, %86 : !llvm.ptr<f64>
    %87 = llvm.add %59, %58  : i64
    llvm.br ^bb5(%87 : i64)
  ^bb7:  // pred: ^bb5
    %88 = llvm.add %49, %48  : i64
    llvm.br ^bb3(%88 : i64)
  ^bb8:  // pred: ^bb3
    %89 = llvm.add %44, %43  : i64
    llvm.br ^bb1(%89 : i64)
  ^bb9:  // pred: ^bb1
    %90 = llvm.mlir.constant(0 : index) : i64
    %91 = llvm.mlir.constant(800 : index) : i64
    %92 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb10(%90 : i64)
  ^bb10(%93: i64):  // 2 preds: ^bb9, ^bb17
    %94 = llvm.icmp "slt" %93, %91 : i64
    llvm.cond_br %94, ^bb11, ^bb18
  ^bb11:  // pred: ^bb10
    %95 = llvm.mlir.constant(0 : index) : i64
    %96 = llvm.mlir.constant(1200 : index) : i64
    %97 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb12(%95 : i64)
  ^bb12(%98: i64):  // 2 preds: ^bb11, ^bb16
    %99 = llvm.icmp "slt" %98, %96 : i64
    llvm.cond_br %99, ^bb13, ^bb17
  ^bb13:  // pred: ^bb12
    %100 = llvm.extractvalue %39[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %101 = llvm.mlir.constant(1200 : index) : i64
    %102 = llvm.mul %93, %101  : i64
    %103 = llvm.add %102, %98  : i64
    %104 = llvm.getelementptr %100[%103] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    %105 = llvm.load %104 : !llvm.ptr<f64>
    %106 = llvm.fmul %105, %arg1  : f64
    %107 = llvm.extractvalue %39[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %108 = llvm.mlir.constant(1200 : index) : i64
    %109 = llvm.mul %93, %108  : i64
    %110 = llvm.add %109, %98  : i64
    %111 = llvm.getelementptr %107[%110] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    llvm.store %106, %111 : !llvm.ptr<f64>
    %112 = llvm.mlir.constant(0 : index) : i64
    %113 = llvm.mlir.constant(900 : index) : i64
    %114 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb14(%112 : i64)
  ^bb14(%115: i64):  // 2 preds: ^bb13, ^bb15
    %116 = llvm.icmp "slt" %115, %113 : i64
    llvm.cond_br %116, ^bb15, ^bb16
  ^bb15:  // pred: ^bb14
    %117 = llvm.extractvalue %7[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %118 = llvm.mlir.constant(900 : index) : i64
    %119 = llvm.mul %93, %118  : i64
    %120 = llvm.add %119, %115  : i64
    %121 = llvm.getelementptr %117[%120] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    %122 = llvm.load %121 : !llvm.ptr<f64>
    %123 = llvm.extractvalue %31[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %124 = llvm.mlir.constant(1200 : index) : i64
    %125 = llvm.mul %115, %124  : i64
    %126 = llvm.add %125, %98  : i64
    %127 = llvm.getelementptr %123[%126] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    %128 = llvm.load %127 : !llvm.ptr<f64>
    %129 = llvm.fmul %122, %128  : f64
    %130 = llvm.extractvalue %39[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %131 = llvm.mlir.constant(1200 : index) : i64
    %132 = llvm.mul %93, %131  : i64
    %133 = llvm.add %132, %98  : i64
    %134 = llvm.getelementptr %130[%133] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    %135 = llvm.load %134 : !llvm.ptr<f64>
    %136 = llvm.fadd %135, %129  : f64
    %137 = llvm.extractvalue %39[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %138 = llvm.mlir.constant(1200 : index) : i64
    %139 = llvm.mul %93, %138  : i64
    %140 = llvm.add %139, %98  : i64
    %141 = llvm.getelementptr %137[%140] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    llvm.store %136, %141 : !llvm.ptr<f64>
    %142 = llvm.add %115, %114  : i64
    llvm.br ^bb14(%142 : i64)
  ^bb16:  // pred: ^bb14
    %143 = llvm.add %98, %97  : i64
    llvm.br ^bb12(%143 : i64)
  ^bb17:  // pred: ^bb12
    %144 = llvm.add %93, %92  : i64
    llvm.br ^bb10(%144 : i64)
  ^bb18:  // pred: ^bb10
    llvm.return
  }
  llvm.func @_mlir_ciface_kernel_2mm_affine(%arg0: f64, %arg1: f64, %arg2: !llvm.ptr<struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>>, %arg3: !llvm.ptr<struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>>, %arg4: !llvm.ptr<struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>>, %arg5: !llvm.ptr<struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>>, %arg6: !llvm.ptr<struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>>) attributes {llvm.emit_c_interface} {
    %0 = llvm.load %arg2 : !llvm.ptr<struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>>
    %1 = llvm.extractvalue %0[0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.extractvalue %0[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.extractvalue %0[2] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %4 = llvm.extractvalue %0[3, 0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.extractvalue %0[3, 1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %6 = llvm.extractvalue %0[4, 0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.extractvalue %0[4, 1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %8 = llvm.load %arg3 : !llvm.ptr<struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>>
    %9 = llvm.extractvalue %8[0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %10 = llvm.extractvalue %8[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.extractvalue %8[2] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %12 = llvm.extractvalue %8[3, 0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.extractvalue %8[3, 1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %14 = llvm.extractvalue %8[4, 0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.extractvalue %8[4, 1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.load %arg4 : !llvm.ptr<struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>>
    %17 = llvm.extractvalue %16[0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %18 = llvm.extractvalue %16[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %19 = llvm.extractvalue %16[2] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.extractvalue %16[3, 0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %21 = llvm.extractvalue %16[3, 1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %22 = llvm.extractvalue %16[4, 0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.extractvalue %16[4, 1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %24 = llvm.load %arg5 : !llvm.ptr<struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>>
    %25 = llvm.extractvalue %24[0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %26 = llvm.extractvalue %24[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %27 = llvm.extractvalue %24[2] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %28 = llvm.extractvalue %24[3, 0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %29 = llvm.extractvalue %24[3, 1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %30 = llvm.extractvalue %24[4, 0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.extractvalue %24[4, 1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %32 = llvm.load %arg6 : !llvm.ptr<struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>>
    %33 = llvm.extractvalue %32[0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %34 = llvm.extractvalue %32[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.extractvalue %32[2] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %36 = llvm.extractvalue %32[3, 0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.extractvalue %32[3, 1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %38 = llvm.extractvalue %32[4, 0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    %39 = llvm.extractvalue %32[4, 1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @kernel_2mm_affine(%arg0, %arg1, %1, %2, %3, %4, %5, %6, %7, %9, %10, %11, %12, %13, %14, %15, %17, %18, %19, %20, %21, %22, %23, %25, %26, %27, %28, %29, %30, %31, %33, %34, %35, %36, %37, %38, %39) : (f64, f64, !llvm.ptr<f64>, !llvm.ptr<f64>, i64, i64, i64, i64, i64, !llvm.ptr<f64>, !llvm.ptr<f64>, i64, i64, i64, i64, i64, !llvm.ptr<f64>, !llvm.ptr<f64>, i64, i64, i64, i64, i64, !llvm.ptr<f64>, !llvm.ptr<f64>, i64, i64, i64, i64, i64, !llvm.ptr<f64>, !llvm.ptr<f64>, i64, i64, i64, i64, i64) -> ()
    llvm.return
  }
}

