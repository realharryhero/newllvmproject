; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -S -mtriple=i686-linux-gnu -passes=atomic-expand %s | FileCheck %s

define double @atomic_xchg_f64(ptr %ptr) nounwind {
; CHECK-LABEL: @atomic_xchg_f64(
; CHECK-NEXT:    [[TMP2:%.*]] = load i64, ptr [[PTR:%.*]], align 8
; CHECK-NEXT:    br label [[ATOMICRMW_START:%.*]]
; CHECK:       atomicrmw.start:
; CHECK-NEXT:    [[LOADED:%.*]] = phi i64 [ [[TMP2]], [[TMP0:%.*]] ], [ [[NEWLOADED:%.*]], [[ATOMICRMW_START]] ]
; CHECK-NEXT:    [[TMP3:%.*]] = cmpxchg ptr [[PTR]], i64 [[LOADED]], i64 4616189618054758400 seq_cst seq_cst, align 8
; CHECK-NEXT:    [[SUCCESS:%.*]] = extractvalue { i64, i1 } [[TMP3]], 1
; CHECK-NEXT:    [[NEWLOADED]] = extractvalue { i64, i1 } [[TMP3]], 0
; CHECK-NEXT:    br i1 [[SUCCESS]], label [[ATOMICRMW_END:%.*]], label [[ATOMICRMW_START]]
; CHECK:       atomicrmw.end:
; CHECK-NEXT:    [[TMP4:%.*]] = bitcast i64 [[NEWLOADED]] to double
; CHECK-NEXT:    ret double [[TMP4]]
;
  %result = atomicrmw xchg ptr %ptr, double 4.0 seq_cst
  ret double %result
}

define double @atomic_xchg_f64_as1(ptr addrspace(1) %ptr) nounwind {
; CHECK-LABEL: @atomic_xchg_f64_as1(
; CHECK-NEXT:    [[TMP2:%.*]] = load i64, ptr addrspace(1) [[PTR:%.*]], align 8
; CHECK-NEXT:    br label [[ATOMICRMW_START:%.*]]
; CHECK:       atomicrmw.start:
; CHECK-NEXT:    [[LOADED:%.*]] = phi i64 [ [[TMP2]], [[TMP0:%.*]] ], [ [[NEWLOADED:%.*]], [[ATOMICRMW_START]] ]
; CHECK-NEXT:    [[TMP3:%.*]] = cmpxchg ptr addrspace(1) [[PTR]], i64 [[LOADED]], i64 4616189618054758400 seq_cst seq_cst, align 8
; CHECK-NEXT:    [[SUCCESS:%.*]] = extractvalue { i64, i1 } [[TMP3]], 1
; CHECK-NEXT:    [[NEWLOADED]] = extractvalue { i64, i1 } [[TMP3]], 0
; CHECK-NEXT:    br i1 [[SUCCESS]], label [[ATOMICRMW_END:%.*]], label [[ATOMICRMW_START]]
; CHECK:       atomicrmw.end:
; CHECK-NEXT:    [[TMP4:%.*]] = bitcast i64 [[NEWLOADED]] to double
; CHECK-NEXT:    ret double [[TMP4]]
;
  %result = atomicrmw xchg ptr addrspace(1) %ptr, double 4.0 seq_cst
  ret double %result
}