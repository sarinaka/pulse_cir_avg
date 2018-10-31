; ModuleID = '/home/radar/pulse_cir_avg/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@wr_cnt_V = internal global i10 0
@seq_len_reg_V = internal unnamed_addr global i16 0
@rd_cnt_V = internal global i10 0
@pulse_cir_avg_str = internal unnamed_addr constant [14 x i8] c"pulse_cir_avg\00"
@pfetch_data_V = internal constant i40 0
@out_sample_cnt_V = internal unnamed_addr global i9 0
@out_fifo_OC_V_OC_V_str = internal unnamed_addr constant [13 x i8] c"out_fifo.V.V\00"
@out_fifo_V_V = internal global i64 0
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@data_in_valid_V = internal unnamed_addr global i1 false
@data_in_reg_V = internal unnamed_addr global i32 0
@data_fifo_OC_V_OC_V_str = internal unnamed_addr constant [14 x i8] c"data_fifo.V.V\00"
@data_fifo_V_V = internal global i64 0
@currentState = internal unnamed_addr global i2 0, align 1
@blk_cnt_V = internal unnamed_addr global i8 0
@avg_size_reg_V = internal unnamed_addr global i32 0
@ap_fifo_str = internal unnamed_addr constant [8 x i8] c"ap_fifo\00"
@p_str3 = private unnamed_addr constant [10 x i8] c"FIFO_BRAM\00", align 1
@p_str2 = private unnamed_addr constant [13 x i8] c"ap_ctrl_none\00", align 1
@p_str1 = private unnamed_addr constant [5 x i8] c"axis\00", align 1
@p_str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

define void @pulse_cir_avg(i32* %i_data_V_data_V, i1* %i_data_V_last_V, i32* %o_data_V_data_V, i1* %o_data_V_last_V, i32 %threshold_V, i16 %seq_len_V, i32 %avg_size_V) {
codeRepl:
  %empty = call i32 (...)* @_ssdm_op_SpecChannel([14 x i8]* @data_fifo_OC_V_OC_V_str, i32 1, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 8192, i32 8192, i64* @data_fifo_V_V, i64* @data_fifo_V_V)
  call void (...)* @_ssdm_op_SpecInterface(i64* @data_fifo_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  %empty_4 = call i32 (...)* @_ssdm_op_SpecChannel([13 x i8]* @out_fifo_OC_V_OC_V_str, i32 1, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 1024, i32 1024, i64* @out_fifo_V_V, i64* @out_fifo_V_V)
  call void (...)* @_ssdm_op_SpecInterface(i64* @out_fifo_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %i_data_V_data_V), !map !7
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %i_data_V_last_V), !map !11
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %o_data_V_data_V), !map !15
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %o_data_V_last_V), !map !19
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %threshold_V), !map !23
  call void (...)* @_ssdm_op_SpecBitsMap(i16 %seq_len_V), !map !29
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %avg_size_V), !map !33
  call void (...)* @_ssdm_op_SpecTopModule([14 x i8]* @pulse_cir_avg_str) nounwind
  %avg_size_V_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %avg_size_V)
  %seq_len_V_read = call i16 @_ssdm_op_Read.ap_auto.i16(i16 %seq_len_V)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %o_data_V_data_V, i1* %o_data_V_last_V, [5 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %i_data_V_data_V, i1* %i_data_V_last_V, [5 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [13 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind
  %currentState_load = load i2* @currentState, align 1
  call void (...)* @_ssdm_op_SpecReset(i2* @currentState, i32 1, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecMemCore(i64* @data_fifo_V_V, [1 x i8]* @p_str, [10 x i8]* @p_str3, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecMemCore(i64* @out_fifo_V_V, [1 x i8]* @p_str, [10 x i8]* @p_str3, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecReset(i10* @wr_cnt_V, i32 1, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecReset(i10* @rd_cnt_V, i32 1, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecReset(i32 1, [1 x i8]* @p_str) nounwind
  %seq_len_reg_V_load = load i16* @seq_len_reg_V, align 2
  %avg_size_reg_V_load = load i32* @avg_size_reg_V, align 4
  %data_in_valid_V_load = load i1* @data_in_valid_V, align 1
  %data_in_reg_V_load = load i32* @data_in_reg_V, align 4
  %wr_cnt_V_load = load i10* @wr_cnt_V, align 2
  %blk_cnt_V_load = load i8* @blk_cnt_V, align 1
  switch i2 %currentState_load, label %._crit_edge714 [
    i2 0, label %0
    i2 1, label %2
    i2 -2, label %7
  ]

; <label>:0                                       ; preds = %codeRepl
  store i16 %seq_len_V_read, i16* @seq_len_reg_V, align 2
  store i32 %avg_size_V_read, i32* @avg_size_reg_V, align 4
  br i1 %data_in_valid_V_load, label %1, label %._crit_edge715

; <label>:1                                       ; preds = %0
  %tmp_V = zext i32 %data_in_reg_V_load to i64
  call void @_ssdm_op_Write.ap_fifo.volatile.i64P(i64* @data_fifo_V_V, i64 %tmp_V)
  %tmp_2 = add i10 %wr_cnt_V_load, 1
  store i10 %tmp_2, i10* @wr_cnt_V, align 2
  store i2 1, i2* @currentState, align 1
  br label %._crit_edge715

._crit_edge715:                                   ; preds = %1, %0
  br label %._crit_edge714

; <label>:2                                       ; preds = %codeRepl
  br i1 %data_in_valid_V_load, label %3, label %._crit_edge716

; <label>:3                                       ; preds = %2
  %tmp_V_1 = zext i32 %data_in_reg_V_load to i64
  call void @_ssdm_op_Write.ap_fifo.volatile.i64P(i64* @data_fifo_V_V, i64 %tmp_V_1)
  %lhs_V_cast = zext i16 %seq_len_reg_V_load to i17
  %r_V = add i17 %lhs_V_cast, -1
  %tmp_6_cast = zext i10 %wr_cnt_V_load to i17
  %tmp_7 = icmp eq i17 %tmp_6_cast, %r_V
  br i1 %tmp_7, label %4, label %5

; <label>:4                                       ; preds = %3
  store i10 0, i10* @wr_cnt_V, align 2
  store i8 1, i8* @blk_cnt_V, align 1
  br label %6

; <label>:5                                       ; preds = %3
  %tmp_3 = add i10 %wr_cnt_V_load, 1
  store i10 %tmp_3, i10* @wr_cnt_V, align 2
  br label %6

; <label>:6                                       ; preds = %5, %4
  %storemerge1 = phi i2 [ 1, %5 ], [ -2, %4 ]
  store i2 %storemerge1, i2* @currentState, align 1
  br label %._crit_edge716

._crit_edge716:                                   ; preds = %6, %2
  br label %._crit_edge714

; <label>:7                                       ; preds = %codeRepl
  br i1 %data_in_valid_V_load, label %8, label %._crit_edge717

; <label>:8                                       ; preds = %7
  %lhs_V_1_cast = zext i32 %avg_size_reg_V_load to i33
  %r_V_1 = add i33 %lhs_V_1_cast, -1
  %tmp_cast = zext i8 %blk_cnt_V_load to i33
  %tmp_1 = icmp slt i33 %tmp_cast, %r_V_1
  br i1 %tmp_1, label %9, label %13

; <label>:9                                       ; preds = %8
  %tmp_V_2 = call i64 @_ssdm_op_Read.ap_fifo.volatile.i64P(i64* @data_fifo_V_V)
  %tmp_4 = zext i32 %data_in_reg_V_load to i64
  %tmp_V_3 = add i64 %tmp_V_2, %tmp_4
  call void @_ssdm_op_Write.ap_fifo.volatile.i64P(i64* @data_fifo_V_V, i64 %tmp_V_3)
  %lhs_V_2_cast = zext i16 %seq_len_reg_V_load to i17
  %r_V_2 = add i17 %lhs_V_2_cast, -1
  %tmp_8_cast = zext i10 %wr_cnt_V_load to i17
  %tmp_9 = icmp eq i17 %tmp_8_cast, %r_V_2
  br i1 %tmp_9, label %10, label %11

; <label>:10                                      ; preds = %9
  store i10 0, i10* @wr_cnt_V, align 2
  %tmp_s = add i8 %blk_cnt_V_load, 1
  store i8 %tmp_s, i8* @blk_cnt_V, align 1
  store i2 -2, i2* @currentState, align 1
  br label %12

; <label>:11                                      ; preds = %9
  %tmp_6 = add i10 %wr_cnt_V_load, 1
  store i10 %tmp_6, i10* @wr_cnt_V, align 2
  br label %12

; <label>:12                                      ; preds = %11, %10
  br label %20

; <label>:13                                      ; preds = %8
  %tmp_5 = icmp eq i32 %avg_size_reg_V_load, 0
  %tmp_V_4 = call i64 @_ssdm_op_Read.ap_fifo.volatile.i64P(i64* @data_fifo_V_V)
  br i1 %tmp_5, label %15, label %14

; <label>:14                                      ; preds = %13
  %lhs_V = zext i32 %data_in_reg_V_load to i65
  %rhs_V = zext i64 %tmp_V_4 to i65
  %r_V_3 = add i65 %rhs_V, %lhs_V
  %tmp_10 = zext i32 %avg_size_reg_V_load to i65
  %r_V_4 = udiv i65 %r_V_3, %tmp_10
  %tmp_data_V_1 = trunc i65 %r_V_4 to i32
  br label %16

; <label>:15                                      ; preds = %13
  %tmp_8 = trunc i64 %tmp_V_4 to i32
  %tmp_data_V = add i32 %data_in_reg_V_load, %tmp_8
  br label %16

; <label>:16                                      ; preds = %15, %14
  %p_2 = phi i32 [ %tmp_data_V_1, %14 ], [ %tmp_data_V, %15 ]
  %tmp_V_5 = zext i32 %p_2 to i64
  call void @_ssdm_op_Write.ap_fifo.volatile.i64P(i64* @out_fifo_V_V, i64 %tmp_V_5)
  %lhs_V_4_cast = zext i16 %seq_len_reg_V_load to i17
  %r_V_5 = add i17 %lhs_V_4_cast, -1
  %tmp_14_cast = zext i10 %wr_cnt_V_load to i17
  %tmp_11 = icmp eq i17 %tmp_14_cast, %r_V_5
  br i1 %tmp_11, label %17, label %18

; <label>:17                                      ; preds = %16
  store i10 0, i10* @wr_cnt_V, align 2
  store i8 0, i8* @blk_cnt_V, align 1
  store i2 0, i2* @currentState, align 1
  br label %19

; <label>:18                                      ; preds = %16
  %tmp_12 = add i10 %wr_cnt_V_load, 1
  store i10 %tmp_12, i10* @wr_cnt_V, align 2
  br label %19

; <label>:19                                      ; preds = %18, %17
  br label %20

; <label>:20                                      ; preds = %19, %12
  br label %._crit_edge717

._crit_edge717:                                   ; preds = %20, %7
  br label %._crit_edge714

._crit_edge714:                                   ; preds = %._crit_edge717, %._crit_edge716, %._crit_edge715, %codeRepl
  %seq_len_reg_V_loc = phi i16 [ %seq_len_reg_V_load, %codeRepl ], [ %seq_len_reg_V_load, %._crit_edge717 ], [ %seq_len_reg_V_load, %._crit_edge716 ], [ %seq_len_V_read, %._crit_edge715 ]
  %tmp = call i1 @_ssdm_op_NbReadReq.ap_fifo.i64P(i64* @out_fifo_V_V, i32 1)
  br i1 %tmp, label %_ifconv, label %._crit_edge718

_ifconv:                                          ; preds = %._crit_edge714
  %tmp_V_6 = call i64 @_ssdm_op_Read.ap_fifo.volatile.i64P(i64* @out_fifo_V_V)
  %tmp_data_V_5 = trunc i64 %tmp_V_6 to i32
  %out_sample_cnt_V_load = load i9* @out_sample_cnt_V, align 2
  %tmp_13 = icmp eq i9 %out_sample_cnt_V_load, -253
  %rd_cnt_V_load = load i10* @rd_cnt_V, align 2
  %lhs_V_5_cast = zext i16 %seq_len_reg_V_loc to i17
  %r_V_6 = add i17 -1, %lhs_V_5_cast
  %tmp_19_cast = zext i10 %rd_cnt_V_load to i17
  %tmp_14 = icmp eq i17 %tmp_19_cast, %r_V_6
  %tmp_15 = add i9 1, %out_sample_cnt_V_load
  %tmp_last_V = or i1 %tmp_13, %tmp_14
  %storemerge = select i1 %tmp_last_V, i9 0, i9 %tmp_15
  store i9 %storemerge, i9* @out_sample_cnt_V, align 2
  %tmp_16 = add i10 1, %rd_cnt_V_load
  %storemerge2 = select i1 %tmp_14, i10 0, i10 %tmp_16
  store i10 %storemerge2, i10* @rd_cnt_V, align 2
  call void @_ssdm_op_Write.axis.volatile.i32P.i1P(i32* %o_data_V_data_V, i1* %o_data_V_last_V, i32 %tmp_data_V_5, i1 %tmp_last_V)
  br label %._crit_edge718

._crit_edge718:                                   ; preds = %_ifconv, %._crit_edge714
  %tmp_17 = call i1 @_ssdm_op_NbReadReq.axis.i32P.i1P(i32* %i_data_V_data_V, i1* %i_data_V_last_V, i32 1)
  br i1 %tmp_17, label %21, label %._crit_edge722

; <label>:21                                      ; preds = %._crit_edge718
  %empty_6 = call { i32, i1 } @_ssdm_op_Read.axis.volatile.i32P.i1P(i32* %i_data_V_data_V, i1* %i_data_V_last_V)
  %tmp_data_V_1_7 = extractvalue { i32, i1 } %empty_6, 0
  store i32 %tmp_data_V_1_7, i32* @data_in_reg_V, align 4
  br label %._crit_edge722

._crit_edge722:                                   ; preds = %21, %._crit_edge718
  %storemerge3 = phi i1 [ true, %21 ], [ false, %._crit_edge718 ]
  store i1 %storemerge3, i1* @data_in_valid_V, align 1
  ret void
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define weak void @_ssdm_op_Write.axis.volatile.i32P.i1P(i32*, i1*, i32, i1) {
entry:
  store i32 %2, i32* %0
  store i1 %3, i1* %1
  ret void
}

define weak void @_ssdm_op_Write.ap_fifo.volatile.i64P(i64*, i64) {
entry:
  %empty = call i64 @_autotb_FifoWrite_i64(i64* %0, i64 %1)
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak void @_ssdm_op_SpecReset(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecPipeline(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecMemCore(...) {
entry:
  ret void
}

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecChannel(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak { i32, i1 } @_ssdm_op_Read.axis.volatile.i32P.i1P(i32*, i1*) {
entry:
  %empty = load i32* %0
  %empty_8 = load i1* %1
  %mrv_0 = insertvalue { i32, i1 } undef, i32 %empty, 0
  %mrv1 = insertvalue { i32, i1 } %mrv_0, i1 %empty_8, 1
  ret { i32, i1 } %mrv1
}

define weak i64 @_ssdm_op_Read.ap_fifo.volatile.i64P(i64*) {
entry:
  %empty = call i64 @_autotb_FifoRead_i64(i64* %0)
  ret i64 %empty
}

define weak i32 @_ssdm_op_Read.ap_auto.i32(i32) {
entry:
  ret i32 %0
}

define weak i16 @_ssdm_op_Read.ap_auto.i16(i16) {
entry:
  ret i16 %0
}

declare i32 @_ssdm_op_PartSelect.i32.i65.i32.i32(i65, i32, i32) nounwind readnone

declare i32 @_ssdm_op_PartSelect.i32.i64.i32.i32(i64, i32, i32) nounwind readnone

define weak i1 @_ssdm_op_NbReadReq.axis.i32P.i1P(i32*, i1*, i32) {
entry:
  ret i1 true
}

define weak i1 @_ssdm_op_NbReadReq.ap_fifo.i64P(i64*, i32) {
entry:
  %empty = call i1 @_autotb_FifoCanRead_i64(i64* %0)
  ret i1 %empty
}

declare i16 @_ssdm_op_HSub(...)

declare i16 @_ssdm_op_HMul(...)

declare i16 @_ssdm_op_HDiv(...)

declare i16 @_ssdm_op_HAdd(...)

declare void @_ssdm_SpecDependence(...) nounwind

declare i64 @_autotb_FifoWrite_i64(i64*, i64)

declare i64 @_autotb_FifoRead_i64(i64*)

declare i1 @_autotb_FifoCanRead_i64(i64*)

declare void @_GLOBAL__I_a() nounwind section ".text.startup"

!hls.encrypted.func = !{}
!llvm.map.gv = !{!0}

!0 = metadata !{metadata !1, [1 x i32]* @llvm_global_ctors_0}
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0, i32 31, metadata !3}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !"llvm.global_ctors.0", metadata !5, metadata !"", i32 0, i32 31}
!5 = metadata !{metadata !6}
!6 = metadata !{i32 0, i32 0, i32 1}
!7 = metadata !{metadata !8}
!8 = metadata !{i32 0, i32 31, metadata !9}
!9 = metadata !{metadata !10}
!10 = metadata !{metadata !"i_data.V.data.V", metadata !5, metadata !"int32", i32 0, i32 31}
!11 = metadata !{metadata !12}
!12 = metadata !{i32 0, i32 0, metadata !13}
!13 = metadata !{metadata !14}
!14 = metadata !{metadata !"i_data.V.last.V", metadata !5, metadata !"uint1", i32 0, i32 0}
!15 = metadata !{metadata !16}
!16 = metadata !{i32 0, i32 31, metadata !17}
!17 = metadata !{metadata !18}
!18 = metadata !{metadata !"o_data.V.data.V", metadata !5, metadata !"int32", i32 0, i32 31}
!19 = metadata !{metadata !20}
!20 = metadata !{i32 0, i32 0, metadata !21}
!21 = metadata !{metadata !22}
!22 = metadata !{metadata !"o_data.V.last.V", metadata !5, metadata !"uint1", i32 0, i32 0}
!23 = metadata !{metadata !24}
!24 = metadata !{i32 0, i32 31, metadata !25}
!25 = metadata !{metadata !26}
!26 = metadata !{metadata !"threshold.V", metadata !27, metadata !"uint32", i32 0, i32 31}
!27 = metadata !{metadata !28}
!28 = metadata !{i32 0, i32 0, i32 0}
!29 = metadata !{metadata !30}
!30 = metadata !{i32 0, i32 15, metadata !31}
!31 = metadata !{metadata !32}
!32 = metadata !{metadata !"seq_len.V", metadata !27, metadata !"uint16", i32 0, i32 15}
!33 = metadata !{metadata !34}
!34 = metadata !{i32 0, i32 31, metadata !35}
!35 = metadata !{metadata !36}
!36 = metadata !{metadata !"avg_size.V", metadata !27, metadata !"uint32", i32 0, i32 31}
