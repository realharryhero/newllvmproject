; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --version 4
; RUN: llc -mtriple=aarch64 < %s | FileCheck %s

define i64 @get_fpcr() #0 {
; CHECK-LABEL: get_fpcr:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mrs x0, FPCR
; CHECK-NEXT:    ret
  %1 = tail call i64 @llvm.aarch64.get.fpcr()
  ret i64 %1
}

define void @set_fpcr(i64 %cr) {
; CHECK-LABEL: set_fpcr:
; CHECK:       // %bb.0:
; CHECK-NEXT:    msr FPCR, x0
; CHECK-NEXT:    ret
  call void @llvm.aarch64.set.fpcr(i64 %cr)
  ret void
}

define i64 @get_fpsr() {
; CHECK-LABEL: get_fpsr:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mrs x0, FPSR
; CHECK-NEXT:    ret
  %1 = tail call i64 @llvm.aarch64.get.fpsr()
  ret i64 %1
}

define void @set_fpsr(i64 %sr) {
; CHECK-LABEL: set_fpsr:
; CHECK:       // %bb.0:
; CHECK-NEXT:    msr FPSR, x0
; CHECK-NEXT:    ret
  call void @llvm.aarch64.set.fpsr(i64 %sr)
  ret void
}

declare i64 @llvm.aarch64.get.fpcr()
declare void @llvm.aarch64.set.fpcr(i64)
declare i64 @llvm.aarch64.get.fpsr()
declare void @llvm.aarch64.set.fpsr(i64)

attributes #0 = { nounwind }