; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 2
; RUN: opt -passes='require<profile-summary>,function(codegenprepare)' -S -o - %s | FileCheck %s

target triple = "aarch64-unknown-linux-gnu"

define void @inc_add(i32 %first, i32 %N, ptr %in1, ptr %in2, ptr %out) #0 {
; CHECK-LABEL: define void @inc_add
; CHECK-SAME: (i32 [[FIRST:%.*]], i32 [[N:%.*]], ptr [[IN1:%.*]], ptr [[IN2:%.*]], ptr [[OUT:%.*]]) #[[ATTR0:[0-9]+]] {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[WIDE_TRIP_COUNT:%.*]] = zext i32 [[N]] to i64
; CHECK-NEXT:    br label [[VECTOR_BODY:%.*]]
; CHECK:       vector.body:
; CHECK-NEXT:    [[INDEX:%.*]] = phi i64 [ 0, [[ENTRY:%.*]] ], [ [[INDEX_NEXT:%.*]], [[VECTOR_BODY]] ]
; CHECK-NEXT:    [[TMP0:%.*]] = getelementptr inbounds float, ptr [[IN1]], i64 [[INDEX]]
; CHECK-NEXT:    [[WIDE_LOAD:%.*]] = load <vscale x 4 x float>, ptr [[TMP0]], align 4
; CHECK-NEXT:    [[TMP1:%.*]] = getelementptr inbounds float, ptr [[IN2]], i64 [[INDEX]]
; CHECK-NEXT:    [[WIDE_LOAD16:%.*]] = load <vscale x 4 x float>, ptr [[TMP1]], align 4
; CHECK-NEXT:    [[TMP2:%.*]] = fmul <vscale x 4 x float> [[WIDE_LOAD]], [[WIDE_LOAD16]]
; CHECK-NEXT:    [[TMP3:%.*]] = getelementptr inbounds float, ptr [[OUT]], i64 [[INDEX]]
; CHECK-NEXT:    store <vscale x 4 x float> [[TMP2]], ptr [[TMP3]], align 4
; CHECK-NEXT:    [[TMP4:%.*]] = tail call i64 @llvm.vscale.i64()
; CHECK-NEXT:    [[TMP5:%.*]] = shl nuw nsw i64 [[TMP4]], 2
; CHECK-NEXT:    [[INDEX_NEXT]] = add nuw i64 [[INDEX]], [[TMP5]]
; CHECK-NEXT:    [[TMP6:%.*]] = icmp eq i64 [[INDEX_NEXT]], [[WIDE_TRIP_COUNT]]
; CHECK-NEXT:    br i1 [[TMP6]], label [[FOR_COND_CLEANUP:%.*]], label [[VECTOR_BODY]]
; CHECK:       for.cond.cleanup:
; CHECK-NEXT:    ret void
;
entry:
  %wide.trip.count = zext i32 %N to i64
  %0 = tail call i64 @llvm.vscale.i64()
  %1 = shl nuw nsw i64 %0, 2
  br label %vector.body

vector.body:
  %index = phi i64 [ 0, %entry ], [ %index.next, %vector.body ]
  %2 = getelementptr inbounds float, ptr %in1, i64 %index
  %wide.load = load <vscale x 4 x float>, ptr %2, align 4
  %3 = getelementptr inbounds float, ptr %in2, i64 %index
  %wide.load16 = load <vscale x 4 x float>, ptr %3, align 4
  %4 = fmul <vscale x 4 x float> %wide.load, %wide.load16
  %5 = getelementptr inbounds float, ptr %out, i64 %index
  store <vscale x 4 x float> %4, ptr %5, align 4
  %index.next = add nuw i64 %index, %1
  %6 = icmp eq i64 %index.next, %wide.trip.count
  br i1 %6, label %for.cond.cleanup, label %vector.body

for.cond.cleanup:
  ret void
}

define void @dec_sub(i32 %first, i32 %N, ptr %in1, ptr %in2, ptr %out) #0 {
; CHECK-LABEL: define void @dec_sub
; CHECK-SAME: (i32 [[FIRST:%.*]], i32 [[N:%.*]], ptr [[IN1:%.*]], ptr [[IN2:%.*]], ptr [[OUT:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = zext i32 [[N]] to i64
; CHECK-NEXT:    [[TMP1:%.*]] = tail call i64 @llvm.vscale.i64()
; CHECK-NEXT:    [[TMP2:%.*]] = shl nuw nsw i64 [[TMP1]], 2
; CHECK-NEXT:    [[TMP3:%.*]] = sub nsw i64 1, [[TMP2]]
; CHECK-NEXT:    [[INVARIANT_GEP:%.*]] = getelementptr float, ptr [[IN1]], i64 [[TMP3]]
; CHECK-NEXT:    [[INVARIANT_GEP20:%.*]] = getelementptr float, ptr [[IN2]], i64 [[TMP3]]
; CHECK-NEXT:    [[INVARIANT_GEP22:%.*]] = getelementptr float, ptr [[OUT]], i64 [[TMP3]]
; CHECK-NEXT:    br label [[VECTOR_BODY:%.*]]
; CHECK:       vector.body:
; CHECK-NEXT:    [[INDEX:%.*]] = phi i64 [ 0, [[ENTRY:%.*]] ], [ [[INDEX_NEXT:%.*]], [[VECTOR_BODY]] ]
; CHECK-NEXT:    [[OFFSET_IDX:%.*]] = sub i64 [[TMP0]], [[INDEX]]
; CHECK-NEXT:    [[GEP:%.*]] = getelementptr float, ptr [[INVARIANT_GEP]], i64 [[OFFSET_IDX]]
; CHECK-NEXT:    [[WIDE_LOAD:%.*]] = load <vscale x 4 x float>, ptr [[GEP]], align 4
; CHECK-NEXT:    [[GEP21:%.*]] = getelementptr float, ptr [[INVARIANT_GEP20]], i64 [[OFFSET_IDX]]
; CHECK-NEXT:    [[WIDE_LOAD16:%.*]] = load <vscale x 4 x float>, ptr [[GEP21]], align 4
; CHECK-NEXT:    [[TMP4:%.*]] = fmul <vscale x 4 x float> [[WIDE_LOAD]], [[WIDE_LOAD16]]
; CHECK-NEXT:    [[GEP23:%.*]] = getelementptr float, ptr [[INVARIANT_GEP22]], i64 [[OFFSET_IDX]]
; CHECK-NEXT:    store <vscale x 4 x float> [[TMP4]], ptr [[GEP23]], align 4
; CHECK-NEXT:    [[TMP5:%.*]] = tail call i64 @llvm.vscale.i64()
; CHECK-NEXT:    [[TMP6:%.*]] = shl nuw nsw i64 [[TMP5]], 2
; CHECK-NEXT:    [[INDEX_NEXT]] = add nuw i64 [[INDEX]], [[TMP6]]
; CHECK-NEXT:    [[TMP7:%.*]] = icmp eq i64 [[INDEX_NEXT]], [[TMP0]]
; CHECK-NEXT:    br i1 [[TMP7]], label [[FOR_COND_CLEANUP:%.*]], label [[VECTOR_BODY]]
; CHECK:       for.cond.cleanup:
; CHECK-NEXT:    ret void
;
entry:
  %0 = zext i32 %N to i64
  %1 = tail call i64 @llvm.vscale.i64()
  %2 = shl nuw nsw i64 %1, 2
  %3 = sub nsw i64 1, %2
  %invariant.gep = getelementptr float, ptr %in1, i64 %3
  %invariant.gep20 = getelementptr float, ptr %in2, i64 %3
  %invariant.gep22 = getelementptr float, ptr %out, i64 %3
  br label %vector.body

vector.body:
  %index = phi i64 [ 0, %entry ], [ %index.next, %vector.body ]
  %offset.idx = sub i64 %0, %index
  %gep = getelementptr float, ptr %invariant.gep, i64 %offset.idx
  %wide.load = load <vscale x 4 x float>, ptr %gep, align 4
  %gep21 = getelementptr float, ptr %invariant.gep20, i64 %offset.idx
  %wide.load16 = load <vscale x 4 x float>, ptr %gep21, align 4
  %4 = fmul <vscale x 4 x float> %wide.load, %wide.load16
  %gep23 = getelementptr float, ptr %invariant.gep22, i64 %offset.idx
  store <vscale x 4 x float> %4, ptr %gep23, align 4
  %index.next = add nuw i64 %index, %2
  %5 = icmp eq i64 %index.next, %0
  br i1 %5, label %for.cond.cleanup, label %vector.body

for.cond.cleanup:
  ret void
}

define void @gep(i32 noundef %first, i32 noundef %N, ptr nocapture noundef writeonly %ptr, <vscale x 16 x i1> %pg, <vscale x 16 x i8> %val) #0 {
; CHECK-LABEL: define void @gep
; CHECK-SAME: (i32 noundef [[FIRST:%.*]], i32 noundef [[N:%.*]], ptr nocapture noundef writeonly [[PTR:%.*]], <vscale x 16 x i1> [[PG:%.*]], <vscale x 16 x i8> [[VAL:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br label [[FOR_BODY:%.*]]
; CHECK:       for.body:
; CHECK-NEXT:    [[LSR_IV:%.*]] = phi i32 [ [[N]], [[ENTRY:%.*]] ], [ [[LSR_IV_NEXT:%.*]], [[FOR_BODY]] ]
; CHECK-NEXT:    [[PTR_ADDR:%.*]] = phi ptr [ [[PTR]], [[ENTRY]] ], [ [[ADD_PTR_3:%.*]], [[FOR_BODY]] ]
; CHECK-NEXT:    tail call void @llvm.masked.store.nxv16i8.p0(<vscale x 16 x i8> [[VAL]], ptr [[PTR_ADDR]], i32 1, <vscale x 16 x i1> [[PG]])
; CHECK-NEXT:    [[TMP0:%.*]] = tail call i64 @llvm.vscale.i64()
; CHECK-NEXT:    [[TMP1:%.*]] = shl i64 [[TMP0]], 4
; CHECK-NEXT:    [[ADD_PTR:%.*]] = getelementptr inbounds i8, ptr [[PTR_ADDR]], i64 [[TMP1]]
; CHECK-NEXT:    tail call void @llvm.masked.store.nxv16i8.p0(<vscale x 16 x i8> [[VAL]], ptr [[ADD_PTR]], i32 1, <vscale x 16 x i1> [[PG]])
; CHECK-NEXT:    [[TMP2:%.*]] = tail call i64 @llvm.vscale.i64()
; CHECK-NEXT:    [[TMP3:%.*]] = shl i64 [[TMP2]], 4
; CHECK-NEXT:    [[ADD_PTR_1:%.*]] = getelementptr inbounds i8, ptr [[ADD_PTR]], i64 [[TMP3]]
; CHECK-NEXT:    tail call void @llvm.masked.store.nxv16i8.p0(<vscale x 16 x i8> [[VAL]], ptr [[ADD_PTR_1]], i32 1, <vscale x 16 x i1> [[PG]])
; CHECK-NEXT:    [[TMP4:%.*]] = tail call i64 @llvm.vscale.i64()
; CHECK-NEXT:    [[TMP5:%.*]] = shl i64 [[TMP4]], 4
; CHECK-NEXT:    [[ADD_PTR_2:%.*]] = getelementptr inbounds i8, ptr [[ADD_PTR_1]], i64 [[TMP5]]
; CHECK-NEXT:    tail call void @llvm.masked.store.nxv16i8.p0(<vscale x 16 x i8> [[VAL]], ptr [[ADD_PTR_2]], i32 1, <vscale x 16 x i1> [[PG]])
; CHECK-NEXT:    [[TMP6:%.*]] = tail call i64 @llvm.vscale.i64()
; CHECK-NEXT:    [[TMP7:%.*]] = shl i64 [[TMP6]], 4
; CHECK-NEXT:    [[ADD_PTR_3]] = getelementptr inbounds i8, ptr [[ADD_PTR_2]], i64 [[TMP7]]
; CHECK-NEXT:    [[LSR_IV_NEXT]] = add i32 [[LSR_IV]], -4
; CHECK-NEXT:    [[CMP:%.*]] = icmp eq i32 [[LSR_IV_NEXT]], 0
; CHECK-NEXT:    br i1 [[CMP]], label [[FOR_EXIT:%.*]], label [[FOR_BODY]]
; CHECK:       for.exit:
; CHECK-NEXT:    ret void
;
entry:
  %0 = tail call i64 @llvm.vscale.i64()
  %1 = shl i64 %0, 4
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph.new
  %lsr.iv = phi i32 [ %N, %entry ], [ %lsr.iv.next, %for.body ]
  %ptr.addr = phi ptr [ %ptr, %entry ], [ %add.ptr.3, %for.body ]
  tail call void @llvm.masked.store.nxv16i8.p0(<vscale x 16 x i8> %val, ptr %ptr.addr, i32 1, <vscale x 16 x i1> %pg)
  %add.ptr = getelementptr inbounds i8, ptr %ptr.addr, i64 %1
  tail call void @llvm.masked.store.nxv16i8.p0(<vscale x 16 x i8> %val, ptr %add.ptr, i32 1, <vscale x 16 x i1> %pg)
  %add.ptr.1 = getelementptr inbounds i8, ptr %add.ptr, i64 %1
  tail call void @llvm.masked.store.nxv16i8.p0(<vscale x 16 x i8> %val, ptr %add.ptr.1, i32 1, <vscale x 16 x i1> %pg)
  %add.ptr.2 = getelementptr inbounds i8, ptr %add.ptr.1, i64 %1
  tail call void @llvm.masked.store.nxv16i8.p0(<vscale x 16 x i8> %val, ptr %add.ptr.2, i32 1, <vscale x 16 x i1> %pg)
  %add.ptr.3 = getelementptr inbounds i8, ptr %add.ptr.2, i64 %1
  %lsr.iv.next = add i32 %lsr.iv, -4
  %cmp = icmp eq i32 %lsr.iv.next, 0
  br i1 %cmp, label %for.exit, label %for.body

for.exit:
  ret void
}

define void @inc_add_i32(i32 %first, i32 %N, ptr %in1, ptr %in2, ptr %out) #0 {
; CHECK-LABEL: define void @inc_add_i32
; CHECK-SAME: (i32 [[FIRST:%.*]], i32 [[N:%.*]], ptr [[IN1:%.*]], ptr [[IN2:%.*]], ptr [[OUT:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[WIDE_TRIP_COUNT:%.*]] = zext i32 [[N]] to i64
; CHECK-NEXT:    br label [[VECTOR_BODY:%.*]]
; CHECK:       vector.body:
; CHECK-NEXT:    [[INDEX:%.*]] = phi i64 [ 0, [[ENTRY:%.*]] ], [ [[INDEX_NEXT:%.*]], [[VECTOR_BODY]] ]
; CHECK-NEXT:    [[TMP0:%.*]] = getelementptr inbounds float, ptr [[IN1]], i64 [[INDEX]]
; CHECK-NEXT:    [[WIDE_LOAD:%.*]] = load <vscale x 4 x float>, ptr [[TMP0]], align 4
; CHECK-NEXT:    [[TMP1:%.*]] = getelementptr inbounds float, ptr [[IN2]], i64 [[INDEX]]
; CHECK-NEXT:    [[WIDE_LOAD16:%.*]] = load <vscale x 4 x float>, ptr [[TMP1]], align 4
; CHECK-NEXT:    [[TMP2:%.*]] = fmul <vscale x 4 x float> [[WIDE_LOAD]], [[WIDE_LOAD16]]
; CHECK-NEXT:    [[TMP3:%.*]] = getelementptr inbounds float, ptr [[OUT]], i64 [[INDEX]]
; CHECK-NEXT:    store <vscale x 4 x float> [[TMP2]], ptr [[TMP3]], align 4
; CHECK-NEXT:    [[TMP4:%.*]] = tail call i32 @llvm.vscale.i32()
; CHECK-NEXT:    [[TMP5:%.*]] = zext i32 [[TMP4]] to i64
; CHECK-NEXT:    [[TMP6:%.*]] = shl nuw nsw i64 [[TMP5]], 2
; CHECK-NEXT:    [[INDEX_NEXT]] = add nuw i64 [[INDEX]], [[TMP6]]
; CHECK-NEXT:    [[TMP7:%.*]] = icmp eq i64 [[INDEX_NEXT]], [[WIDE_TRIP_COUNT]]
; CHECK-NEXT:    br i1 [[TMP7]], label [[FOR_COND_CLEANUP:%.*]], label [[VECTOR_BODY]]
; CHECK:       for.cond.cleanup:
; CHECK-NEXT:    ret void
;
entry:
  %wide.trip.count = zext i32 %N to i64
  %0 = tail call i32 @llvm.vscale.i32()
  %1 = zext i32 %0 to i64
  %2 = shl nuw nsw i64 %1, 2
  br label %vector.body

vector.body:
  %index = phi i64 [ 0, %entry ], [ %index.next, %vector.body ]
  %3 = getelementptr inbounds float, ptr %in1, i64 %index
  %wide.load = load <vscale x 4 x float>, ptr %3, align 4
  %4 = getelementptr inbounds float, ptr %in2, i64 %index
  %wide.load16 = load <vscale x 4 x float>, ptr %4, align 4
  %5 = fmul <vscale x 4 x float> %wide.load, %wide.load16
  %6 = getelementptr inbounds float, ptr %out, i64 %index
  store <vscale x 4 x float> %5, ptr %6, align 4
  %index.next = add nuw i64 %index, %2
  %7 = icmp eq i64 %index.next, %wide.trip.count
  br i1 %7, label %for.cond.cleanup, label %vector.body

for.cond.cleanup:
  ret void
}

define void @dec_sub_i32(i32 %first, i32 %N, ptr %in1, ptr %in2, ptr %out) #0 {
; CHECK-LABEL: define void @dec_sub_i32
; CHECK-SAME: (i32 [[FIRST:%.*]], i32 [[N:%.*]], ptr [[IN1:%.*]], ptr [[IN2:%.*]], ptr [[OUT:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = zext i32 [[N]] to i64
; CHECK-NEXT:    [[TMP1:%.*]] = tail call i32 @llvm.vscale.i32()
; CHECK-NEXT:    [[TMP2:%.*]] = zext i32 [[TMP1]] to i64
; CHECK-NEXT:    [[TMP3:%.*]] = shl nuw nsw i64 [[TMP2]], 2
; CHECK-NEXT:    [[TMP4:%.*]] = sub nsw i64 1, [[TMP3]]
; CHECK-NEXT:    [[INVARIANT_GEP:%.*]] = getelementptr float, ptr [[IN1]], i64 [[TMP4]]
; CHECK-NEXT:    [[INVARIANT_GEP20:%.*]] = getelementptr float, ptr [[IN2]], i64 [[TMP4]]
; CHECK-NEXT:    [[INVARIANT_GEP22:%.*]] = getelementptr float, ptr [[OUT]], i64 [[TMP4]]
; CHECK-NEXT:    br label [[VECTOR_BODY:%.*]]
; CHECK:       vector.body:
; CHECK-NEXT:    [[INDEX:%.*]] = phi i64 [ 0, [[ENTRY:%.*]] ], [ [[INDEX_NEXT:%.*]], [[VECTOR_BODY]] ]
; CHECK-NEXT:    [[OFFSET_IDX:%.*]] = sub i64 [[TMP0]], [[INDEX]]
; CHECK-NEXT:    [[GEP:%.*]] = getelementptr float, ptr [[INVARIANT_GEP]], i64 [[OFFSET_IDX]]
; CHECK-NEXT:    [[WIDE_LOAD:%.*]] = load <vscale x 4 x float>, ptr [[GEP]], align 4
; CHECK-NEXT:    [[GEP21:%.*]] = getelementptr float, ptr [[INVARIANT_GEP20]], i64 [[OFFSET_IDX]]
; CHECK-NEXT:    [[WIDE_LOAD16:%.*]] = load <vscale x 4 x float>, ptr [[GEP21]], align 4
; CHECK-NEXT:    [[TMP5:%.*]] = fmul <vscale x 4 x float> [[WIDE_LOAD]], [[WIDE_LOAD16]]
; CHECK-NEXT:    [[GEP23:%.*]] = getelementptr float, ptr [[INVARIANT_GEP22]], i64 [[OFFSET_IDX]]
; CHECK-NEXT:    store <vscale x 4 x float> [[TMP5]], ptr [[GEP23]], align 4
; CHECK-NEXT:    [[TMP6:%.*]] = tail call i32 @llvm.vscale.i32()
; CHECK-NEXT:    [[TMP7:%.*]] = zext i32 [[TMP6]] to i64
; CHECK-NEXT:    [[TMP8:%.*]] = shl nuw nsw i64 [[TMP7]], 2
; CHECK-NEXT:    [[INDEX_NEXT]] = add nuw i64 [[INDEX]], [[TMP8]]
; CHECK-NEXT:    [[TMP9:%.*]] = icmp eq i64 [[INDEX_NEXT]], [[TMP0]]
; CHECK-NEXT:    br i1 [[TMP9]], label [[FOR_COND_CLEANUP:%.*]], label [[VECTOR_BODY]]
; CHECK:       for.cond.cleanup:
; CHECK-NEXT:    ret void
;
entry:
  %0 = zext i32 %N to i64
  %1 = tail call i32 @llvm.vscale.i32()
  %2 = zext i32 %1 to i64
  %3 = shl nuw nsw i64 %2, 2
  %4 = sub nsw i64 1, %3
  %invariant.gep = getelementptr float, ptr %in1, i64 %4
  %invariant.gep20 = getelementptr float, ptr %in2, i64 %4
  %invariant.gep22 = getelementptr float, ptr %out, i64 %4
  br label %vector.body

vector.body:
  %index = phi i64 [ 0, %entry ], [ %index.next, %vector.body ]
  %offset.idx = sub i64 %0, %index
  %gep = getelementptr float, ptr %invariant.gep, i64 %offset.idx
  %wide.load = load <vscale x 4 x float>, ptr %gep, align 4
  %gep21 = getelementptr float, ptr %invariant.gep20, i64 %offset.idx
  %wide.load16 = load <vscale x 4 x float>, ptr %gep21, align 4
  %5 = fmul <vscale x 4 x float> %wide.load, %wide.load16
  %gep23 = getelementptr float, ptr %invariant.gep22, i64 %offset.idx
  store <vscale x 4 x float> %5, ptr %gep23, align 4
  %index.next = add nuw i64 %index, %3
  %6 = icmp eq i64 %index.next, %0
  br i1 %6, label %for.cond.cleanup, label %vector.body

for.cond.cleanup:
  ret void
}

define void @gep_i32(i32 noundef %first, i32 noundef %N, ptr nocapture noundef writeonly %ptr, <vscale x 16 x i1> %pg, <vscale x 16 x i8> %val) #0 {
; CHECK-LABEL: define void @gep_i32
; CHECK-SAME: (i32 noundef [[FIRST:%.*]], i32 noundef [[N:%.*]], ptr nocapture noundef writeonly [[PTR:%.*]], <vscale x 16 x i1> [[PG:%.*]], <vscale x 16 x i8> [[VAL:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br label [[FOR_BODY:%.*]]
; CHECK:       for.body:
; CHECK-NEXT:    [[LSR_IV:%.*]] = phi i32 [ [[N]], [[ENTRY:%.*]] ], [ [[LSR_IV_NEXT:%.*]], [[FOR_BODY]] ]
; CHECK-NEXT:    [[PTR_ADDR:%.*]] = phi ptr [ [[PTR]], [[ENTRY]] ], [ [[ADD_PTR_3:%.*]], [[FOR_BODY]] ]
; CHECK-NEXT:    tail call void @llvm.masked.store.nxv16i8.p0(<vscale x 16 x i8> [[VAL]], ptr [[PTR_ADDR]], i32 1, <vscale x 16 x i1> [[PG]])
; CHECK-NEXT:    [[TMP0:%.*]] = tail call i32 @llvm.vscale.i32()
; CHECK-NEXT:    [[TMP1:%.*]] = zext i32 [[TMP0]] to i64
; CHECK-NEXT:    [[TMP2:%.*]] = shl i64 [[TMP1]], 4
; CHECK-NEXT:    [[ADD_PTR:%.*]] = getelementptr inbounds i8, ptr [[PTR_ADDR]], i64 [[TMP2]]
; CHECK-NEXT:    tail call void @llvm.masked.store.nxv16i8.p0(<vscale x 16 x i8> [[VAL]], ptr [[ADD_PTR]], i32 1, <vscale x 16 x i1> [[PG]])
; CHECK-NEXT:    [[TMP3:%.*]] = tail call i32 @llvm.vscale.i32()
; CHECK-NEXT:    [[TMP4:%.*]] = zext i32 [[TMP3]] to i64
; CHECK-NEXT:    [[TMP5:%.*]] = shl i64 [[TMP4]], 4
; CHECK-NEXT:    [[ADD_PTR_1:%.*]] = getelementptr inbounds i8, ptr [[ADD_PTR]], i64 [[TMP5]]
; CHECK-NEXT:    tail call void @llvm.masked.store.nxv16i8.p0(<vscale x 16 x i8> [[VAL]], ptr [[ADD_PTR_1]], i32 1, <vscale x 16 x i1> [[PG]])
; CHECK-NEXT:    [[TMP6:%.*]] = tail call i32 @llvm.vscale.i32()
; CHECK-NEXT:    [[TMP7:%.*]] = zext i32 [[TMP6]] to i64
; CHECK-NEXT:    [[TMP8:%.*]] = shl i64 [[TMP7]], 4
; CHECK-NEXT:    [[ADD_PTR_2:%.*]] = getelementptr inbounds i8, ptr [[ADD_PTR_1]], i64 [[TMP8]]
; CHECK-NEXT:    tail call void @llvm.masked.store.nxv16i8.p0(<vscale x 16 x i8> [[VAL]], ptr [[ADD_PTR_2]], i32 1, <vscale x 16 x i1> [[PG]])
; CHECK-NEXT:    [[TMP9:%.*]] = tail call i32 @llvm.vscale.i32()
; CHECK-NEXT:    [[TMP10:%.*]] = zext i32 [[TMP9]] to i64
; CHECK-NEXT:    [[TMP11:%.*]] = shl i64 [[TMP10]], 4
; CHECK-NEXT:    [[ADD_PTR_3]] = getelementptr inbounds i8, ptr [[ADD_PTR_2]], i64 [[TMP11]]
; CHECK-NEXT:    [[LSR_IV_NEXT]] = add i32 [[LSR_IV]], -4
; CHECK-NEXT:    [[CMP:%.*]] = icmp eq i32 [[LSR_IV_NEXT]], 0
; CHECK-NEXT:    br i1 [[CMP]], label [[FOR_EXIT:%.*]], label [[FOR_BODY]]
; CHECK:       for.exit:
; CHECK-NEXT:    ret void
;
entry:
  %0 = tail call i32 @llvm.vscale.i32()
  %1 = zext i32 %0 to i64
  %2 = shl i64 %1, 4
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph.new
  %lsr.iv = phi i32 [ %N, %entry ], [ %lsr.iv.next, %for.body ]
  %ptr.addr = phi ptr [ %ptr, %entry ], [ %add.ptr.3, %for.body ]
  tail call void @llvm.masked.store.nxv16i8.p0(<vscale x 16 x i8> %val, ptr %ptr.addr, i32 1, <vscale x 16 x i1> %pg)
  %add.ptr = getelementptr inbounds i8, ptr %ptr.addr, i64 %2
  tail call void @llvm.masked.store.nxv16i8.p0(<vscale x 16 x i8> %val, ptr %add.ptr, i32 1, <vscale x 16 x i1> %pg)
  %add.ptr.1 = getelementptr inbounds i8, ptr %add.ptr, i64 %2
  tail call void @llvm.masked.store.nxv16i8.p0(<vscale x 16 x i8> %val, ptr %add.ptr.1, i32 1, <vscale x 16 x i1> %pg)
  %add.ptr.2 = getelementptr inbounds i8, ptr %add.ptr.1, i64 %2
  tail call void @llvm.masked.store.nxv16i8.p0(<vscale x 16 x i8> %val, ptr %add.ptr.2, i32 1, <vscale x 16 x i1> %pg)
  %add.ptr.3 = getelementptr inbounds i8, ptr %add.ptr.2, i64 %2
  %lsr.iv.next = add i32 %lsr.iv, -4
  %cmp = icmp eq i32 %lsr.iv.next, 0
  br i1 %cmp, label %for.exit, label %for.body

for.exit:
  ret void
}

declare void @llvm.masked.store.nxv16i8.p0(<vscale x 16 x i8>, ptr nocapture, i32 immarg, <vscale x 16 x i1>)

declare i64 @llvm.vscale.i64()

attributes #0 = { "target-features"="+sve2" }