; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 4
; RUN: opt < %s -passes=reassociate -S | FileCheck %s
define i32 @nsw_preserve_nonnegative(ptr %ptr0, ptr %ptr1, ptr %ptr2) {
; CHECK-LABEL: define i32 @nsw_preserve_nonnegative(
; CHECK-SAME: ptr [[PTR0:%.*]], ptr [[PTR1:%.*]], ptr [[PTR2:%.*]]) {
; CHECK-NEXT:    [[V0:%.*]] = load i32, ptr [[PTR0]], align 4, !range [[RNG0:![0-9]+]]
; CHECK-NEXT:    [[V1:%.*]] = load i32, ptr [[PTR1]], align 4, !range [[RNG0]]
; CHECK-NEXT:    [[V2:%.*]] = load i32, ptr [[PTR2]], align 4, !range [[RNG0]]
; CHECK-NEXT:    [[ADD0:%.*]] = add nsw i32 [[V1]], [[V0]]
; CHECK-NEXT:    [[ADD1:%.*]] = add nsw i32 [[ADD0]], [[V2]]
; CHECK-NEXT:    ret i32 [[ADD1]]
;
  %v0 = load i32, ptr %ptr0, !range !1
  %v1 = load i32, ptr %ptr1, !range !1
  %v2 = load i32, ptr %ptr2, !range !1
  %add0 = add nsw i32 %v1, %v2
  %add1 = add nsw i32 %add0, %v0
  ret i32 %add1
}

define i32 @nsw_preserve_nuw_nsw(ptr %ptr0, ptr %ptr1, ptr %ptr2) {
; CHECK-LABEL: define i32 @nsw_preserve_nuw_nsw(
; CHECK-SAME: ptr [[PTR0:%.*]], ptr [[PTR1:%.*]], ptr [[PTR2:%.*]]) {
; CHECK-NEXT:    [[V0:%.*]] = load i32, ptr [[PTR0]], align 4
; CHECK-NEXT:    [[V1:%.*]] = load i32, ptr [[PTR1]], align 4
; CHECK-NEXT:    [[V2:%.*]] = load i32, ptr [[PTR2]], align 4
; CHECK-NEXT:    [[ADD0:%.*]] = add nuw nsw i32 [[V1]], [[V0]]
; CHECK-NEXT:    [[ADD1:%.*]] = add nuw nsw i32 [[ADD0]], [[V2]]
; CHECK-NEXT:    ret i32 [[ADD1]]
;
  %v0 = load i32, ptr %ptr0
  %v1 = load i32, ptr %ptr1
  %v2 = load i32, ptr %ptr2
  %add0 = add nuw nsw i32 %v1, %v2
  %add1 = add nuw nsw i32 %add0, %v0
  ret i32 %add1
}

define i32 @nsw_dont_preserve_negative(ptr %ptr0, ptr %ptr1, ptr %ptr2) {
; CHECK-LABEL: define i32 @nsw_dont_preserve_negative(
; CHECK-SAME: ptr [[PTR0:%.*]], ptr [[PTR1:%.*]], ptr [[PTR2:%.*]]) {
; CHECK-NEXT:    [[V0:%.*]] = load i32, ptr [[PTR0]], align 4
; CHECK-NEXT:    [[V1:%.*]] = load i32, ptr [[PTR1]], align 4, !range [[RNG0]]
; CHECK-NEXT:    [[V2:%.*]] = load i32, ptr [[PTR2]], align 4, !range [[RNG0]]
; CHECK-NEXT:    [[ADD0:%.*]] = add i32 [[V1]], [[V0]]
; CHECK-NEXT:    [[ADD1:%.*]] = add i32 [[ADD0]], [[V2]]
; CHECK-NEXT:    ret i32 [[ADD1]]
;
  %v0 = load i32, ptr %ptr0
  %v1 = load i32, ptr %ptr1, !range !1
  %v2 = load i32, ptr %ptr2, !range !1
  %add0 = add nsw i32 %v1, %v2
  %add1 = add nsw i32 %add0, %v0
  ret i32 %add1
}

define i32 @nsw_nopreserve_notallnsw(ptr %ptr0, ptr %ptr1, ptr %ptr2) {
; CHECK-LABEL: define i32 @nsw_nopreserve_notallnsw(
; CHECK-SAME: ptr [[PTR0:%.*]], ptr [[PTR1:%.*]], ptr [[PTR2:%.*]]) {
; CHECK-NEXT:    [[V0:%.*]] = load i32, ptr [[PTR0]], align 4, !range [[RNG0:![0-9]+]]
; CHECK-NEXT:    [[V1:%.*]] = load i32, ptr [[PTR1]], align 4, !range [[RNG0]]
; CHECK-NEXT:    [[V2:%.*]] = load i32, ptr [[PTR2]], align 4, !range [[RNG0]]
; CHECK-NEXT:    [[ADD0:%.*]] = add i32 [[V1]], [[V0]]
; CHECK-NEXT:    [[ADD1:%.*]] = add i32 [[ADD0]], [[V2]]
; CHECK-NEXT:    ret i32 [[ADD1]]
;
  %v0 = load i32, ptr %ptr0, !range !1
  %v1 = load i32, ptr %ptr1, !range !1
  %v2 = load i32, ptr %ptr2, !range !1
  %add0 = add nsw i32 %v1, %v2
  %add1 = add i32 %add0, %v0
  ret i32 %add1
}

; Positive 32 bit integers
!1 = !{i32 0, i32 2147483648}
;.
; CHECK: [[RNG0]] = !{i32 0, i32 -2147483648}
;.