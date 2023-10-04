; ModuleID = '/tmp/tmp2btw5x4t/benchmark.prj/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%struct.ap_uint = type { %struct.ap_int_base }
%struct.ap_int_base = type { %struct.ssdm_int }
%struct.ssdm_int = type { i32 }

; Function Attrs: noinline
define void @apatb_kernel_ir(%struct.ap_uint* %A, %struct.ap_uint* %B, %struct.ap_uint* %v) local_unnamed_addr #0 {
entry:
  %A_copy = alloca [8 x %struct.ap_uint], align 512
  %B_copy = alloca [8 x %struct.ap_uint], align 512
  %v_copy = alloca [1 x %struct.ap_uint], align 512
  %0 = bitcast %struct.ap_uint* %A to [8 x %struct.ap_uint]*
  %1 = bitcast %struct.ap_uint* %B to [8 x %struct.ap_uint]*
  %2 = bitcast %struct.ap_uint* %v to [1 x %struct.ap_uint]*
  call fastcc void @copy_in([8 x %struct.ap_uint]* %0, [8 x %struct.ap_uint]* nonnull align 512 %A_copy, [8 x %struct.ap_uint]* %1, [8 x %struct.ap_uint]* nonnull align 512 %B_copy, [1 x %struct.ap_uint]* %2, [1 x %struct.ap_uint]* nonnull align 512 %v_copy)
  %3 = getelementptr inbounds [8 x %struct.ap_uint], [8 x %struct.ap_uint]* %A_copy, i32 0, i32 0
  %4 = getelementptr inbounds [8 x %struct.ap_uint], [8 x %struct.ap_uint]* %B_copy, i32 0, i32 0
  %5 = getelementptr inbounds [1 x %struct.ap_uint], [1 x %struct.ap_uint]* %v_copy, i32 0, i32 0
  call void @apatb_kernel_hw(%struct.ap_uint* %3, %struct.ap_uint* %4, %struct.ap_uint* %5)
  call fastcc void @copy_out([8 x %struct.ap_uint]* %0, [8 x %struct.ap_uint]* nonnull align 512 %A_copy, [8 x %struct.ap_uint]* %1, [8 x %struct.ap_uint]* nonnull align 512 %B_copy, [1 x %struct.ap_uint]* %2, [1 x %struct.ap_uint]* nonnull align 512 %v_copy)
  ret void
}

; Function Attrs: noinline
define internal fastcc void @copy_in([8 x %struct.ap_uint]*, [8 x %struct.ap_uint]* noalias align 512, [8 x %struct.ap_uint]*, [8 x %struct.ap_uint]* noalias align 512, [1 x %struct.ap_uint]*, [1 x %struct.ap_uint]* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a8struct.ap_uint([8 x %struct.ap_uint]* align 512 %1, [8 x %struct.ap_uint]* %0)
  call fastcc void @onebyonecpy_hls.p0a8struct.ap_uint([8 x %struct.ap_uint]* align 512 %3, [8 x %struct.ap_uint]* %2)
  call fastcc void @onebyonecpy_hls.p0a1struct.ap_uint([1 x %struct.ap_uint]* align 512 %5, [1 x %struct.ap_uint]* %4)
  ret void
}

; Function Attrs: noinline
define internal fastcc void @onebyonecpy_hls.p0a8struct.ap_uint([8 x %struct.ap_uint]* noalias align 512, [8 x %struct.ap_uint]* noalias) unnamed_addr #2 {
entry:
  %2 = icmp eq [8 x %struct.ap_uint]* %0, null
  %3 = icmp eq [8 x %struct.ap_uint]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop.head, %copy
  %for.loop.idx9 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop.head ]
  %dst.addr = getelementptr [8 x %struct.ap_uint], [8 x %struct.ap_uint]* %0, i64 0, i64 %for.loop.idx9
  %src.addr = getelementptr [8 x %struct.ap_uint], [8 x %struct.ap_uint]* %1, i64 0, i64 %for.loop.idx9
  %5 = bitcast %struct.ap_uint* %src.addr to i8*
  %6 = call i1 @fpga_fifo_exist_4(i8* %5)
  br i1 %6, label %7, label %8

; <label>:7:                                      ; preds = %for.loop
  call fastcc void @streamcpy_hls.p0struct.ap_uint(%struct.ap_uint* %dst.addr, %struct.ap_uint* %src.addr)
  br label %for.loop.head

; <label>:8:                                      ; preds = %for.loop
  %src.addr.01 = getelementptr [8 x %struct.ap_uint], [8 x %struct.ap_uint]* %1, i64 0, i64 %for.loop.idx9, i32 0
  %dst.addr.02 = getelementptr [8 x %struct.ap_uint], [8 x %struct.ap_uint]* %0, i64 0, i64 %for.loop.idx9, i32 0
  %9 = bitcast %struct.ap_int_base* %src.addr.01 to i8*
  %10 = call i1 @fpga_fifo_exist_4(i8* %9)
  br i1 %10, label %11, label %12

; <label>:11:                                     ; preds = %8
  call fastcc void @streamcpy_hls.p0struct.ap_int_base(%struct.ap_int_base* %dst.addr.02, %struct.ap_int_base* %src.addr.01)
  br label %for.loop.head

; <label>:12:                                     ; preds = %8
  %src.addr.0.03 = getelementptr [8 x %struct.ap_uint], [8 x %struct.ap_uint]* %1, i64 0, i64 %for.loop.idx9, i32 0, i32 0
  %dst.addr.0.04 = getelementptr [8 x %struct.ap_uint], [8 x %struct.ap_uint]* %0, i64 0, i64 %for.loop.idx9, i32 0, i32 0
  %13 = bitcast %struct.ssdm_int* %src.addr.0.03 to i8*
  %14 = call i1 @fpga_fifo_exist_4(i8* %13)
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  call fastcc void @streamcpy_hls.p0struct.ssdm_int(%struct.ssdm_int* %dst.addr.0.04, %struct.ssdm_int* %src.addr.0.03)
  br label %for.loop.head

; <label>:16:                                     ; preds = %12
  %dst.addr.0.0.06.gep7 = getelementptr [8 x %struct.ap_uint], [8 x %struct.ap_uint]* %0, i64 0, i64 %for.loop.idx9, i32 0, i32 0, i32 0
  %17 = bitcast i32* %dst.addr.0.0.06.gep7 to i8*
  %src.addr.0.0.05.gep8 = getelementptr [8 x %struct.ap_uint], [8 x %struct.ap_uint]* %1, i64 0, i64 %for.loop.idx9, i32 0, i32 0, i32 0
  %18 = bitcast i32* %src.addr.0.0.05.gep8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %17, i8* align 1 %18, i64 4, i1 false)
  br label %for.loop.head

for.loop.head:                                    ; preds = %16, %15, %11, %7
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx9, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 8
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop.head, %entry
  ret void
}

declare i1 @fpga_fifo_exist_4(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @streamcpy_hls.p0struct.ap_uint(%struct.ap_uint* noalias nocapture, %struct.ap_uint* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %struct.ap_uint
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %struct.ap_uint* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_4(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %struct.ap_uint* %2 to i8*
  %6 = bitcast %struct.ap_uint* %1 to i8*
  call void @fpga_fifo_pop_4(i8* %5, i8* %6)
  %7 = load volatile %struct.ap_uint, %struct.ap_uint* %2
  %8 = bitcast %struct.ap_uint* %2 to i8*
  %9 = bitcast %struct.ap_uint* %0 to i8*
  call void @fpga_fifo_push_4(i8* %8, i8* %9)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  %10 = bitcast %struct.ap_uint* %1 to i8*
  %11 = bitcast %struct.ap_uint* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 4, i1 false)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #4

; Function Attrs: argmemonly noinline
define internal fastcc void @streamcpy_hls.p0struct.ap_int_base(%struct.ap_int_base* noalias nocapture, %struct.ap_int_base* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %struct.ap_int_base
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %struct.ap_int_base* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_4(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %struct.ap_int_base* %2 to i8*
  %6 = bitcast %struct.ap_int_base* %1 to i8*
  call void @fpga_fifo_pop_4(i8* %5, i8* %6)
  %7 = load volatile %struct.ap_int_base, %struct.ap_int_base* %2
  %8 = bitcast %struct.ap_int_base* %2 to i8*
  %9 = bitcast %struct.ap_int_base* %0 to i8*
  call void @fpga_fifo_push_4(i8* %8, i8* %9)
  br label %empty, !llvm.loop !7

ret:                                              ; preds = %empty
  %10 = bitcast %struct.ap_int_base* %1 to i8*
  %11 = bitcast %struct.ap_int_base* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 4, i1 false)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @streamcpy_hls.p0struct.ssdm_int(%struct.ssdm_int* noalias nocapture, %struct.ssdm_int* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %struct.ssdm_int
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %struct.ssdm_int* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_4(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %struct.ssdm_int* %2 to i8*
  %6 = bitcast %struct.ssdm_int* %1 to i8*
  call void @fpga_fifo_pop_4(i8* %5, i8* %6)
  %7 = load volatile %struct.ssdm_int, %struct.ssdm_int* %2
  %8 = bitcast %struct.ssdm_int* %2 to i8*
  %9 = bitcast %struct.ssdm_int* %0 to i8*
  call void @fpga_fifo_push_4(i8* %8, i8* %9)
  br label %empty, !llvm.loop !8

ret:                                              ; preds = %empty
  %10 = bitcast %struct.ssdm_int* %1 to i8*
  %11 = bitcast %struct.ssdm_int* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 4, i1 false)
  ret void
}

; Function Attrs: noinline
define internal fastcc void @onebyonecpy_hls.p0a1struct.ap_uint([1 x %struct.ap_uint]* noalias align 512, [1 x %struct.ap_uint]* noalias) unnamed_addr #2 {
entry:
  %2 = icmp eq [1 x %struct.ap_uint]* %0, null
  %3 = icmp eq [1 x %struct.ap_uint]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %for.loop

for.loop:                                         ; preds = %entry
  %dst.addr = getelementptr [1 x %struct.ap_uint], [1 x %struct.ap_uint]* %0, i64 0, i64 0
  %src.addr = getelementptr [1 x %struct.ap_uint], [1 x %struct.ap_uint]* %1, i64 0, i64 0
  %5 = bitcast [1 x %struct.ap_uint]* %1 to i8*
  %6 = call i1 @fpga_fifo_exist_4(i8* %5)
  br i1 %6, label %7, label %8

; <label>:7:                                      ; preds = %for.loop
  call fastcc void @streamcpy_hls.p0struct.ap_uint(%struct.ap_uint* align 512 %dst.addr, %struct.ap_uint* %src.addr)
  br label %ret

; <label>:8:                                      ; preds = %for.loop
  %src.addr.01 = getelementptr [1 x %struct.ap_uint], [1 x %struct.ap_uint]* %1, i64 0, i64 0, i32 0
  %dst.addr.02 = getelementptr [1 x %struct.ap_uint], [1 x %struct.ap_uint]* %0, i64 0, i64 0, i32 0
  %9 = call i1 @fpga_fifo_exist_4(i8* %5)
  br i1 %9, label %10, label %11

; <label>:10:                                     ; preds = %8
  call fastcc void @streamcpy_hls.p0struct.ap_int_base(%struct.ap_int_base* align 512 %dst.addr.02, %struct.ap_int_base* %src.addr.01)
  br label %ret

; <label>:11:                                     ; preds = %8
  %src.addr.0.03 = getelementptr [1 x %struct.ap_uint], [1 x %struct.ap_uint]* %1, i64 0, i64 0, i32 0, i32 0
  %dst.addr.0.04 = getelementptr [1 x %struct.ap_uint], [1 x %struct.ap_uint]* %0, i64 0, i64 0, i32 0, i32 0
  %12 = call i1 @fpga_fifo_exist_4(i8* %5)
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %11
  call fastcc void @streamcpy_hls.p0struct.ssdm_int(%struct.ssdm_int* align 512 %dst.addr.0.04, %struct.ssdm_int* %src.addr.0.03)
  br label %ret

; <label>:14:                                     ; preds = %11
  %15 = bitcast [1 x %struct.ap_uint]* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %15, i8* align 1 %5, i64 4, i1 false)
  br label %ret

ret:                                              ; preds = %14, %13, %10, %7, %entry
  ret void
}

; Function Attrs: noinline
define internal fastcc void @copy_out([8 x %struct.ap_uint]*, [8 x %struct.ap_uint]* noalias align 512, [8 x %struct.ap_uint]*, [8 x %struct.ap_uint]* noalias align 512, [1 x %struct.ap_uint]*, [1 x %struct.ap_uint]* noalias align 512) unnamed_addr #5 {
entry:
  call fastcc void @onebyonecpy_hls.p0a8struct.ap_uint([8 x %struct.ap_uint]* %0, [8 x %struct.ap_uint]* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0a8struct.ap_uint([8 x %struct.ap_uint]* %2, [8 x %struct.ap_uint]* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0a1struct.ap_uint([1 x %struct.ap_uint]* %4, [1 x %struct.ap_uint]* align 512 %5)
  ret void
}

declare void @apatb_kernel_hw(%struct.ap_uint*, %struct.ap_uint*, %struct.ap_uint*)

define void @kernel_hw_stub_wrapper(%struct.ap_uint*, %struct.ap_uint*, %struct.ap_uint*) #6 {
entry:
  %3 = bitcast %struct.ap_uint* %0 to [8 x %struct.ap_uint]*
  %4 = bitcast %struct.ap_uint* %1 to [8 x %struct.ap_uint]*
  %5 = bitcast %struct.ap_uint* %2 to [1 x %struct.ap_uint]*
  call void @copy_out([8 x %struct.ap_uint]* null, [8 x %struct.ap_uint]* %3, [8 x %struct.ap_uint]* null, [8 x %struct.ap_uint]* %4, [1 x %struct.ap_uint]* null, [1 x %struct.ap_uint]* %5)
  %6 = bitcast [8 x %struct.ap_uint]* %3 to %struct.ap_uint*
  %7 = bitcast [8 x %struct.ap_uint]* %4 to %struct.ap_uint*
  %8 = bitcast [1 x %struct.ap_uint]* %5 to %struct.ap_uint*
  call void @kernel_hw_stub(%struct.ap_uint* %6, %struct.ap_uint* %7, %struct.ap_uint* %8)
  call void @copy_in([8 x %struct.ap_uint]* null, [8 x %struct.ap_uint]* %3, [8 x %struct.ap_uint]* null, [8 x %struct.ap_uint]* %4, [1 x %struct.ap_uint]* null, [1 x %struct.ap_uint]* %5)
  ret void
}

declare void @kernel_hw_stub(%struct.ap_uint*, %struct.ap_uint*, %struct.ap_uint*)

declare i1 @fpga_fifo_not_empty_4(i8*)

declare void @fpga_fifo_pop_4(i8*, i8*)

declare void @fpga_fifo_push_4(i8*, i8*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { noinline "fpga.wrapper.func"="copyin" }
attributes #2 = { noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline "fpga.wrapper.func"="streamcpy_hls" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { noinline "fpga.wrapper.func"="copyout" }
attributes #6 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.rotate.disable"}
!7 = distinct !{!7, !6}
!8 = distinct !{!8, !6}
