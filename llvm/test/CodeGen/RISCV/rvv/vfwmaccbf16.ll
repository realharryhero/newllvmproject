; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: sed 's/iXLen/i32/g' %s | llc -mtriple=riscv32 -mattr=+v,+zfbfmin,+zvfbfwma\
; RUN:   -verify-machineinstrs -target-abi=ilp32d | FileCheck %s
; RUN: sed 's/iXLen/i64/g' %s | llc -mtriple=riscv64 -mattr=+v,+zfbfmin,+zvfbfwma \
; RUN:   -verify-machineinstrs -target-abi=lp64d | FileCheck %s

declare <vscale x 1 x float> @llvm.riscv.vfwmaccbf16.nxv1f32.nxv1bf16(
  <vscale x 1 x float>,
  <vscale x 1 x bfloat>,
  <vscale x 1 x bfloat>,
  iXLen, iXLen, iXLen);

define <vscale x 1 x float>  @intrinsic_vfwmaccbf16_vv_nxv1f32_nxv1bf16_nxv1bf16(<vscale x 1 x float> %0, <vscale x 1 x bfloat> %1, <vscale x 1 x bfloat> %2, iXLen %3) nounwind {
; CHECK-LABEL: intrinsic_vfwmaccbf16_vv_nxv1f32_nxv1bf16_nxv1bf16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, mf4, tu, ma
; CHECK-NEXT:    vfwmaccbf16.vv v8, v9, v10
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 1 x float> @llvm.riscv.vfwmaccbf16.nxv1f32.nxv1bf16(
    <vscale x 1 x float> %0,
    <vscale x 1 x bfloat> %1,
    <vscale x 1 x bfloat> %2,
    iXLen 7, iXLen %3, iXLen 0)

  ret <vscale x 1 x float> %a
}

declare <vscale x 1 x float> @llvm.riscv.vfwmaccbf16.mask.nxv1f32.nxv1bf16(
  <vscale x 1 x float>,
  <vscale x 1 x bfloat>,
  <vscale x 1 x bfloat>,
  <vscale x 1 x i1>,
  iXLen, iXLen, iXLen);

define <vscale x 1 x float>  @intrinsic_vfwmaccbf16_mask_vv_nxv1f32_nxv1bf16_nxv1bf16(<vscale x 1 x float> %0, <vscale x 1 x bfloat> %1, <vscale x 1 x bfloat> %2, <vscale x 1 x i1> %3, iXLen %4) nounwind {
; CHECK-LABEL: intrinsic_vfwmaccbf16_mask_vv_nxv1f32_nxv1bf16_nxv1bf16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, mf4, tu, mu
; CHECK-NEXT:    vfwmaccbf16.vv v8, v9, v10, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 1 x float> @llvm.riscv.vfwmaccbf16.mask.nxv1f32.nxv1bf16(
    <vscale x 1 x float> %0,
    <vscale x 1 x bfloat> %1,
    <vscale x 1 x bfloat> %2,
    <vscale x 1 x i1> %3,
    iXLen 7, iXLen %4, iXLen 0)

  ret <vscale x 1 x float> %a
}

declare <vscale x 2 x float> @llvm.riscv.vfwmaccbf16.nxv2f32.nxv2bf16(
  <vscale x 2 x float>,
  <vscale x 2 x bfloat>,
  <vscale x 2 x bfloat>,
  iXLen, iXLen, iXLen);

define <vscale x 2 x float>  @intrinsic_vfwmaccbf16_vv_nxv2f32_nxv2bf16_nxv2bf16(<vscale x 2 x float> %0, <vscale x 2 x bfloat> %1, <vscale x 2 x bfloat> %2, iXLen %3) nounwind {
; CHECK-LABEL: intrinsic_vfwmaccbf16_vv_nxv2f32_nxv2bf16_nxv2bf16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, mf2, tu, ma
; CHECK-NEXT:    vfwmaccbf16.vv v8, v9, v10
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 2 x float> @llvm.riscv.vfwmaccbf16.nxv2f32.nxv2bf16(
    <vscale x 2 x float> %0,
    <vscale x 2 x bfloat> %1,
    <vscale x 2 x bfloat> %2,
    iXLen 7, iXLen %3, iXLen 0)

  ret <vscale x 2 x float> %a
}

declare <vscale x 2 x float> @llvm.riscv.vfwmaccbf16.mask.nxv2f32.nxv2bf16(
  <vscale x 2 x float>,
  <vscale x 2 x bfloat>,
  <vscale x 2 x bfloat>,
  <vscale x 2 x i1>,
  iXLen, iXLen, iXLen);

define <vscale x 2 x float>  @intrinsic_vfwmaccbf16_mask_vv_nxv2f32_nxv2bf16_nxv2bf16(<vscale x 2 x float> %0, <vscale x 2 x bfloat> %1, <vscale x 2 x bfloat> %2, <vscale x 2 x i1> %3, iXLen %4) nounwind {
; CHECK-LABEL: intrinsic_vfwmaccbf16_mask_vv_nxv2f32_nxv2bf16_nxv2bf16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, mf2, tu, mu
; CHECK-NEXT:    vfwmaccbf16.vv v8, v9, v10, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 2 x float> @llvm.riscv.vfwmaccbf16.mask.nxv2f32.nxv2bf16(
    <vscale x 2 x float> %0,
    <vscale x 2 x bfloat> %1,
    <vscale x 2 x bfloat> %2,
    <vscale x 2 x i1> %3,
    iXLen 7, iXLen %4, iXLen 0)

  ret <vscale x 2 x float> %a
}

declare <vscale x 4 x float> @llvm.riscv.vfwmaccbf16.nxv4f32.nxv4bf16(
  <vscale x 4 x float>,
  <vscale x 4 x bfloat>,
  <vscale x 4 x bfloat>,
  iXLen, iXLen, iXLen);

define <vscale x 4 x float>  @intrinsic_vfwmaccbf16_vv_nxv4f32_nxv4bf16_nxv4bf16(<vscale x 4 x float> %0, <vscale x 4 x bfloat> %1, <vscale x 4 x bfloat> %2, iXLen %3) nounwind {
; CHECK-LABEL: intrinsic_vfwmaccbf16_vv_nxv4f32_nxv4bf16_nxv4bf16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m1, tu, ma
; CHECK-NEXT:    vfwmaccbf16.vv v8, v10, v11
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 4 x float> @llvm.riscv.vfwmaccbf16.nxv4f32.nxv4bf16(
    <vscale x 4 x float> %0,
    <vscale x 4 x bfloat> %1,
    <vscale x 4 x bfloat> %2,
    iXLen 7, iXLen %3, iXLen 0)

  ret <vscale x 4 x float> %a
}

declare <vscale x 4 x float> @llvm.riscv.vfwmaccbf16.mask.nxv4f32.nxv4bf16(
  <vscale x 4 x float>,
  <vscale x 4 x bfloat>,
  <vscale x 4 x bfloat>,
  <vscale x 4 x i1>,
  iXLen, iXLen, iXLen);

define <vscale x 4 x float>  @intrinsic_vfwmaccbf16_mask_vv_nxv4f32_nxv4bf16_nxv4bf16(<vscale x 4 x float> %0, <vscale x 4 x bfloat> %1, <vscale x 4 x bfloat> %2, <vscale x 4 x i1> %3, iXLen %4) nounwind {
; CHECK-LABEL: intrinsic_vfwmaccbf16_mask_vv_nxv4f32_nxv4bf16_nxv4bf16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m1, tu, mu
; CHECK-NEXT:    vfwmaccbf16.vv v8, v10, v11, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 4 x float> @llvm.riscv.vfwmaccbf16.mask.nxv4f32.nxv4bf16(
    <vscale x 4 x float> %0,
    <vscale x 4 x bfloat> %1,
    <vscale x 4 x bfloat> %2,
    <vscale x 4 x i1> %3,
    iXLen 7, iXLen %4, iXLen 0)

  ret <vscale x 4 x float> %a
}

declare <vscale x 8 x float> @llvm.riscv.vfwmaccbf16.nxv8f32.nxv8bf16(
  <vscale x 8 x float>,
  <vscale x 8 x bfloat>,
  <vscale x 8 x bfloat>,
  iXLen, iXLen, iXLen);

define <vscale x 8 x float>  @intrinsic_vfwmaccbf16_vv_nxv8f32_nxv8bf16_nxv8bf16(<vscale x 8 x float> %0, <vscale x 8 x bfloat> %1, <vscale x 8 x bfloat> %2, iXLen %3) nounwind {
; CHECK-LABEL: intrinsic_vfwmaccbf16_vv_nxv8f32_nxv8bf16_nxv8bf16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m2, tu, ma
; CHECK-NEXT:    vfwmaccbf16.vv v8, v12, v14
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 8 x float> @llvm.riscv.vfwmaccbf16.nxv8f32.nxv8bf16(
    <vscale x 8 x float> %0,
    <vscale x 8 x bfloat> %1,
    <vscale x 8 x bfloat> %2,
    iXLen 7, iXLen %3, iXLen 0)

  ret <vscale x 8 x float> %a
}

declare <vscale x 8 x float> @llvm.riscv.vfwmaccbf16.mask.nxv8f32.nxv8bf16(
  <vscale x 8 x float>,
  <vscale x 8 x bfloat>,
  <vscale x 8 x bfloat>,
  <vscale x 8 x i1>,
  iXLen, iXLen, iXLen);

define <vscale x 8 x float>  @intrinsic_vfwmaccbf16_mask_vv_nxv8f32_nxv8bf16_nxv8bf16(<vscale x 8 x float> %0, <vscale x 8 x bfloat> %1, <vscale x 8 x bfloat> %2, <vscale x 8 x i1> %3, iXLen %4) nounwind {
; CHECK-LABEL: intrinsic_vfwmaccbf16_mask_vv_nxv8f32_nxv8bf16_nxv8bf16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m2, tu, mu
; CHECK-NEXT:    vfwmaccbf16.vv v8, v12, v14, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 8 x float> @llvm.riscv.vfwmaccbf16.mask.nxv8f32.nxv8bf16(
    <vscale x 8 x float> %0,
    <vscale x 8 x bfloat> %1,
    <vscale x 8 x bfloat> %2,
    <vscale x 8 x i1> %3,
    iXLen 7, iXLen %4, iXLen 0)

  ret <vscale x 8 x float> %a
}

declare <vscale x 16 x float> @llvm.riscv.vfwmaccbf16.nxv16f32.nxv16bf16(
  <vscale x 16 x float>,
  <vscale x 16 x bfloat>,
  <vscale x 16 x bfloat>,
  iXLen, iXLen, iXLen);

define <vscale x 16 x float>  @intrinsic_vfwmaccbf16_vv_nxv16f32_nxv16bf16_nxv16bf16(<vscale x 16 x float> %0, <vscale x 16 x bfloat> %1, <vscale x 16 x bfloat> %2, iXLen %3) nounwind {
; CHECK-LABEL: intrinsic_vfwmaccbf16_vv_nxv16f32_nxv16bf16_nxv16bf16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m4, tu, ma
; CHECK-NEXT:    vfwmaccbf16.vv v8, v16, v20
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 16 x float> @llvm.riscv.vfwmaccbf16.nxv16f32.nxv16bf16(
    <vscale x 16 x float> %0,
    <vscale x 16 x bfloat> %1,
    <vscale x 16 x bfloat> %2,
    iXLen 7, iXLen %3, iXLen 0)

  ret <vscale x 16 x float> %a
}

declare <vscale x 16 x float> @llvm.riscv.vfwmaccbf16.mask.nxv16f32.nxv16bf16(
  <vscale x 16 x float>,
  <vscale x 16 x bfloat>,
  <vscale x 16 x bfloat>,
  <vscale x 16 x i1>,
  iXLen, iXLen, iXLen);

define <vscale x 16 x float>  @intrinsic_vfwmaccbf16_mask_vv_nxv16f32_nxv16bf16_nxv16bf16(<vscale x 16 x float> %0, <vscale x 16 x bfloat> %1, <vscale x 16 x bfloat> %2, <vscale x 16 x i1> %3, iXLen %4) nounwind {
; CHECK-LABEL: intrinsic_vfwmaccbf16_mask_vv_nxv16f32_nxv16bf16_nxv16bf16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m4, tu, mu
; CHECK-NEXT:    vfwmaccbf16.vv v8, v16, v20, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 16 x float> @llvm.riscv.vfwmaccbf16.mask.nxv16f32.nxv16bf16(
    <vscale x 16 x float> %0,
    <vscale x 16 x bfloat> %1,
    <vscale x 16 x bfloat> %2,
    <vscale x 16 x i1> %3,
    iXLen 7, iXLen %4, iXLen 0)

  ret <vscale x 16 x float> %a
}

declare <vscale x 1 x float> @llvm.riscv.vfwmaccbf16.nxv1f32.bf16(
  <vscale x 1 x float>,
  bfloat,
  <vscale x 1 x bfloat>,
  iXLen, iXLen, iXLen);

define <vscale x 1 x float>  @intrinsic_vfwmaccbf16_vf_nxv1f32_bf16_nxv1bf16(<vscale x 1 x float> %0, bfloat %1, <vscale x 1 x bfloat> %2, iXLen %3) nounwind {
; CHECK-LABEL: intrinsic_vfwmaccbf16_vf_nxv1f32_bf16_nxv1bf16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, mf4, tu, ma
; CHECK-NEXT:    vfwmaccbf16.vf v8, fa0, v9
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 1 x float> @llvm.riscv.vfwmaccbf16.nxv1f32.bf16(
    <vscale x 1 x float> %0,
    bfloat %1,
    <vscale x 1 x bfloat> %2,
    iXLen 7, iXLen %3, iXLen 0)

  ret <vscale x 1 x float> %a
}

declare <vscale x 1 x float> @llvm.riscv.vfwmaccbf16.mask.nxv1f32.bf16(
  <vscale x 1 x float>,
  bfloat,
  <vscale x 1 x bfloat>,
  <vscale x 1 x i1>,
  iXLen, iXLen, iXLen);

define <vscale x 1 x float> @intrinsic_vfwmaccbf16_mask_vf_nxv1f32_bf16_nxv1bf16(<vscale x 1 x float> %0, bfloat %1, <vscale x 1 x bfloat> %2, <vscale x 1 x i1> %3, iXLen %4) nounwind {
; CHECK-LABEL: intrinsic_vfwmaccbf16_mask_vf_nxv1f32_bf16_nxv1bf16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, mf4, tu, mu
; CHECK-NEXT:    vfwmaccbf16.vf v8, fa0, v9, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 1 x float> @llvm.riscv.vfwmaccbf16.mask.nxv1f32.bf16(
    <vscale x 1 x float> %0,
    bfloat %1,
    <vscale x 1 x bfloat> %2,
    <vscale x 1 x i1> %3,
    iXLen 7, iXLen %4, iXLen 0)

  ret <vscale x 1 x float> %a
}

declare <vscale x 2 x float> @llvm.riscv.vfwmaccbf16.nxv2f32.bf16(
  <vscale x 2 x float>,
  bfloat,
  <vscale x 2 x bfloat>,
  iXLen, iXLen, iXLen);

define <vscale x 2 x float>  @intrinsic_vfwmaccbf16_vf_nxv2f32_bf16_nxv2bf16(<vscale x 2 x float> %0, bfloat %1, <vscale x 2 x bfloat> %2, iXLen %3) nounwind {
; CHECK-LABEL: intrinsic_vfwmaccbf16_vf_nxv2f32_bf16_nxv2bf16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, mf2, tu, ma
; CHECK-NEXT:    vfwmaccbf16.vf v8, fa0, v9
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 2 x float> @llvm.riscv.vfwmaccbf16.nxv2f32.bf16(
    <vscale x 2 x float> %0,
    bfloat %1,
    <vscale x 2 x bfloat> %2,
    iXLen 7, iXLen %3, iXLen 0)

  ret <vscale x 2 x float> %a
}

declare <vscale x 2 x float> @llvm.riscv.vfwmaccbf16.mask.nxv2f32.bf16(
  <vscale x 2 x float>,
  bfloat,
  <vscale x 2 x bfloat>,
  <vscale x 2 x i1>,
  iXLen, iXLen, iXLen);

define <vscale x 2 x float> @intrinsic_vfwmaccbf16_mask_vf_nxv2f32_bf16_nxv2bf16(<vscale x 2 x float> %0, bfloat %1, <vscale x 2 x bfloat> %2, <vscale x 2 x i1> %3, iXLen %4) nounwind {
; CHECK-LABEL: intrinsic_vfwmaccbf16_mask_vf_nxv2f32_bf16_nxv2bf16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, mf2, tu, mu
; CHECK-NEXT:    vfwmaccbf16.vf v8, fa0, v9, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 2 x float> @llvm.riscv.vfwmaccbf16.mask.nxv2f32.bf16(
    <vscale x 2 x float> %0,
    bfloat %1,
    <vscale x 2 x bfloat> %2,
    <vscale x 2 x i1> %3,
    iXLen 7, iXLen %4, iXLen 0)

  ret <vscale x 2 x float> %a
}

declare <vscale x 4 x float> @llvm.riscv.vfwmaccbf16.nxv4f32.bf16(
  <vscale x 4 x float>,
  bfloat,
  <vscale x 4 x bfloat>,
  iXLen, iXLen, iXLen);

define <vscale x 4 x float>  @intrinsic_vfwmaccbf16_vf_nxv4f32_bf16_nxv4bf16(<vscale x 4 x float> %0, bfloat %1, <vscale x 4 x bfloat> %2, iXLen %3) nounwind {
; CHECK-LABEL: intrinsic_vfwmaccbf16_vf_nxv4f32_bf16_nxv4bf16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m1, tu, ma
; CHECK-NEXT:    vfwmaccbf16.vf v8, fa0, v10
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 4 x float> @llvm.riscv.vfwmaccbf16.nxv4f32.bf16(
    <vscale x 4 x float> %0,
    bfloat %1,
    <vscale x 4 x bfloat> %2,
    iXLen 7, iXLen %3, iXLen 0)

  ret <vscale x 4 x float> %a
}

declare <vscale x 4 x float> @llvm.riscv.vfwmaccbf16.mask.nxv4f32.bf16(
  <vscale x 4 x float>,
  bfloat,
  <vscale x 4 x bfloat>,
  <vscale x 4 x i1>,
  iXLen, iXLen, iXLen);

define <vscale x 4 x float> @intrinsic_vfwmaccbf16_mask_vf_nxv4f32_bf16_nxv4bf16(<vscale x 4 x float> %0, bfloat %1, <vscale x 4 x bfloat> %2, <vscale x 4 x i1> %3, iXLen %4) nounwind {
; CHECK-LABEL: intrinsic_vfwmaccbf16_mask_vf_nxv4f32_bf16_nxv4bf16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m1, tu, mu
; CHECK-NEXT:    vfwmaccbf16.vf v8, fa0, v10, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 4 x float> @llvm.riscv.vfwmaccbf16.mask.nxv4f32.bf16(
    <vscale x 4 x float> %0,
    bfloat %1,
    <vscale x 4 x bfloat> %2,
    <vscale x 4 x i1> %3,
    iXLen 7, iXLen %4, iXLen 0)

  ret <vscale x 4 x float> %a
}

declare <vscale x 8 x float> @llvm.riscv.vfwmaccbf16.nxv8f32.bf16(
  <vscale x 8 x float>,
  bfloat,
  <vscale x 8 x bfloat>,
  iXLen, iXLen, iXLen);

define <vscale x 8 x float>  @intrinsic_vfwmaccbf16_vf_nxv8f32_bf16_nxv8bf16(<vscale x 8 x float> %0, bfloat %1, <vscale x 8 x bfloat> %2, iXLen %3) nounwind {
; CHECK-LABEL: intrinsic_vfwmaccbf16_vf_nxv8f32_bf16_nxv8bf16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m2, tu, ma
; CHECK-NEXT:    vfwmaccbf16.vf v8, fa0, v12
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 8 x float> @llvm.riscv.vfwmaccbf16.nxv8f32.bf16(
    <vscale x 8 x float> %0,
    bfloat %1,
    <vscale x 8 x bfloat> %2,
    iXLen 7, iXLen %3, iXLen 0)

  ret <vscale x 8 x float> %a
}

declare <vscale x 8 x float> @llvm.riscv.vfwmaccbf16.mask.nxv8f32.bf16(
  <vscale x 8 x float>,
  bfloat,
  <vscale x 8 x bfloat>,
  <vscale x 8 x i1>,
  iXLen, iXLen, iXLen);

define <vscale x 8 x float> @intrinsic_vfwmaccbf16_mask_vf_nxv8f32_bf16_nxv8bf16(<vscale x 8 x float> %0, bfloat %1, <vscale x 8 x bfloat> %2, <vscale x 8 x i1> %3, iXLen %4) nounwind {
; CHECK-LABEL: intrinsic_vfwmaccbf16_mask_vf_nxv8f32_bf16_nxv8bf16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m2, tu, mu
; CHECK-NEXT:    vfwmaccbf16.vf v8, fa0, v12, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 8 x float> @llvm.riscv.vfwmaccbf16.mask.nxv8f32.bf16(
    <vscale x 8 x float> %0,
    bfloat %1,
    <vscale x 8 x bfloat> %2,
    <vscale x 8 x i1> %3,
    iXLen 7, iXLen %4, iXLen 0)

  ret <vscale x 8 x float> %a
}

declare <vscale x 16 x float> @llvm.riscv.vfwmaccbf16.nxv16f32.bf16(
  <vscale x 16 x float>,
  bfloat,
  <vscale x 16 x bfloat>,
  iXLen, iXLen, iXLen);

define <vscale x 16 x float>  @intrinsic_vfwmaccbf16_vf_nxv16f32_bf16_nxv16bf16(<vscale x 16 x float> %0, bfloat %1, <vscale x 16 x bfloat> %2, iXLen %3) nounwind {
; CHECK-LABEL: intrinsic_vfwmaccbf16_vf_nxv16f32_bf16_nxv16bf16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m4, tu, ma
; CHECK-NEXT:    vfwmaccbf16.vf v8, fa0, v16
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 16 x float> @llvm.riscv.vfwmaccbf16.nxv16f32.bf16(
    <vscale x 16 x float> %0,
    bfloat %1,
    <vscale x 16 x bfloat> %2,
    iXLen 7, iXLen %3, iXLen 0)

  ret <vscale x 16 x float> %a
}

declare <vscale x 16 x float> @llvm.riscv.vfwmaccbf16.mask.nxv16f32.bf16(
  <vscale x 16 x float>,
  bfloat,
  <vscale x 16 x bfloat>,
  <vscale x 16 x i1>,
  iXLen, iXLen, iXLen);

define <vscale x 16 x float> @intrinsic_vfwmaccbf16_mask_vf_nxv16f32_bf16_nxv16bf16(<vscale x 16 x float> %0, bfloat %1, <vscale x 16 x bfloat> %2, <vscale x 16 x i1> %3, iXLen %4) nounwind {
; CHECK-LABEL: intrinsic_vfwmaccbf16_mask_vf_nxv16f32_bf16_nxv16bf16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m4, tu, mu
; CHECK-NEXT:    vfwmaccbf16.vf v8, fa0, v16, v0.t
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 16 x float> @llvm.riscv.vfwmaccbf16.mask.nxv16f32.bf16(
    <vscale x 16 x float> %0,
    bfloat %1,
    <vscale x 16 x bfloat> %2,
    <vscale x 16 x i1> %3,
    iXLen 7, iXLen %4, iXLen 0)

  ret <vscale x 16 x float> %a
}