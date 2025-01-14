; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --version 5
; RUN: llc < %s -mtriple=aarch64 -mattr=+sve2 | FileCheck %s --check-prefixes=CHECK
; RUN: llc < %s -mtriple=aarch64 -mattr=+sve2 -pass-remarks-analysis=stack-frame-layout 2>&1 >/dev/null | FileCheck %s --check-prefixes=CHECK-FRAMELAYOUT

; CHECK-FRAMELAYOUT-LABEL: Function: csr_d8_allocnxv4i32i32f64
; CHECK-FRAMELAYOUT-NEXT: Offset: [SP-8], Type: Spill, Align: 8, Size: 8
; CHECK-FRAMELAYOUT-NEXT: Offset: [SP-16], Type: Variable, Align: 16, Size: 16
; CHECK-FRAMELAYOUT-NEXT: Offset: [SP-16], Type: Spill, Align: 8, Size: 8
; CHECK-FRAMELAYOUT-NEXT: Offset: [SP-20], Type: Variable, Align: 4, Size: 4
; CHECK-FRAMELAYOUT-NEXT: Offset: [SP-32], Type: Variable, Align: 8, Size: 8

define i32 @csr_d8_allocnxv4i32i32f64(double %d) "aarch64_pstate_sm_compatible" {
; CHECK-LABEL: csr_d8_allocnxv4i32i32f64:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    str d8, [sp, #-16]! // 8-byte Folded Spill
; CHECK-NEXT:    str x29, [sp, #8] // 8-byte Folded Spill
; CHECK-NEXT:    sub sp, sp, #16
; CHECK-NEXT:    addvl sp, sp, #-1
; CHECK-NEXT:    .cfi_escape 0x0f, 0x0c, 0x8f, 0x00, 0x11, 0x20, 0x22, 0x11, 0x08, 0x92, 0x2e, 0x00, 0x1e, 0x22 // sp + 32 + 8 * VG
; CHECK-NEXT:    .cfi_offset w29, -8
; CHECK-NEXT:    .cfi_offset b8, -16
; CHECK-NEXT:    mov z1.s, #0 // =0x0
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    add x8, sp, #16
; CHECK-NEXT:    mov w0, wzr
; CHECK-NEXT:    //APP
; CHECK-NEXT:    //NO_APP
; CHECK-NEXT:    str wzr, [sp, #12]
; CHECK-NEXT:    str d0, [sp]
; CHECK-NEXT:    st1w { z1.s }, p0, [x8]
; CHECK-NEXT:    addvl sp, sp, #1
; CHECK-NEXT:    add sp, sp, #16
; CHECK-NEXT:    ldr x29, [sp, #8] // 8-byte Folded Reload
; CHECK-NEXT:    ldr d8, [sp], #16 // 8-byte Folded Reload
; CHECK-NEXT:    ret
entry:
  %a = alloca <vscale x 4 x i32>
  %b = alloca i32
  %c = alloca double
  tail call void asm sideeffect "", "~{d8}"() #1
  store <vscale x 4 x i32> zeroinitializer, ptr %a
  store i32 zeroinitializer, ptr %b
  store double %d, ptr %c
  ret i32 0
}

; CHECK-FRAMELAYOUT-LABEL: Function: csr_d8_allocnxv4i32i32f64_fp
; CHECK-FRAMELAYOUT-NEXT: Offset: [SP-8], Type: Spill, Align: 8, Size: 8
; CHECK-FRAMELAYOUT-NEXT: Offset: [SP-16], Type: Variable, Align: 16, Size: 16
; CHECK-FRAMELAYOUT-NEXT: Offset: [SP-16], Type: Spill, Align: 8, Size: 8
; CHECK-FRAMELAYOUT-NEXT: Offset: [SP-20], Type: Variable, Align: 4, Size: 4
; CHECK-FRAMELAYOUT-NEXT: Offset: [SP-32], Type: Spill, Align: 16, Size: 8
; CHECK-FRAMELAYOUT-NEXT: Offset: [SP-40], Type: Variable, Align: 8, Size: 8

define i32 @csr_d8_allocnxv4i32i32f64_fp(double %d) "aarch64_pstate_sm_compatible" "frame-pointer"="all" {
; CHECK-LABEL: csr_d8_allocnxv4i32i32f64_fp:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    str d8, [sp, #-32]! // 8-byte Folded Spill
; CHECK-NEXT:    stp x29, x30, [sp, #16] // 16-byte Folded Spill
; CHECK-NEXT:    add x29, sp, #16
; CHECK-NEXT:    sub sp, sp, #16
; CHECK-NEXT:    addvl sp, sp, #-1
; CHECK-NEXT:    .cfi_def_cfa w29, 16
; CHECK-NEXT:    .cfi_offset w30, -8
; CHECK-NEXT:    .cfi_offset w29, -16
; CHECK-NEXT:    .cfi_offset b8, -32
; CHECK-NEXT:    mov z1.s, #0 // =0x0
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    addvl x8, sp, #1
; CHECK-NEXT:    //APP
; CHECK-NEXT:    //NO_APP
; CHECK-NEXT:    str wzr, [x8, #28]
; CHECK-NEXT:    sub x8, x29, #16
; CHECK-NEXT:    mov w0, wzr
; CHECK-NEXT:    str d0, [sp, #8]
; CHECK-NEXT:    st1w { z1.s }, p0, [x8, #-1, mul vl]
; CHECK-NEXT:    addvl sp, sp, #1
; CHECK-NEXT:    add sp, sp, #16
; CHECK-NEXT:    ldp x29, x30, [sp, #16] // 16-byte Folded Reload
; CHECK-NEXT:    ldr d8, [sp], #32 // 8-byte Folded Reload
; CHECK-NEXT:    ret
entry:
  %a = alloca <vscale x 4 x i32>
  %b = alloca i32
  %c = alloca double
  tail call void asm sideeffect "", "~{d8}"() #1
  store <vscale x 4 x i32> zeroinitializer, ptr %a
  store i32 zeroinitializer, ptr %b
  store double %d, ptr %c
  ret i32 0
}

; CHECK-FRAMELAYOUT-LABEL: Function: svecc_z8_allocnxv4i32i32f64_fp
; CHECK-FRAMELAYOUT-NEXT: Offset: [SP-8], Type: Spill, Align: 8, Size: 8
; CHECK-FRAMELAYOUT-NEXT: Offset: [SP-16], Type: Spill, Align: 16, Size: 16
; CHECK-FRAMELAYOUT-NEXT: Offset: [SP-16], Type: Spill, Align: 8, Size: 8
; CHECK-FRAMELAYOUT-NEXT: Offset: [SP-20], Type: Variable, Align: 4, Size: 4
; CHECK-FRAMELAYOUT-NEXT: Offset: [SP-32], Type: Variable, Align: 16, Size: 16
; CHECK-FRAMELAYOUT-NEXT: Offset: [SP-32], Type: Variable, Align: 8, Size: 8

define i32 @svecc_z8_allocnxv4i32i32f64_fp(double %d, <vscale x 4 x i32> %v) "aarch64_pstate_sm_compatible" "frame-pointer"="all" {
; CHECK-LABEL: svecc_z8_allocnxv4i32i32f64_fp:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    stp x29, x30, [sp, #-16]! // 16-byte Folded Spill
; CHECK-NEXT:    mov x29, sp
; CHECK-NEXT:    addvl sp, sp, #-1
; CHECK-NEXT:    str z8, [sp] // 16-byte Folded Spill
; CHECK-NEXT:    sub sp, sp, #16
; CHECK-NEXT:    addvl sp, sp, #-1
; CHECK-NEXT:    .cfi_def_cfa w29, 16
; CHECK-NEXT:    .cfi_offset w30, -8
; CHECK-NEXT:    .cfi_offset w29, -16
; CHECK-NEXT:    .cfi_escape 0x10, 0x48, 0x0a, 0x11, 0x70, 0x22, 0x11, 0x78, 0x92, 0x2e, 0x00, 0x1e, 0x22 // $d8 @ cfa - 16 - 8 * VG
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    mov w0, wzr
; CHECK-NEXT:    //APP
; CHECK-NEXT:    //NO_APP
; CHECK-NEXT:    str wzr, [sp, #12]
; CHECK-NEXT:    st1w { z1.s }, p0, [x29, #-2, mul vl]
; CHECK-NEXT:    str d0, [sp], #16
; CHECK-NEXT:    addvl sp, sp, #1
; CHECK-NEXT:    ldr z8, [sp] // 16-byte Folded Reload
; CHECK-NEXT:    addvl sp, sp, #1
; CHECK-NEXT:    ldp x29, x30, [sp], #16 // 16-byte Folded Reload
; CHECK-NEXT:    ret
entry:
  %a = alloca <vscale x 4 x i32>
  %b = alloca i32
  %c = alloca double
  tail call void asm sideeffect "", "~{d8}"() #1
  store <vscale x 4 x i32> %v, ptr %a
  store i32 zeroinitializer, ptr %b
  store double %d, ptr %c
  ret i32 0
}
