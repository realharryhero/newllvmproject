; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 5
; RUN: opt < %s -passes=ipsccp -S | FileCheck %s
; PR3325

define i32 @main() personality ptr @__gxx_personality_v0 {
; CHECK-LABEL: define i32 @main() personality ptr @__gxx_personality_v0 {
; CHECK-NEXT:    [[TMP1:%.*]] = invoke i32 @f()
; CHECK-NEXT:            to label %[[UNIFIEDRETURNBLOCK:.*]] unwind label %[[LPAD:.*]]
; CHECK:       [[LPAD]]:
; CHECK-NEXT:    [[VAL:%.*]] = landingpad { ptr, i32 }
; CHECK-NEXT:            cleanup
; CHECK-NEXT:    unreachable
; CHECK:       [[UNIFIEDRETURNBLOCK]]:
; CHECK-NEXT:    ret i32 42
;
  %tmp1 = invoke i32 @f()
  to label %UnifiedReturnBlock unwind label %lpad

lpad:
  %val = landingpad { ptr, i32 }
  cleanup
  unreachable

UnifiedReturnBlock:
  ret i32 %tmp1
}

define internal i32 @f() {
; CHECK-LABEL: define internal i32 @f() {
; CHECK-NEXT:    ret i32 poison
;
  ret i32 42
}

declare ptr @__cxa_begin_catch(ptr) nounwind

declare void @__cxa_end_catch()

declare i32 @__gxx_personality_v0(...)