; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --version 2
; RUN: llc -verify-machineinstrs -csky-no-aliases -mattr=+e2 < %s -mtriple=csky | FileCheck %s

define i32 @test_or_128(i32 noundef %0) {
; CHECK-LABEL: test_or_128:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori32 a0, a0, 128
; CHECK-NEXT:    rts16
 %2 = or i32 %0, 128
 ret i32 %2
}

define i32 @test_or_131072(i32 noundef %0) {
; CHECK-LABEL: test_or_131072:
; CHECK:       # %bb.0:
; CHECK-NEXT:    bseti16 a0, 17
; CHECK-NEXT:    rts16
 %2 = or i32 %0, 131072
 ret i32 %2
}

define i32 @test_or_192(i32 noundef %0) {
; CHECK-LABEL: test_or_192:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori32 a0, a0, 192
; CHECK-NEXT:    rts16
 %2 = or i32 %0, 192
 ret i32 %2
}

define i32 @test_or_3072(i32 noundef %0) {
; CHECK-LABEL: test_or_3072:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ori32 a0, a0, 3072
; CHECK-NEXT:    rts16
 %2 = or i32 %0, 3072
 ret i32 %2
}

define i32 @test_or_196608(i32 noundef %0) {
; CHECK-LABEL: test_or_196608:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movih32 a1, 3
; CHECK-NEXT:    or16 a0, a1
; CHECK-NEXT:    rts16
 %2 = or i32 %0, 196608
 ret i32 %2
}

define i32 @test_or_65540(i32 noundef %0) {
; CHECK-LABEL: test_or_65540:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movih32 a1, 1
; CHECK-NEXT:    ori32 a1, a1, 4
; CHECK-NEXT:    or16 a0, a1
; CHECK-NEXT:    rts16
 %2 = or i32 %0, 65540
 ret i32 %2
}

define i32 @test_andnot_128(i32 noundef %0) {
; CHECK-LABEL: test_andnot_128:
; CHECK:       # %bb.0:
; CHECK-NEXT:    andni32 a0, a0, 128
; CHECK-NEXT:    rts16
 %2 = and i32 %0, -129
 ret i32 %2
}

define i32 @test_andnot_131072(i32 noundef %0) {
; CHECK-LABEL: test_andnot_131072:
; CHECK:       # %bb.0:
; CHECK-NEXT:    bclri16 a0, 17
; CHECK-NEXT:    rts16
 %2 = and i32 %0, -131073
 ret i32 %2
}

define i32 @test_andnot_192(i32 noundef %0) {
; CHECK-LABEL: test_andnot_192:
; CHECK:       # %bb.0:
; CHECK-NEXT:    andni32 a0, a0, 192
; CHECK-NEXT:    rts16
 %2 = and i32 %0, -193
 ret i32 %2
}

define i32 @test_andnot_3072(i32 noundef %0) {
; CHECK-LABEL: test_andnot_3072:
; CHECK:       # %bb.0:
; CHECK-NEXT:    andni32 a0, a0, 3072
; CHECK-NEXT:    rts16
 %2 = and i32 %0, -3073
 ret i32 %2
}

define i32 @test_andnot_1966608(i32 noundef %0) {
; CHECK-LABEL: test_andnot_1966608:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movih32 a1, 65505
; CHECK-NEXT:    ori32 a1, a1, 65007
; CHECK-NEXT:    and16 a0, a1
; CHECK-NEXT:    rts16
 %2 = and i32 %0, -1966609
 ret i32 %2
}

define i32 @test_andnot_65540(i32 noundef %0) {
; CHECK-LABEL: test_andnot_65540:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movih32 a1, 65534
; CHECK-NEXT:    ori32 a1, a1, 65531
; CHECK-NEXT:    and16 a0, a1
; CHECK-NEXT:    rts16
 %2 = and i32 %0, -65541
 ret i32 %2
}