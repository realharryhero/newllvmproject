; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --version 2
; Test the handling of i128 argument values
;
; RUN: llc < %s -mtriple=s390x-linux-gnu -mcpu=z13 | FileCheck %s

declare void @bar(i64, i64, i64, i64, i128,
                  i64, i64, i64, i64, i128)

; There are two indirect i128 slots, one at offset 200 (the first available
; byte after the outgoing arguments) and one immediately after it at 216.

define void @foo() {
; CHECK-LABEL: foo:
; CHECK:       # %bb.0:
; CHECK-NEXT:    stmg %r6, %r15, 48(%r15)
; CHECK-NEXT:    .cfi_offset %r6, -112
; CHECK-NEXT:    .cfi_offset %r14, -48
; CHECK-NEXT:    .cfi_offset %r15, -40
; CHECK-NEXT:    aghi %r15, -232
; CHECK-NEXT:    .cfi_def_cfa_offset 392
; CHECK-NEXT:    larl %r1, .LCPI0_0
; CHECK-NEXT:    vl %v0, 0(%r1), 3
; CHECK-NEXT:    la %r0, 200(%r15)
; CHECK-NEXT:    larl %r1, .LCPI0_1
; CHECK-NEXT:    stg %r0, 192(%r15)
; CHECK-NEXT:    vst %v0, 176(%r15), 3
; CHECK-NEXT:    vl %v0, 0(%r1), 3
; CHECK-NEXT:    vst %v0, 160(%r15), 3
; CHECK-NEXT:    vgbm %v0, 0
; CHECK-NEXT:    la %r6, 216(%r15)
; CHECK-NEXT:    lghi %r2, 1
; CHECK-NEXT:    lghi %r3, 2
; CHECK-NEXT:    lghi %r4, 3
; CHECK-NEXT:    lghi %r5, 4
; CHECK-NEXT:    vst %v0, 200(%r15), 3
; CHECK-NEXT:    vst %v0, 216(%r15), 3
; CHECK-NEXT:    brasl %r14, bar@PLT
; CHECK-NEXT:    lmg %r6, %r15, 280(%r15)
; CHECK-NEXT:    br %r14
  call void @bar (i64 1, i64 2, i64 3, i64 4, i128 0,
                  i64 5, i64 6, i64 7, i64 8, i128 0)
  ret void
}