; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 4
; RUN: opt -S -passes=instcombine < %s | FileCheck %s

@c = global i32 0, align 4
@b = global i32 0, align 4

define void @masked_scatter1() {
; CHECK-LABEL: define void @masked_scatter1() {
; CHECK-NEXT:    call void @llvm.masked.scatter.nxv4i32.nxv4p0(<vscale x 4 x i32> zeroinitializer, <vscale x 4 x ptr> shufflevector (<vscale x 4 x ptr> insertelement (<vscale x 4 x ptr> poison, ptr @c, i64 0), <vscale x 4 x ptr> poison, <vscale x 4 x i32> zeroinitializer), i32 4, <vscale x 4 x i1> shufflevector (<vscale x 4 x i1> insertelement (<vscale x 4 x i1> poison, i1 ptrtoint (ptr @b to i1), i64 0), <vscale x 4 x i1> poison, <vscale x 4 x i32> zeroinitializer))
; CHECK-NEXT:    ret void
;
  call void @llvm.masked.scatter.nxv4i32.nxv4p0(<vscale x 4 x i32> zeroinitializer, <vscale x 4 x ptr> splat (ptr @c), i32 4, <vscale x 4 x i1> splat (i1 ptrtoint (ptr @b to i1)))
  ret void
}

define void @masked_scatter2() {
; CHECK-LABEL: define void @masked_scatter2() {
; CHECK-NEXT:    store i32 0, ptr @c, align 4
; CHECK-NEXT:    ret void
;
  call void @llvm.masked.scatter.v2i32.v2p0(<2 x i32> zeroinitializer, <2 x ptr> splat (ptr @c), i32 4, <2 x i1> splat (i1 true))
  ret void
}

define void @masked_scatter3() {
; CHECK-LABEL: define void @masked_scatter3() {
; CHECK-NEXT:    store i32 0, ptr @c, align 4
; CHECK-NEXT:    ret void
;
  call void @llvm.masked.scatter.v2i32.v2p0(<2 x i32> zeroinitializer, <2 x ptr> splat (ptr @c), i32 4, <2 x i1> undef)
  ret void
}

define void @masked_scatter4() {
; CHECK-LABEL: define void @masked_scatter4() {
; CHECK-NEXT:    ret void
;
  call void @llvm.masked.scatter.v2i32.v2p0(<2 x i32> zeroinitializer, <2 x ptr> splat (ptr @c), i32 4, <2 x i1> splat (i1 false))
  ret void
}

define void @masked_scatter5() {
; CHECK-LABEL: define void @masked_scatter5() {
; CHECK-NEXT:    store i32 0, ptr @c, align 4
; CHECK-NEXT:    ret void
;
  call void @llvm.masked.scatter.v2i32.v2p0(<2 x i32> zeroinitializer, <2 x ptr> splat (ptr @c), i32 4, <2 x i1> <i1 true, i1 false>)
  ret void
}

define void @masked_scatter6() {
; CHECK-LABEL: define void @masked_scatter6() {
; CHECK-NEXT:    store i32 0, ptr @c, align 4
; CHECK-NEXT:    ret void
;
  call void @llvm.masked.scatter.v2i32.v2p0(<2 x i32> zeroinitializer, <2 x ptr> splat (ptr @c), i32 4, <2 x i1> <i1 undef, i1 false>)
  ret void
}

define void @masked_scatter7() {
; CHECK-LABEL: define void @masked_scatter7() {
; CHECK-NEXT:    call void @llvm.masked.scatter.v2i32.v2p0(<2 x i32> zeroinitializer, <2 x ptr> <ptr @c, ptr @c>, i32 4, <2 x i1> <i1 ptrtoint (ptr @b to i1), i1 ptrtoint (ptr @b to i1)>)
; CHECK-NEXT:    ret void
;
  call void @llvm.masked.scatter.v2i32.v2p0(<2 x i32> zeroinitializer, <2 x ptr> splat (ptr @c), i32 4, <2 x i1> splat (i1 ptrtoint (ptr @b to i1)))
  ret void
}