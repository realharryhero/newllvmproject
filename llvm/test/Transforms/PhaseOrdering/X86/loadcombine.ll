; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -O3 -S -mtriple=x86_64-- -mattr=+avx2 < %s | FileCheck %s

define i32 @loadCombine_4consecutive_1234(ptr %p) {
; CHECK-LABEL: @loadCombine_4consecutive_1234(
; CHECK-NEXT:    [[L1:%.*]] = load i32, ptr [[P:%.*]], align 1
; CHECK-NEXT:    ret i32 [[L1]]
;
  %p1 = getelementptr i8, ptr %p, i32 1
  %p2 = getelementptr i8, ptr %p, i32 2
  %p3 = getelementptr i8, ptr %p, i32 3
  %l1 = load i8, ptr %p
  %l2 = load i8, ptr %p1
  %l3 = load i8, ptr %p2
  %l4 = load i8, ptr %p3

  %e1 = zext i8 %l1 to i32
  %e2 = zext i8 %l2 to i32
  %e3 = zext i8 %l3 to i32
  %e4 = zext i8 %l4 to i32

  %s2 = shl i32 %e2, 8
  %s3 = shl i32 %e3, 16
  %s4 = shl i32 %e4, 24

  %o1 = or i32 %e1, %s2
  %o2 = or i32 %o1, %s3
  %o3 = or i32 %o2, %s4
  ret i32 %o3
}

define i32 @loadCombine_4consecutive_1243(ptr %p) {
; CHECK-LABEL: @loadCombine_4consecutive_1243(
; CHECK-NEXT:    [[P2:%.*]] = getelementptr i8, ptr [[P:%.*]], i64 2
; CHECK-NEXT:    [[P3:%.*]] = getelementptr i8, ptr [[P]], i64 3
; CHECK-NEXT:    [[L1:%.*]] = load i16, ptr [[P]], align 1
; CHECK-NEXT:    [[TMP1:%.*]] = zext i16 [[L1]] to i32
; CHECK-NEXT:    [[L3:%.*]] = load i8, ptr [[P2]], align 1
; CHECK-NEXT:    [[L4:%.*]] = load i8, ptr [[P3]], align 1
; CHECK-NEXT:    [[E3:%.*]] = zext i8 [[L3]] to i32
; CHECK-NEXT:    [[E4:%.*]] = zext i8 [[L4]] to i32
; CHECK-NEXT:    [[S3:%.*]] = shl nuw nsw i32 [[E3]], 16
; CHECK-NEXT:    [[S4:%.*]] = shl nuw i32 [[E4]], 24
; CHECK-NEXT:    [[O2:%.*]] = or disjoint i32 [[S3]], [[TMP1]]
; CHECK-NEXT:    [[O3:%.*]] = or disjoint i32 [[O2]], [[S4]]
; CHECK-NEXT:    ret i32 [[O3]]
;
  %p1 = getelementptr i8, ptr %p, i32 1
  %p2 = getelementptr i8, ptr %p, i32 2
  %p3 = getelementptr i8, ptr %p, i32 3
  %l1 = load i8, ptr %p
  %l2 = load i8, ptr %p1
  %l3 = load i8, ptr %p2
  %l4 = load i8, ptr %p3

  %e1 = zext i8 %l1 to i32
  %e2 = zext i8 %l2 to i32
  %e3 = zext i8 %l3 to i32
  %e4 = zext i8 %l4 to i32

  %s2 = shl i32 %e2, 8
  %s3 = shl i32 %e3, 16
  %s4 = shl i32 %e4, 24

  %o1 = or i32 %e1, %s2
  %o2 = or i32 %o1, %s4
  %o3 = or i32 %o2, %s3
  ret i32 %o3
}

define i32 @loadCombine_4consecutive_1324(ptr %p) {
; CHECK-LABEL: @loadCombine_4consecutive_1324(
; CHECK-NEXT:    [[P1:%.*]] = getelementptr i8, ptr [[P:%.*]], i64 1
; CHECK-NEXT:    [[P2:%.*]] = getelementptr i8, ptr [[P]], i64 2
; CHECK-NEXT:    [[P3:%.*]] = getelementptr i8, ptr [[P]], i64 3
; CHECK-NEXT:    [[L1:%.*]] = load i8, ptr [[P]], align 1
; CHECK-NEXT:    [[L2:%.*]] = load i8, ptr [[P1]], align 1
; CHECK-NEXT:    [[L3:%.*]] = load i8, ptr [[P2]], align 1
; CHECK-NEXT:    [[L4:%.*]] = load i8, ptr [[P3]], align 1
; CHECK-NEXT:    [[E1:%.*]] = zext i8 [[L1]] to i32
; CHECK-NEXT:    [[E2:%.*]] = zext i8 [[L2]] to i32
; CHECK-NEXT:    [[E3:%.*]] = zext i8 [[L3]] to i32
; CHECK-NEXT:    [[E4:%.*]] = zext i8 [[L4]] to i32
; CHECK-NEXT:    [[S2:%.*]] = shl nuw nsw i32 [[E2]], 8
; CHECK-NEXT:    [[S3:%.*]] = shl nuw nsw i32 [[E3]], 16
; CHECK-NEXT:    [[S4:%.*]] = shl nuw i32 [[E4]], 24
; CHECK-NEXT:    [[O1:%.*]] = or disjoint i32 [[S2]], [[E1]]
; CHECK-NEXT:    [[O2:%.*]] = or disjoint i32 [[O1]], [[S3]]
; CHECK-NEXT:    [[O3:%.*]] = or disjoint i32 [[O2]], [[S4]]
; CHECK-NEXT:    ret i32 [[O3]]
;
  %p1 = getelementptr i8, ptr %p, i32 1
  %p2 = getelementptr i8, ptr %p, i32 2
  %p3 = getelementptr i8, ptr %p, i32 3
  %l1 = load i8, ptr %p
  %l2 = load i8, ptr %p1
  %l3 = load i8, ptr %p2
  %l4 = load i8, ptr %p3

  %e1 = zext i8 %l1 to i32
  %e2 = zext i8 %l2 to i32
  %e3 = zext i8 %l3 to i32
  %e4 = zext i8 %l4 to i32

  %s2 = shl i32 %e2, 8
  %s3 = shl i32 %e3, 16
  %s4 = shl i32 %e4, 24

  %o1 = or i32 %e1, %s3
  %o2 = or i32 %o1, %s2
  %o3 = or i32 %o2, %s4
  ret i32 %o3
}

define i32 @loadCombine_4consecutive_1342(ptr %p) {
; CHECK-LABEL: @loadCombine_4consecutive_1342(
; CHECK-NEXT:    [[P1:%.*]] = getelementptr i8, ptr [[P:%.*]], i64 1
; CHECK-NEXT:    [[P2:%.*]] = getelementptr i8, ptr [[P]], i64 2
; CHECK-NEXT:    [[P3:%.*]] = getelementptr i8, ptr [[P]], i64 3
; CHECK-NEXT:    [[L1:%.*]] = load i8, ptr [[P]], align 1
; CHECK-NEXT:    [[L2:%.*]] = load i8, ptr [[P1]], align 1
; CHECK-NEXT:    [[L3:%.*]] = load i8, ptr [[P2]], align 1
; CHECK-NEXT:    [[L4:%.*]] = load i8, ptr [[P3]], align 1
; CHECK-NEXT:    [[E1:%.*]] = zext i8 [[L1]] to i32
; CHECK-NEXT:    [[E2:%.*]] = zext i8 [[L2]] to i32
; CHECK-NEXT:    [[E3:%.*]] = zext i8 [[L3]] to i32
; CHECK-NEXT:    [[E4:%.*]] = zext i8 [[L4]] to i32
; CHECK-NEXT:    [[S2:%.*]] = shl nuw nsw i32 [[E2]], 8
; CHECK-NEXT:    [[S3:%.*]] = shl nuw nsw i32 [[E3]], 16
; CHECK-NEXT:    [[S4:%.*]] = shl nuw i32 [[E4]], 24
; CHECK-NEXT:    [[O1:%.*]] = or disjoint i32 [[S2]], [[E1]]
; CHECK-NEXT:    [[O2:%.*]] = or disjoint i32 [[O1]], [[S3]]
; CHECK-NEXT:    [[O3:%.*]] = or disjoint i32 [[O2]], [[S4]]
; CHECK-NEXT:    ret i32 [[O3]]
;
  %p1 = getelementptr i8, ptr %p, i32 1
  %p2 = getelementptr i8, ptr %p, i32 2
  %p3 = getelementptr i8, ptr %p, i32 3
  %l1 = load i8, ptr %p
  %l2 = load i8, ptr %p1
  %l3 = load i8, ptr %p2
  %l4 = load i8, ptr %p3

  %e1 = zext i8 %l1 to i32
  %e2 = zext i8 %l2 to i32
  %e3 = zext i8 %l3 to i32
  %e4 = zext i8 %l4 to i32

  %s2 = shl i32 %e2, 8
  %s3 = shl i32 %e3, 16
  %s4 = shl i32 %e4, 24

  %o1 = or i32 %e1, %s3
  %o2 = or i32 %o1, %s4
  %o3 = or i32 %o2, %s2
  ret i32 %o3
}

define i32 @loadCombine_4consecutive_1423(ptr %p) {
; CHECK-LABEL: @loadCombine_4consecutive_1423(
; CHECK-NEXT:    [[P1:%.*]] = getelementptr i8, ptr [[P:%.*]], i64 1
; CHECK-NEXT:    [[P2:%.*]] = getelementptr i8, ptr [[P]], i64 2
; CHECK-NEXT:    [[P3:%.*]] = getelementptr i8, ptr [[P]], i64 3
; CHECK-NEXT:    [[L1:%.*]] = load i8, ptr [[P]], align 1
; CHECK-NEXT:    [[L2:%.*]] = load i8, ptr [[P1]], align 1
; CHECK-NEXT:    [[L3:%.*]] = load i8, ptr [[P2]], align 1
; CHECK-NEXT:    [[L4:%.*]] = load i8, ptr [[P3]], align 1
; CHECK-NEXT:    [[E1:%.*]] = zext i8 [[L1]] to i32
; CHECK-NEXT:    [[E2:%.*]] = zext i8 [[L2]] to i32
; CHECK-NEXT:    [[E3:%.*]] = zext i8 [[L3]] to i32
; CHECK-NEXT:    [[E4:%.*]] = zext i8 [[L4]] to i32
; CHECK-NEXT:    [[S2:%.*]] = shl nuw nsw i32 [[E2]], 8
; CHECK-NEXT:    [[S3:%.*]] = shl nuw nsw i32 [[E3]], 16
; CHECK-NEXT:    [[S4:%.*]] = shl nuw i32 [[E4]], 24
; CHECK-NEXT:    [[O1:%.*]] = or disjoint i32 [[S2]], [[E1]]
; CHECK-NEXT:    [[O2:%.*]] = or disjoint i32 [[O1]], [[S3]]
; CHECK-NEXT:    [[O3:%.*]] = or disjoint i32 [[O2]], [[S4]]
; CHECK-NEXT:    ret i32 [[O3]]
;
  %p1 = getelementptr i8, ptr %p, i32 1
  %p2 = getelementptr i8, ptr %p, i32 2
  %p3 = getelementptr i8, ptr %p, i32 3
  %l1 = load i8, ptr %p
  %l2 = load i8, ptr %p1
  %l3 = load i8, ptr %p2
  %l4 = load i8, ptr %p3

  %e1 = zext i8 %l1 to i32
  %e2 = zext i8 %l2 to i32
  %e3 = zext i8 %l3 to i32
  %e4 = zext i8 %l4 to i32

  %s2 = shl i32 %e2, 8
  %s3 = shl i32 %e3, 16
  %s4 = shl i32 %e4, 24

  %o1 = or i32 %e1, %s4
  %o2 = or i32 %o1, %s2
  %o3 = or i32 %o2, %s3
  ret i32 %o3
}

define i32 @loadCombine_4consecutive_1432(ptr %p) {
; CHECK-LABEL: @loadCombine_4consecutive_1432(
; CHECK-NEXT:    [[P1:%.*]] = getelementptr i8, ptr [[P:%.*]], i64 1
; CHECK-NEXT:    [[P2:%.*]] = getelementptr i8, ptr [[P]], i64 2
; CHECK-NEXT:    [[P3:%.*]] = getelementptr i8, ptr [[P]], i64 3
; CHECK-NEXT:    [[L1:%.*]] = load i8, ptr [[P]], align 1
; CHECK-NEXT:    [[L2:%.*]] = load i8, ptr [[P1]], align 1
; CHECK-NEXT:    [[L3:%.*]] = load i8, ptr [[P2]], align 1
; CHECK-NEXT:    [[L4:%.*]] = load i8, ptr [[P3]], align 1
; CHECK-NEXT:    [[E1:%.*]] = zext i8 [[L1]] to i32
; CHECK-NEXT:    [[E2:%.*]] = zext i8 [[L2]] to i32
; CHECK-NEXT:    [[E3:%.*]] = zext i8 [[L3]] to i32
; CHECK-NEXT:    [[E4:%.*]] = zext i8 [[L4]] to i32
; CHECK-NEXT:    [[S2:%.*]] = shl nuw nsw i32 [[E2]], 8
; CHECK-NEXT:    [[S3:%.*]] = shl nuw nsw i32 [[E3]], 16
; CHECK-NEXT:    [[S4:%.*]] = shl nuw i32 [[E4]], 24
; CHECK-NEXT:    [[O1:%.*]] = or disjoint i32 [[S2]], [[E1]]
; CHECK-NEXT:    [[O2:%.*]] = or disjoint i32 [[O1]], [[S3]]
; CHECK-NEXT:    [[O3:%.*]] = or disjoint i32 [[O2]], [[S4]]
; CHECK-NEXT:    ret i32 [[O3]]
;
  %p1 = getelementptr i8, ptr %p, i32 1
  %p2 = getelementptr i8, ptr %p, i32 2
  %p3 = getelementptr i8, ptr %p, i32 3
  %l1 = load i8, ptr %p
  %l2 = load i8, ptr %p1
  %l3 = load i8, ptr %p2
  %l4 = load i8, ptr %p3

  %e1 = zext i8 %l1 to i32
  %e2 = zext i8 %l2 to i32
  %e3 = zext i8 %l3 to i32
  %e4 = zext i8 %l4 to i32

  %s2 = shl i32 %e2, 8
  %s3 = shl i32 %e3, 16
  %s4 = shl i32 %e4, 24

  %o1 = or i32 %e1, %s4
  %o2 = or i32 %o1, %s3
  %o3 = or i32 %o2, %s2
  ret i32 %o3
}

define i32 @loadCombine_4consecutive_2134(ptr %p) {
; CHECK-LABEL: @loadCombine_4consecutive_2134(
; CHECK-NEXT:    [[L1:%.*]] = load i32, ptr [[P:%.*]], align 1
; CHECK-NEXT:    ret i32 [[L1]]
;
  %p1 = getelementptr i8, ptr %p, i32 1
  %p2 = getelementptr i8, ptr %p, i32 2
  %p3 = getelementptr i8, ptr %p, i32 3
  %l1 = load i8, ptr %p
  %l2 = load i8, ptr %p1
  %l3 = load i8, ptr %p2
  %l4 = load i8, ptr %p3

  %e1 = zext i8 %l1 to i32
  %e2 = zext i8 %l2 to i32
  %e3 = zext i8 %l3 to i32
  %e4 = zext i8 %l4 to i32

  %s2 = shl i32 %e2, 8
  %s3 = shl i32 %e3, 16
  %s4 = shl i32 %e4, 24

  %o1 = or i32 %s2, %e1
  %o2 = or i32 %o1, %s3
  %o3 = or i32 %o2, %s4
  ret i32 %o3
}

define i32 @loadCombine_4consecutive_2143(ptr %p) {
; CHECK-LABEL: @loadCombine_4consecutive_2143(
; CHECK-NEXT:    [[P2:%.*]] = getelementptr i8, ptr [[P:%.*]], i64 2
; CHECK-NEXT:    [[P3:%.*]] = getelementptr i8, ptr [[P]], i64 3
; CHECK-NEXT:    [[L1:%.*]] = load i16, ptr [[P]], align 1
; CHECK-NEXT:    [[TMP1:%.*]] = zext i16 [[L1]] to i32
; CHECK-NEXT:    [[L3:%.*]] = load i8, ptr [[P2]], align 1
; CHECK-NEXT:    [[L4:%.*]] = load i8, ptr [[P3]], align 1
; CHECK-NEXT:    [[E3:%.*]] = zext i8 [[L3]] to i32
; CHECK-NEXT:    [[E4:%.*]] = zext i8 [[L4]] to i32
; CHECK-NEXT:    [[S3:%.*]] = shl nuw nsw i32 [[E3]], 16
; CHECK-NEXT:    [[S4:%.*]] = shl nuw i32 [[E4]], 24
; CHECK-NEXT:    [[O2:%.*]] = or disjoint i32 [[S3]], [[TMP1]]
; CHECK-NEXT:    [[O3:%.*]] = or disjoint i32 [[O2]], [[S4]]
; CHECK-NEXT:    ret i32 [[O3]]
;
  %p1 = getelementptr i8, ptr %p, i32 1
  %p2 = getelementptr i8, ptr %p, i32 2
  %p3 = getelementptr i8, ptr %p, i32 3
  %l1 = load i8, ptr %p
  %l2 = load i8, ptr %p1
  %l3 = load i8, ptr %p2
  %l4 = load i8, ptr %p3

  %e1 = zext i8 %l1 to i32
  %e2 = zext i8 %l2 to i32
  %e3 = zext i8 %l3 to i32
  %e4 = zext i8 %l4 to i32

  %s2 = shl i32 %e2, 8
  %s3 = shl i32 %e3, 16
  %s4 = shl i32 %e4, 24

  %o1 = or i32 %s2, %e1
  %o2 = or i32 %o1, %s4
  %o3 = or i32 %o2, %s3
  ret i32 %o3
}

define i32 @loadCombine_4consecutive_2314(ptr %p) {
; CHECK-LABEL: @loadCombine_4consecutive_2314(
; CHECK-NEXT:    [[L1:%.*]] = load i32, ptr [[P:%.*]], align 1
; CHECK-NEXT:    ret i32 [[L1]]
;
  %p1 = getelementptr i8, ptr %p, i32 1
  %p2 = getelementptr i8, ptr %p, i32 2
  %p3 = getelementptr i8, ptr %p, i32 3
  %l1 = load i8, ptr %p
  %l2 = load i8, ptr %p1
  %l3 = load i8, ptr %p2
  %l4 = load i8, ptr %p3

  %e1 = zext i8 %l1 to i32
  %e2 = zext i8 %l2 to i32
  %e3 = zext i8 %l3 to i32
  %e4 = zext i8 %l4 to i32

  %s2 = shl i32 %e2, 8
  %s3 = shl i32 %e3, 16
  %s4 = shl i32 %e4, 24

  %o1 = or i32 %s2, %s3
  %o2 = or i32 %o1, %e1
  %o3 = or i32 %o2, %s4
  ret i32 %o3
}

define i32 @loadCombine_4consecutive_2341(ptr %p) {
; CHECK-LABEL: @loadCombine_4consecutive_2341(
; CHECK-NEXT:    [[L1:%.*]] = load i32, ptr [[P:%.*]], align 1
; CHECK-NEXT:    ret i32 [[L1]]
;
  %p1 = getelementptr i8, ptr %p, i32 1
  %p2 = getelementptr i8, ptr %p, i32 2
  %p3 = getelementptr i8, ptr %p, i32 3
  %l1 = load i8, ptr %p
  %l2 = load i8, ptr %p1
  %l3 = load i8, ptr %p2
  %l4 = load i8, ptr %p3

  %e1 = zext i8 %l1 to i32
  %e2 = zext i8 %l2 to i32
  %e3 = zext i8 %l3 to i32
  %e4 = zext i8 %l4 to i32

  %s2 = shl i32 %e2, 8
  %s3 = shl i32 %e3, 16
  %s4 = shl i32 %e4, 24

  %o1 = or i32 %s2, %s3
  %o2 = or i32 %o1, %s4
  %o3 = or i32 %o2, %e1
  ret i32 %o3
}

define i32 @loadCombine_4consecutive_2413(ptr %p) {
; CHECK-LABEL: @loadCombine_4consecutive_2413(
; CHECK-NEXT:    [[P1:%.*]] = getelementptr i8, ptr [[P:%.*]], i64 1
; CHECK-NEXT:    [[P2:%.*]] = getelementptr i8, ptr [[P]], i64 2
; CHECK-NEXT:    [[P3:%.*]] = getelementptr i8, ptr [[P]], i64 3
; CHECK-NEXT:    [[L1:%.*]] = load i8, ptr [[P]], align 1
; CHECK-NEXT:    [[L2:%.*]] = load i8, ptr [[P1]], align 1
; CHECK-NEXT:    [[L3:%.*]] = load i8, ptr [[P2]], align 1
; CHECK-NEXT:    [[L4:%.*]] = load i8, ptr [[P3]], align 1
; CHECK-NEXT:    [[E1:%.*]] = zext i8 [[L1]] to i32
; CHECK-NEXT:    [[E2:%.*]] = zext i8 [[L2]] to i32
; CHECK-NEXT:    [[E3:%.*]] = zext i8 [[L3]] to i32
; CHECK-NEXT:    [[E4:%.*]] = zext i8 [[L4]] to i32
; CHECK-NEXT:    [[S2:%.*]] = shl nuw nsw i32 [[E2]], 8
; CHECK-NEXT:    [[S3:%.*]] = shl nuw nsw i32 [[E3]], 16
; CHECK-NEXT:    [[S4:%.*]] = shl nuw i32 [[E4]], 24
; CHECK-NEXT:    [[O1:%.*]] = or disjoint i32 [[S2]], [[E1]]
; CHECK-NEXT:    [[O2:%.*]] = or disjoint i32 [[O1]], [[S3]]
; CHECK-NEXT:    [[O3:%.*]] = or disjoint i32 [[O2]], [[S4]]
; CHECK-NEXT:    ret i32 [[O3]]
;
  %p1 = getelementptr i8, ptr %p, i32 1
  %p2 = getelementptr i8, ptr %p, i32 2
  %p3 = getelementptr i8, ptr %p, i32 3
  %l1 = load i8, ptr %p
  %l2 = load i8, ptr %p1
  %l3 = load i8, ptr %p2
  %l4 = load i8, ptr %p3

  %e1 = zext i8 %l1 to i32
  %e2 = zext i8 %l2 to i32
  %e3 = zext i8 %l3 to i32
  %e4 = zext i8 %l4 to i32

  %s2 = shl i32 %e2, 8
  %s3 = shl i32 %e3, 16
  %s4 = shl i32 %e4, 24

  %o1 = or i32 %s2, %s4
  %o2 = or i32 %o1, %e1
  %o3 = or i32 %o2, %s3
  ret i32 %o3
}

define i32 @loadCombine_4consecutive_2431(ptr %p) {
; CHECK-LABEL: @loadCombine_4consecutive_2431(
; CHECK-NEXT:    [[P1:%.*]] = getelementptr i8, ptr [[P:%.*]], i64 1
; CHECK-NEXT:    [[P2:%.*]] = getelementptr i8, ptr [[P]], i64 2
; CHECK-NEXT:    [[P3:%.*]] = getelementptr i8, ptr [[P]], i64 3
; CHECK-NEXT:    [[L1:%.*]] = load i8, ptr [[P]], align 1
; CHECK-NEXT:    [[L2:%.*]] = load i8, ptr [[P1]], align 1
; CHECK-NEXT:    [[L3:%.*]] = load i8, ptr [[P2]], align 1
; CHECK-NEXT:    [[L4:%.*]] = load i8, ptr [[P3]], align 1
; CHECK-NEXT:    [[E1:%.*]] = zext i8 [[L1]] to i32
; CHECK-NEXT:    [[E2:%.*]] = zext i8 [[L2]] to i32
; CHECK-NEXT:    [[E3:%.*]] = zext i8 [[L3]] to i32
; CHECK-NEXT:    [[E4:%.*]] = zext i8 [[L4]] to i32
; CHECK-NEXT:    [[S2:%.*]] = shl nuw nsw i32 [[E2]], 8
; CHECK-NEXT:    [[S3:%.*]] = shl nuw nsw i32 [[E3]], 16
; CHECK-NEXT:    [[S4:%.*]] = shl nuw i32 [[E4]], 24
; CHECK-NEXT:    [[O1:%.*]] = or disjoint i32 [[S2]], [[E1]]
; CHECK-NEXT:    [[O2:%.*]] = or disjoint i32 [[O1]], [[S3]]
; CHECK-NEXT:    [[O3:%.*]] = or disjoint i32 [[O2]], [[S4]]
; CHECK-NEXT:    ret i32 [[O3]]
;
  %p1 = getelementptr i8, ptr %p, i32 1
  %p2 = getelementptr i8, ptr %p, i32 2
  %p3 = getelementptr i8, ptr %p, i32 3
  %l1 = load i8, ptr %p
  %l2 = load i8, ptr %p1
  %l3 = load i8, ptr %p2
  %l4 = load i8, ptr %p3

  %e1 = zext i8 %l1 to i32
  %e2 = zext i8 %l2 to i32
  %e3 = zext i8 %l3 to i32
  %e4 = zext i8 %l4 to i32

  %s2 = shl i32 %e2, 8
  %s3 = shl i32 %e3, 16
  %s4 = shl i32 %e4, 24

  %o1 = or i32 %s2, %s4
  %o2 = or i32 %o1, %s3
  %o3 = or i32 %o2, %e1
  ret i32 %o3
}

define i32 @loadCombine_4consecutive_3124(ptr %p) {
; CHECK-LABEL: @loadCombine_4consecutive_3124(
; CHECK-NEXT:    [[P1:%.*]] = getelementptr i8, ptr [[P:%.*]], i64 1
; CHECK-NEXT:    [[P2:%.*]] = getelementptr i8, ptr [[P]], i64 2
; CHECK-NEXT:    [[P3:%.*]] = getelementptr i8, ptr [[P]], i64 3
; CHECK-NEXT:    [[L1:%.*]] = load i8, ptr [[P]], align 1
; CHECK-NEXT:    [[L2:%.*]] = load i8, ptr [[P1]], align 1
; CHECK-NEXT:    [[L3:%.*]] = load i8, ptr [[P2]], align 1
; CHECK-NEXT:    [[L4:%.*]] = load i8, ptr [[P3]], align 1
; CHECK-NEXT:    [[E1:%.*]] = zext i8 [[L1]] to i32
; CHECK-NEXT:    [[E2:%.*]] = zext i8 [[L2]] to i32
; CHECK-NEXT:    [[E3:%.*]] = zext i8 [[L3]] to i32
; CHECK-NEXT:    [[E4:%.*]] = zext i8 [[L4]] to i32
; CHECK-NEXT:    [[S2:%.*]] = shl nuw nsw i32 [[E2]], 8
; CHECK-NEXT:    [[S3:%.*]] = shl nuw nsw i32 [[E3]], 16
; CHECK-NEXT:    [[S4:%.*]] = shl nuw i32 [[E4]], 24
; CHECK-NEXT:    [[O1:%.*]] = or disjoint i32 [[S2]], [[E1]]
; CHECK-NEXT:    [[O2:%.*]] = or disjoint i32 [[O1]], [[S3]]
; CHECK-NEXT:    [[O3:%.*]] = or disjoint i32 [[O2]], [[S4]]
; CHECK-NEXT:    ret i32 [[O3]]
;
  %p1 = getelementptr i8, ptr %p, i32 1
  %p2 = getelementptr i8, ptr %p, i32 2
  %p3 = getelementptr i8, ptr %p, i32 3
  %l1 = load i8, ptr %p
  %l2 = load i8, ptr %p1
  %l3 = load i8, ptr %p2
  %l4 = load i8, ptr %p3

  %e1 = zext i8 %l1 to i32
  %e2 = zext i8 %l2 to i32
  %e3 = zext i8 %l3 to i32
  %e4 = zext i8 %l4 to i32

  %s2 = shl i32 %e2, 8
  %s3 = shl i32 %e3, 16
  %s4 = shl i32 %e4, 24

  %o1 = or i32 %s3, %e1
  %o2 = or i32 %o1, %s2
  %o3 = or i32 %o2, %s4
  ret i32 %o3
}

define i32 @loadCombine_4consecutive_3142(ptr %p) {
; CHECK-LABEL: @loadCombine_4consecutive_3142(
; CHECK-NEXT:    [[P1:%.*]] = getelementptr i8, ptr [[P:%.*]], i64 1
; CHECK-NEXT:    [[P2:%.*]] = getelementptr i8, ptr [[P]], i64 2
; CHECK-NEXT:    [[P3:%.*]] = getelementptr i8, ptr [[P]], i64 3
; CHECK-NEXT:    [[L1:%.*]] = load i8, ptr [[P]], align 1
; CHECK-NEXT:    [[L2:%.*]] = load i8, ptr [[P1]], align 1
; CHECK-NEXT:    [[L3:%.*]] = load i8, ptr [[P2]], align 1
; CHECK-NEXT:    [[L4:%.*]] = load i8, ptr [[P3]], align 1
; CHECK-NEXT:    [[E1:%.*]] = zext i8 [[L1]] to i32
; CHECK-NEXT:    [[E2:%.*]] = zext i8 [[L2]] to i32
; CHECK-NEXT:    [[E3:%.*]] = zext i8 [[L3]] to i32
; CHECK-NEXT:    [[E4:%.*]] = zext i8 [[L4]] to i32
; CHECK-NEXT:    [[S2:%.*]] = shl nuw nsw i32 [[E2]], 8
; CHECK-NEXT:    [[S3:%.*]] = shl nuw nsw i32 [[E3]], 16
; CHECK-NEXT:    [[S4:%.*]] = shl nuw i32 [[E4]], 24
; CHECK-NEXT:    [[O1:%.*]] = or disjoint i32 [[S2]], [[E1]]
; CHECK-NEXT:    [[O2:%.*]] = or disjoint i32 [[O1]], [[S3]]
; CHECK-NEXT:    [[O3:%.*]] = or disjoint i32 [[O2]], [[S4]]
; CHECK-NEXT:    ret i32 [[O3]]
;
  %p1 = getelementptr i8, ptr %p, i32 1
  %p2 = getelementptr i8, ptr %p, i32 2
  %p3 = getelementptr i8, ptr %p, i32 3
  %l1 = load i8, ptr %p
  %l2 = load i8, ptr %p1
  %l3 = load i8, ptr %p2
  %l4 = load i8, ptr %p3

  %e1 = zext i8 %l1 to i32
  %e2 = zext i8 %l2 to i32
  %e3 = zext i8 %l3 to i32
  %e4 = zext i8 %l4 to i32

  %s2 = shl i32 %e2, 8
  %s3 = shl i32 %e3, 16
  %s4 = shl i32 %e4, 24

  %o1 = or i32 %s3, %e1
  %o2 = or i32 %o1, %s4
  %o3 = or i32 %o2, %s2
  ret i32 %o3
}

define i32 @loadCombine_4consecutive_3214(ptr %p) {
; CHECK-LABEL: @loadCombine_4consecutive_3214(
; CHECK-NEXT:    [[L1:%.*]] = load i32, ptr [[P:%.*]], align 1
; CHECK-NEXT:    ret i32 [[L1]]
;
  %p1 = getelementptr i8, ptr %p, i32 1
  %p2 = getelementptr i8, ptr %p, i32 2
  %p3 = getelementptr i8, ptr %p, i32 3
  %l1 = load i8, ptr %p
  %l2 = load i8, ptr %p1
  %l3 = load i8, ptr %p2
  %l4 = load i8, ptr %p3

  %e1 = zext i8 %l1 to i32
  %e2 = zext i8 %l2 to i32
  %e3 = zext i8 %l3 to i32
  %e4 = zext i8 %l4 to i32

  %s2 = shl i32 %e2, 8
  %s3 = shl i32 %e3, 16
  %s4 = shl i32 %e4, 24

  %o1 = or i32 %s3, %s2
  %o2 = or i32 %o1, %e1
  %o3 = or i32 %o2, %s4
  ret i32 %o3
}

define i32 @loadCombine_4consecutive_3241(ptr %p) {
; CHECK-LABEL: @loadCombine_4consecutive_3241(
; CHECK-NEXT:    [[L1:%.*]] = load i32, ptr [[P:%.*]], align 1
; CHECK-NEXT:    ret i32 [[L1]]
;
  %p1 = getelementptr i8, ptr %p, i32 1
  %p2 = getelementptr i8, ptr %p, i32 2
  %p3 = getelementptr i8, ptr %p, i32 3
  %l1 = load i8, ptr %p
  %l2 = load i8, ptr %p1
  %l3 = load i8, ptr %p2
  %l4 = load i8, ptr %p3

  %e1 = zext i8 %l1 to i32
  %e2 = zext i8 %l2 to i32
  %e3 = zext i8 %l3 to i32
  %e4 = zext i8 %l4 to i32

  %s2 = shl i32 %e2, 8
  %s3 = shl i32 %e3, 16
  %s4 = shl i32 %e4, 24

  %o1 = or i32 %s3, %s2
  %o2 = or i32 %o1, %s4
  %o3 = or i32 %o2, %e1
  ret i32 %o3
}

define i32 @loadCombine_4consecutive_3412(ptr %p) {
; CHECK-LABEL: @loadCombine_4consecutive_3412(
; CHECK-NEXT:    [[P1:%.*]] = getelementptr i8, ptr [[P:%.*]], i64 1
; CHECK-NEXT:    [[P2:%.*]] = getelementptr i8, ptr [[P]], i64 2
; CHECK-NEXT:    [[L1:%.*]] = load i8, ptr [[P]], align 1
; CHECK-NEXT:    [[L2:%.*]] = load i8, ptr [[P1]], align 1
; CHECK-NEXT:    [[L3:%.*]] = load i16, ptr [[P2]], align 1
; CHECK-NEXT:    [[TMP1:%.*]] = zext i16 [[L3]] to i32
; CHECK-NEXT:    [[TMP2:%.*]] = shl nuw i32 [[TMP1]], 16
; CHECK-NEXT:    [[E1:%.*]] = zext i8 [[L1]] to i32
; CHECK-NEXT:    [[E2:%.*]] = zext i8 [[L2]] to i32
; CHECK-NEXT:    [[S2:%.*]] = shl nuw nsw i32 [[E2]], 8
; CHECK-NEXT:    [[O2:%.*]] = or disjoint i32 [[S2]], [[E1]]
; CHECK-NEXT:    [[O3:%.*]] = or disjoint i32 [[O2]], [[TMP2]]
; CHECK-NEXT:    ret i32 [[O3]]
;
  %p1 = getelementptr i8, ptr %p, i32 1
  %p2 = getelementptr i8, ptr %p, i32 2
  %p3 = getelementptr i8, ptr %p, i32 3
  %l1 = load i8, ptr %p
  %l2 = load i8, ptr %p1
  %l3 = load i8, ptr %p2
  %l4 = load i8, ptr %p3

  %e1 = zext i8 %l1 to i32
  %e2 = zext i8 %l2 to i32
  %e3 = zext i8 %l3 to i32
  %e4 = zext i8 %l4 to i32

  %s2 = shl i32 %e2, 8
  %s3 = shl i32 %e3, 16
  %s4 = shl i32 %e4, 24

  %o1 = or i32 %s3, %s4
  %o2 = or i32 %o1, %e1
  %o3 = or i32 %o2, %s2
  ret i32 %o3
}

define i32 @loadCombine_4consecutive_3421(ptr %p) {
; CHECK-LABEL: @loadCombine_4consecutive_3421(
; CHECK-NEXT:    [[L1:%.*]] = load i32, ptr [[P:%.*]], align 1
; CHECK-NEXT:    ret i32 [[L1]]
;
  %p1 = getelementptr i8, ptr %p, i32 1
  %p2 = getelementptr i8, ptr %p, i32 2
  %p3 = getelementptr i8, ptr %p, i32 3
  %l1 = load i8, ptr %p
  %l2 = load i8, ptr %p1
  %l3 = load i8, ptr %p2
  %l4 = load i8, ptr %p3

  %e1 = zext i8 %l1 to i32
  %e2 = zext i8 %l2 to i32
  %e3 = zext i8 %l3 to i32
  %e4 = zext i8 %l4 to i32

  %s2 = shl i32 %e2, 8
  %s3 = shl i32 %e3, 16
  %s4 = shl i32 %e4, 24

  %o1 = or i32 %s3, %s4
  %o2 = or i32 %o1, %s2
  %o3 = or i32 %o2, %e1
  ret i32 %o3
}

define i32 @loadCombine_4consecutive_4123(ptr %p) {
; CHECK-LABEL: @loadCombine_4consecutive_4123(
; CHECK-NEXT:    [[P1:%.*]] = getelementptr i8, ptr [[P:%.*]], i64 1
; CHECK-NEXT:    [[P2:%.*]] = getelementptr i8, ptr [[P]], i64 2
; CHECK-NEXT:    [[P3:%.*]] = getelementptr i8, ptr [[P]], i64 3
; CHECK-NEXT:    [[L1:%.*]] = load i8, ptr [[P]], align 1
; CHECK-NEXT:    [[L2:%.*]] = load i8, ptr [[P1]], align 1
; CHECK-NEXT:    [[L3:%.*]] = load i8, ptr [[P2]], align 1
; CHECK-NEXT:    [[L4:%.*]] = load i8, ptr [[P3]], align 1
; CHECK-NEXT:    [[E1:%.*]] = zext i8 [[L1]] to i32
; CHECK-NEXT:    [[E2:%.*]] = zext i8 [[L2]] to i32
; CHECK-NEXT:    [[E3:%.*]] = zext i8 [[L3]] to i32
; CHECK-NEXT:    [[E4:%.*]] = zext i8 [[L4]] to i32
; CHECK-NEXT:    [[S2:%.*]] = shl nuw nsw i32 [[E2]], 8
; CHECK-NEXT:    [[S3:%.*]] = shl nuw nsw i32 [[E3]], 16
; CHECK-NEXT:    [[S4:%.*]] = shl nuw i32 [[E4]], 24
; CHECK-NEXT:    [[O1:%.*]] = or disjoint i32 [[S2]], [[E1]]
; CHECK-NEXT:    [[O2:%.*]] = or disjoint i32 [[O1]], [[S3]]
; CHECK-NEXT:    [[O3:%.*]] = or disjoint i32 [[O2]], [[S4]]
; CHECK-NEXT:    ret i32 [[O3]]
;
  %p1 = getelementptr i8, ptr %p, i32 1
  %p2 = getelementptr i8, ptr %p, i32 2
  %p3 = getelementptr i8, ptr %p, i32 3
  %l1 = load i8, ptr %p
  %l2 = load i8, ptr %p1
  %l3 = load i8, ptr %p2
  %l4 = load i8, ptr %p3

  %e1 = zext i8 %l1 to i32
  %e2 = zext i8 %l2 to i32
  %e3 = zext i8 %l3 to i32
  %e4 = zext i8 %l4 to i32

  %s2 = shl i32 %e2, 8
  %s3 = shl i32 %e3, 16
  %s4 = shl i32 %e4, 24

  %o1 = or i32 %s4, %e1
  %o2 = or i32 %o1, %s2
  %o3 = or i32 %o2, %s3
  ret i32 %o3
}

define i32 @loadCombine_4consecutive_4132(ptr %p) {
; CHECK-LABEL: @loadCombine_4consecutive_4132(
; CHECK-NEXT:    [[P1:%.*]] = getelementptr i8, ptr [[P:%.*]], i64 1
; CHECK-NEXT:    [[P2:%.*]] = getelementptr i8, ptr [[P]], i64 2
; CHECK-NEXT:    [[P3:%.*]] = getelementptr i8, ptr [[P]], i64 3
; CHECK-NEXT:    [[L1:%.*]] = load i8, ptr [[P]], align 1
; CHECK-NEXT:    [[L2:%.*]] = load i8, ptr [[P1]], align 1
; CHECK-NEXT:    [[L3:%.*]] = load i8, ptr [[P2]], align 1
; CHECK-NEXT:    [[L4:%.*]] = load i8, ptr [[P3]], align 1
; CHECK-NEXT:    [[E1:%.*]] = zext i8 [[L1]] to i32
; CHECK-NEXT:    [[E2:%.*]] = zext i8 [[L2]] to i32
; CHECK-NEXT:    [[E3:%.*]] = zext i8 [[L3]] to i32
; CHECK-NEXT:    [[E4:%.*]] = zext i8 [[L4]] to i32
; CHECK-NEXT:    [[S2:%.*]] = shl nuw nsw i32 [[E2]], 8
; CHECK-NEXT:    [[S3:%.*]] = shl nuw nsw i32 [[E3]], 16
; CHECK-NEXT:    [[S4:%.*]] = shl nuw i32 [[E4]], 24
; CHECK-NEXT:    [[O1:%.*]] = or disjoint i32 [[S2]], [[E1]]
; CHECK-NEXT:    [[O2:%.*]] = or disjoint i32 [[O1]], [[S3]]
; CHECK-NEXT:    [[O3:%.*]] = or disjoint i32 [[O2]], [[S4]]
; CHECK-NEXT:    ret i32 [[O3]]
;
  %p1 = getelementptr i8, ptr %p, i32 1
  %p2 = getelementptr i8, ptr %p, i32 2
  %p3 = getelementptr i8, ptr %p, i32 3
  %l1 = load i8, ptr %p
  %l2 = load i8, ptr %p1
  %l3 = load i8, ptr %p2
  %l4 = load i8, ptr %p3

  %e1 = zext i8 %l1 to i32
  %e2 = zext i8 %l2 to i32
  %e3 = zext i8 %l3 to i32
  %e4 = zext i8 %l4 to i32

  %s2 = shl i32 %e2, 8
  %s3 = shl i32 %e3, 16
  %s4 = shl i32 %e4, 24

  %o1 = or i32 %s4, %e1
  %o2 = or i32 %o1, %s3
  %o3 = or i32 %o2, %s2
  ret i32 %o3
}

define i32 @loadCombine_4consecutive_4213(ptr %p) {
; CHECK-LABEL: @loadCombine_4consecutive_4213(
; CHECK-NEXT:    [[P1:%.*]] = getelementptr i8, ptr [[P:%.*]], i64 1
; CHECK-NEXT:    [[P2:%.*]] = getelementptr i8, ptr [[P]], i64 2
; CHECK-NEXT:    [[P3:%.*]] = getelementptr i8, ptr [[P]], i64 3
; CHECK-NEXT:    [[L1:%.*]] = load i8, ptr [[P]], align 1
; CHECK-NEXT:    [[L2:%.*]] = load i8, ptr [[P1]], align 1
; CHECK-NEXT:    [[L3:%.*]] = load i8, ptr [[P2]], align 1
; CHECK-NEXT:    [[L4:%.*]] = load i8, ptr [[P3]], align 1
; CHECK-NEXT:    [[E1:%.*]] = zext i8 [[L1]] to i32
; CHECK-NEXT:    [[E2:%.*]] = zext i8 [[L2]] to i32
; CHECK-NEXT:    [[E3:%.*]] = zext i8 [[L3]] to i32
; CHECK-NEXT:    [[E4:%.*]] = zext i8 [[L4]] to i32
; CHECK-NEXT:    [[S2:%.*]] = shl nuw nsw i32 [[E2]], 8
; CHECK-NEXT:    [[S3:%.*]] = shl nuw nsw i32 [[E3]], 16
; CHECK-NEXT:    [[S4:%.*]] = shl nuw i32 [[E4]], 24
; CHECK-NEXT:    [[O1:%.*]] = or disjoint i32 [[S2]], [[E1]]
; CHECK-NEXT:    [[O2:%.*]] = or disjoint i32 [[O1]], [[S3]]
; CHECK-NEXT:    [[O3:%.*]] = or disjoint i32 [[O2]], [[S4]]
; CHECK-NEXT:    ret i32 [[O3]]
;
  %p1 = getelementptr i8, ptr %p, i32 1
  %p2 = getelementptr i8, ptr %p, i32 2
  %p3 = getelementptr i8, ptr %p, i32 3
  %l1 = load i8, ptr %p
  %l2 = load i8, ptr %p1
  %l3 = load i8, ptr %p2
  %l4 = load i8, ptr %p3

  %e1 = zext i8 %l1 to i32
  %e2 = zext i8 %l2 to i32
  %e3 = zext i8 %l3 to i32
  %e4 = zext i8 %l4 to i32

  %s2 = shl i32 %e2, 8
  %s3 = shl i32 %e3, 16
  %s4 = shl i32 %e4, 24

  %o1 = or i32 %s4, %s2
  %o2 = or i32 %o1, %e1
  %o3 = or i32 %o2, %s3
  ret i32 %o3
}

define i32 @loadCombine_4consecutive_4231(ptr %p) {
; CHECK-LABEL: @loadCombine_4consecutive_4231(
; CHECK-NEXT:    [[P1:%.*]] = getelementptr i8, ptr [[P:%.*]], i64 1
; CHECK-NEXT:    [[P2:%.*]] = getelementptr i8, ptr [[P]], i64 2
; CHECK-NEXT:    [[P3:%.*]] = getelementptr i8, ptr [[P]], i64 3
; CHECK-NEXT:    [[L1:%.*]] = load i8, ptr [[P]], align 1
; CHECK-NEXT:    [[L2:%.*]] = load i8, ptr [[P1]], align 1
; CHECK-NEXT:    [[L3:%.*]] = load i8, ptr [[P2]], align 1
; CHECK-NEXT:    [[L4:%.*]] = load i8, ptr [[P3]], align 1
; CHECK-NEXT:    [[E1:%.*]] = zext i8 [[L1]] to i32
; CHECK-NEXT:    [[E2:%.*]] = zext i8 [[L2]] to i32
; CHECK-NEXT:    [[E3:%.*]] = zext i8 [[L3]] to i32
; CHECK-NEXT:    [[E4:%.*]] = zext i8 [[L4]] to i32
; CHECK-NEXT:    [[S2:%.*]] = shl nuw nsw i32 [[E2]], 8
; CHECK-NEXT:    [[S3:%.*]] = shl nuw nsw i32 [[E3]], 16
; CHECK-NEXT:    [[S4:%.*]] = shl nuw i32 [[E4]], 24
; CHECK-NEXT:    [[O1:%.*]] = or disjoint i32 [[S2]], [[E1]]
; CHECK-NEXT:    [[O2:%.*]] = or disjoint i32 [[O1]], [[S3]]
; CHECK-NEXT:    [[O3:%.*]] = or disjoint i32 [[O2]], [[S4]]
; CHECK-NEXT:    ret i32 [[O3]]
;
  %p1 = getelementptr i8, ptr %p, i32 1
  %p2 = getelementptr i8, ptr %p, i32 2
  %p3 = getelementptr i8, ptr %p, i32 3
  %l1 = load i8, ptr %p
  %l2 = load i8, ptr %p1
  %l3 = load i8, ptr %p2
  %l4 = load i8, ptr %p3

  %e1 = zext i8 %l1 to i32
  %e2 = zext i8 %l2 to i32
  %e3 = zext i8 %l3 to i32
  %e4 = zext i8 %l4 to i32

  %s2 = shl i32 %e2, 8
  %s3 = shl i32 %e3, 16
  %s4 = shl i32 %e4, 24

  %o1 = or i32 %s4, %s2
  %o2 = or i32 %o1, %s3
  %o3 = or i32 %o2, %e1
  ret i32 %o3
}

define i32 @loadCombine_4consecutive_4312(ptr %p) {
; CHECK-LABEL: @loadCombine_4consecutive_4312(
; CHECK-NEXT:    [[P1:%.*]] = getelementptr i8, ptr [[P:%.*]], i64 1
; CHECK-NEXT:    [[P2:%.*]] = getelementptr i8, ptr [[P]], i64 2
; CHECK-NEXT:    [[L1:%.*]] = load i8, ptr [[P]], align 1
; CHECK-NEXT:    [[L2:%.*]] = load i8, ptr [[P1]], align 1
; CHECK-NEXT:    [[L3:%.*]] = load i16, ptr [[P2]], align 1
; CHECK-NEXT:    [[TMP1:%.*]] = zext i16 [[L3]] to i32
; CHECK-NEXT:    [[TMP2:%.*]] = shl nuw i32 [[TMP1]], 16
; CHECK-NEXT:    [[E1:%.*]] = zext i8 [[L1]] to i32
; CHECK-NEXT:    [[E2:%.*]] = zext i8 [[L2]] to i32
; CHECK-NEXT:    [[S2:%.*]] = shl nuw nsw i32 [[E2]], 8
; CHECK-NEXT:    [[O2:%.*]] = or disjoint i32 [[S2]], [[E1]]
; CHECK-NEXT:    [[O3:%.*]] = or disjoint i32 [[O2]], [[TMP2]]
; CHECK-NEXT:    ret i32 [[O3]]
;
  %p1 = getelementptr i8, ptr %p, i32 1
  %p2 = getelementptr i8, ptr %p, i32 2
  %p3 = getelementptr i8, ptr %p, i32 3
  %l1 = load i8, ptr %p
  %l2 = load i8, ptr %p1
  %l3 = load i8, ptr %p2
  %l4 = load i8, ptr %p3

  %e1 = zext i8 %l1 to i32
  %e2 = zext i8 %l2 to i32
  %e3 = zext i8 %l3 to i32
  %e4 = zext i8 %l4 to i32

  %s2 = shl i32 %e2, 8
  %s3 = shl i32 %e3, 16
  %s4 = shl i32 %e4, 24

  %o1 = or i32 %s4, %s3
  %o2 = or i32 %o1, %e1
  %o3 = or i32 %o2, %s2
  ret i32 %o3
}

define i32 @loadCombine_4consecutive_4321(ptr %p) {
; CHECK-LABEL: @loadCombine_4consecutive_4321(
; CHECK-NEXT:    [[L1:%.*]] = load i32, ptr [[P:%.*]], align 1
; CHECK-NEXT:    ret i32 [[L1]]
;
  %p1 = getelementptr i8, ptr %p, i32 1
  %p2 = getelementptr i8, ptr %p, i32 2
  %p3 = getelementptr i8, ptr %p, i32 3
  %l1 = load i8, ptr %p
  %l2 = load i8, ptr %p1
  %l3 = load i8, ptr %p2
  %l4 = load i8, ptr %p3

  %e1 = zext i8 %l1 to i32
  %e2 = zext i8 %l2 to i32
  %e3 = zext i8 %l3 to i32
  %e4 = zext i8 %l4 to i32

  %s2 = shl i32 %e2, 8
  %s3 = shl i32 %e3, 16
  %s4 = shl i32 %e4, 24

  %o1 = or i32 %s4, %s3
  %o2 = or i32 %o1, %s2
  %o3 = or i32 %o2, %e1
  ret i32 %o3
}