; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=aarch64-linux-gnu -mattr=+sme2 -force-streaming -verify-machineinstrs < %s | FileCheck %s

; == 8 to 64-bit elements ==

define { <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8> } @uzp_x4_i8(<vscale x 16 x i8> %unused, <vscale x 16 x i8> %zn1, <vscale x 16 x i8> %zn2, <vscale x 16 x i8> %zn3, <vscale x 16 x i8> %zn4) nounwind {
; CHECK-LABEL: uzp_x4_i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z7.d, z4.d
; CHECK-NEXT:    mov z6.d, z3.d
; CHECK-NEXT:    mov z5.d, z2.d
; CHECK-NEXT:    mov z4.d, z1.d
; CHECK-NEXT:    uzp { z0.b - z3.b }, { z4.b - z7.b }
; CHECK-NEXT:    ret
  %res = call { <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8> } @llvm.aarch64.sve.uzp.x4.nxv16i8(<vscale x 16 x i8> %zn1, <vscale x 16 x i8> %zn2, <vscale x 16 x i8> %zn3, <vscale x 16 x i8> %zn4)
  ret { <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8> } %res
}

define { <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16> } @uzp_x4_i16(<vscale x 8 x i16> %unused, <vscale x 8 x i16> %zn1, <vscale x 8 x i16> %zn2, <vscale x 8 x i16> %zn3, <vscale x 8 x i16> %zn4) nounwind {
; CHECK-LABEL: uzp_x4_i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z7.d, z4.d
; CHECK-NEXT:    mov z6.d, z3.d
; CHECK-NEXT:    mov z5.d, z2.d
; CHECK-NEXT:    mov z4.d, z1.d
; CHECK-NEXT:    uzp { z0.h - z3.h }, { z4.h - z7.h }
; CHECK-NEXT:    ret
  %res = call { <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16> } @llvm.aarch64.sve.uzp.x4.nxv8i16(<vscale x 8 x i16> %zn1, <vscale x 8 x i16> %zn2, <vscale x 8 x i16> %zn3, <vscale x 8 x i16> %zn4)
  ret { <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16> } %res
}

define { <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half> } @uzp_x4_f16(<vscale x 8 x half> %unused, <vscale x 8 x half> %zn1, <vscale x 8 x half> %zn2, <vscale x 8 x half> %zn3, <vscale x 8 x half> %zn4) nounwind {
; CHECK-LABEL: uzp_x4_f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z7.d, z4.d
; CHECK-NEXT:    mov z6.d, z3.d
; CHECK-NEXT:    mov z5.d, z2.d
; CHECK-NEXT:    mov z4.d, z1.d
; CHECK-NEXT:    uzp { z0.h - z3.h }, { z4.h - z7.h }
; CHECK-NEXT:    ret
  %res = call { <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half> } @llvm.aarch64.sve.uzp.x4.nxv8f16(<vscale x 8 x half> %zn1, <vscale x 8 x half> %zn2, <vscale x 8 x half> %zn3, <vscale x 8 x half> %zn4)
  ret { <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half> } %res
}

define { <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat> } @uzp_x4_bf16(<vscale x 8 x bfloat> %unused, <vscale x 8 x bfloat> %zn1, <vscale x 8 x bfloat> %zn2, <vscale x 8 x bfloat> %zn3, <vscale x 8 x bfloat> %zn4) nounwind {
; CHECK-LABEL: uzp_x4_bf16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z7.d, z4.d
; CHECK-NEXT:    mov z6.d, z3.d
; CHECK-NEXT:    mov z5.d, z2.d
; CHECK-NEXT:    mov z4.d, z1.d
; CHECK-NEXT:    uzp { z0.h - z3.h }, { z4.h - z7.h }
; CHECK-NEXT:    ret
  %res = call { <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat> } @llvm.aarch64.sve.uzp.x4.nxv8bf16(<vscale x 8 x bfloat> %zn1, <vscale x 8 x bfloat> %zn2, <vscale x 8 x bfloat> %zn3, <vscale x 8 x bfloat> %zn4)
  ret { <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat> } %res
}

define { <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32> } @uzp_x4_i32(<vscale x 4 x i32> %unused, <vscale x 4 x i32> %zn1, <vscale x 4 x i32> %zn2, <vscale x 4 x i32> %zn3, <vscale x 4 x i32> %zn4) nounwind {
; CHECK-LABEL: uzp_x4_i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z7.d, z4.d
; CHECK-NEXT:    mov z6.d, z3.d
; CHECK-NEXT:    mov z5.d, z2.d
; CHECK-NEXT:    mov z4.d, z1.d
; CHECK-NEXT:    uzp { z0.s - z3.s }, { z4.s - z7.s }
; CHECK-NEXT:    ret
  %res = call { <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32> } @llvm.aarch64.sve.uzp.x4.nxv4i32(<vscale x 4 x i32> %zn1, <vscale x 4 x i32> %zn2, <vscale x 4 x i32> %zn3, <vscale x 4 x i32> %zn4)
  ret { <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32> } %res
}

define { <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float> } @uzp_x4_f32(<vscale x 4 x float> %unused, <vscale x 4 x float> %zn1, <vscale x 4 x float> %zn2, <vscale x 4 x float> %zn3, <vscale x 4 x float> %zn4) nounwind {
; CHECK-LABEL: uzp_x4_f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z7.d, z4.d
; CHECK-NEXT:    mov z6.d, z3.d
; CHECK-NEXT:    mov z5.d, z2.d
; CHECK-NEXT:    mov z4.d, z1.d
; CHECK-NEXT:    uzp { z0.s - z3.s }, { z4.s - z7.s }
; CHECK-NEXT:    ret
  %res = call { <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float> } @llvm.aarch64.sve.uzp.x4.nxv4f32(<vscale x 4 x float> %zn1, <vscale x 4 x float> %zn2, <vscale x 4 x float> %zn3, <vscale x 4 x float> %zn4)
  ret { <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float> } %res
}

define { <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64> } @uzp_x4_i64(<vscale x 2 x i64> %unused, <vscale x 2 x i64> %zn1, <vscale x 2 x i64> %zn2, <vscale x 2 x i64> %zn3, <vscale x 2 x i64> %zn4) nounwind {
; CHECK-LABEL: uzp_x4_i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z7.d, z4.d
; CHECK-NEXT:    mov z6.d, z3.d
; CHECK-NEXT:    mov z5.d, z2.d
; CHECK-NEXT:    mov z4.d, z1.d
; CHECK-NEXT:    uzp { z0.d - z3.d }, { z4.d - z7.d }
; CHECK-NEXT:    ret
  %res = call { <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64> } @llvm.aarch64.sve.uzp.x4.nxv2i64(<vscale x 2 x i64> %zn1, <vscale x 2 x i64> %zn2, <vscale x 2 x i64> %zn3, <vscale x 2 x i64> %zn4)
  ret { <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64> } %res
}

define { <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double> } @uzp_x4_f64(<vscale x 4 x double> %unused, <vscale x 2 x double> %zn1, <vscale x 2 x double> %zn2, <vscale x 2 x double> %zn3, <vscale x 2 x double> %zn4) nounwind {
; CHECK-LABEL: uzp_x4_f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z27.d, z5.d
; CHECK-NEXT:    mov z26.d, z4.d
; CHECK-NEXT:    mov z25.d, z3.d
; CHECK-NEXT:    mov z24.d, z2.d
; CHECK-NEXT:    uzp { z0.d - z3.d }, { z24.d - z27.d }
; CHECK-NEXT:    ret
  %res = call { <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double> } @llvm.aarch64.sve.uzp.x4.nxv2f64(<vscale x 2 x double> %zn1, <vscale x 2 x double> %zn2, <vscale x 2 x double> %zn3, <vscale x 2 x double> %zn4)
  ret { <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double> } %res
}


; == 128-bit elements ==

define { <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8> } @zipq_x4_i8(<vscale x 16 x i8> %unused, <vscale x 16 x i8> %zn1, <vscale x 16 x i8> %zn2, <vscale x 16 x i8> %zn3, <vscale x 16 x i8> %zn4) nounwind {
; CHECK-LABEL: zipq_x4_i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z7.d, z4.d
; CHECK-NEXT:    mov z6.d, z3.d
; CHECK-NEXT:    mov z5.d, z2.d
; CHECK-NEXT:    mov z4.d, z1.d
; CHECK-NEXT:    uzp { z0.q - z3.q }, { z4.q - z7.q }
; CHECK-NEXT:    ret
  %res = call { <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8> } @llvm.aarch64.sve.uzpq.x4.nxv16i8(<vscale x 16 x i8> %zn1, <vscale x 16 x i8> %zn2, <vscale x 16 x i8> %zn3, <vscale x 16 x i8> %zn4)
  ret { <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8> } %res
}

define { <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16> } @zipq_x4_i16(<vscale x 8 x i16> %unused, <vscale x 8 x i16> %zn1, <vscale x 8 x i16> %zn2, <vscale x 8 x i16> %zn3, <vscale x 8 x i16> %zn4) nounwind {
; CHECK-LABEL: zipq_x4_i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z7.d, z4.d
; CHECK-NEXT:    mov z6.d, z3.d
; CHECK-NEXT:    mov z5.d, z2.d
; CHECK-NEXT:    mov z4.d, z1.d
; CHECK-NEXT:    uzp { z0.q - z3.q }, { z4.q - z7.q }
; CHECK-NEXT:    ret
  %res = call { <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16> } @llvm.aarch64.sve.uzpq.x4.nxv8i16(<vscale x 8 x i16> %zn1, <vscale x 8 x i16> %zn2, <vscale x 8 x i16> %zn3, <vscale x 8 x i16> %zn4)
  ret { <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16> } %res
}

define { <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half> } @zipq_x4_f16(<vscale x 8 x half> %unused, <vscale x 8 x half> %zn1, <vscale x 8 x half> %zn2, <vscale x 8 x half> %zn3, <vscale x 8 x half> %zn4) nounwind {
; CHECK-LABEL: zipq_x4_f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z7.d, z4.d
; CHECK-NEXT:    mov z6.d, z3.d
; CHECK-NEXT:    mov z5.d, z2.d
; CHECK-NEXT:    mov z4.d, z1.d
; CHECK-NEXT:    uzp { z0.q - z3.q }, { z4.q - z7.q }
; CHECK-NEXT:    ret
  %res = call { <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half> } @llvm.aarch64.sve.uzpq.x4.nxv8f16(<vscale x 8 x half> %zn1, <vscale x 8 x half> %zn2, <vscale x 8 x half> %zn3, <vscale x 8 x half> %zn4)
  ret { <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half> } %res
}

define { <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat> } @zipq_x4_bf16(<vscale x 8 x bfloat> %unused, <vscale x 8 x bfloat> %zn1, <vscale x 8 x bfloat> %zn2, <vscale x 8 x bfloat> %zn3, <vscale x 8 x bfloat> %zn4) nounwind {
; CHECK-LABEL: zipq_x4_bf16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z7.d, z4.d
; CHECK-NEXT:    mov z6.d, z3.d
; CHECK-NEXT:    mov z5.d, z2.d
; CHECK-NEXT:    mov z4.d, z1.d
; CHECK-NEXT:    uzp { z0.q - z3.q }, { z4.q - z7.q }
; CHECK-NEXT:    ret
  %res = call { <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat> } @llvm.aarch64.sve.uzpq.x4.nxv8bf16(<vscale x 8 x bfloat> %zn1, <vscale x 8 x bfloat> %zn2, <vscale x 8 x bfloat> %zn3, <vscale x 8 x bfloat> %zn4)
  ret { <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat> } %res
}

define { <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32> } @zipq_x4_i32(<vscale x 4 x i32> %unused, <vscale x 4 x i32> %zn1, <vscale x 4 x i32> %zn2, <vscale x 4 x i32> %zn3, <vscale x 4 x i32> %zn4) nounwind {
; CHECK-LABEL: zipq_x4_i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z7.d, z4.d
; CHECK-NEXT:    mov z6.d, z3.d
; CHECK-NEXT:    mov z5.d, z2.d
; CHECK-NEXT:    mov z4.d, z1.d
; CHECK-NEXT:    uzp { z0.q - z3.q }, { z4.q - z7.q }
; CHECK-NEXT:    ret
  %res = call { <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32> } @llvm.aarch64.sve.uzpq.x4.nxv4i32(<vscale x 4 x i32> %zn1, <vscale x 4 x i32> %zn2, <vscale x 4 x i32> %zn3, <vscale x 4 x i32> %zn4)
  ret { <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32> } %res
}

define { <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float> } @zipq_x4_f32(<vscale x 4 x float> %unused, <vscale x 4 x float> %zn1, <vscale x 4 x float> %zn2, <vscale x 4 x float> %zn3, <vscale x 4 x float> %zn4) nounwind {
; CHECK-LABEL: zipq_x4_f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z7.d, z4.d
; CHECK-NEXT:    mov z6.d, z3.d
; CHECK-NEXT:    mov z5.d, z2.d
; CHECK-NEXT:    mov z4.d, z1.d
; CHECK-NEXT:    uzp { z0.q - z3.q }, { z4.q - z7.q }
; CHECK-NEXT:    ret
  %res = call { <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float> } @llvm.aarch64.sve.uzpq.x4.nxv4f32(<vscale x 4 x float> %zn1, <vscale x 4 x float> %zn2, <vscale x 4 x float> %zn3, <vscale x 4 x float> %zn4)
  ret { <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float> } %res
}

define { <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64> } @zipq_x4_i64(<vscale x 2 x i64> %unused, <vscale x 2 x i64> %zn1, <vscale x 2 x i64> %zn2, <vscale x 2 x i64> %zn3, <vscale x 2 x i64> %zn4) nounwind {
; CHECK-LABEL: zipq_x4_i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z7.d, z4.d
; CHECK-NEXT:    mov z6.d, z3.d
; CHECK-NEXT:    mov z5.d, z2.d
; CHECK-NEXT:    mov z4.d, z1.d
; CHECK-NEXT:    uzp { z0.q - z3.q }, { z4.q - z7.q }
; CHECK-NEXT:    ret
  %res = call { <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64> } @llvm.aarch64.sve.uzpq.x4.nxv2i64(<vscale x 2 x i64> %zn1, <vscale x 2 x i64> %zn2, <vscale x 2 x i64> %zn3, <vscale x 2 x i64> %zn4)
  ret { <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64> } %res
}

define { <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double> } @zipq_x4_f64(<vscale x 4 x double> %unused, <vscale x 2 x double> %zn1, <vscale x 2 x double> %zn2, <vscale x 2 x double> %zn3, <vscale x 2 x double> %zn4) nounwind {
; CHECK-LABEL: zipq_x4_f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z27.d, z5.d
; CHECK-NEXT:    mov z26.d, z4.d
; CHECK-NEXT:    mov z25.d, z3.d
; CHECK-NEXT:    mov z24.d, z2.d
; CHECK-NEXT:    uzp { z0.q - z3.q }, { z24.q - z27.q }
; CHECK-NEXT:    ret
  %res = call { <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double> } @llvm.aarch64.sve.uzpq.x4.nxv2f64(<vscale x 2 x double> %zn1, <vscale x 2 x double> %zn2, <vscale x 2 x double> %zn3, <vscale x 2 x double> %zn4)
  ret { <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double> } %res
}


; == 8 to 64-bit elements ==
declare { <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8> } @llvm.aarch64.sve.uzp.x4.nxv16i8(<vscale x 16 x i8> %zn1, <vscale x 16 x i8> %zn2, <vscale x 16 x i8> %zn3, <vscale x 16 x i8> %zn4)
declare { <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16> } @llvm.aarch64.sve.uzp.x4.nxv8i16(<vscale x 8 x i16> %zn1, <vscale x 8 x i16> %zn2, <vscale x 8 x i16> %zn3, <vscale x 8 x i16> %zn4)
declare { <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32> } @llvm.aarch64.sve.uzp.x4.nxv4i32(<vscale x 4 x i32> %zn1, <vscale x 4 x i32> %zn2, <vscale x 4 x i32> %zn3, <vscale x 4 x i32> %zn4)
declare { <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64> } @llvm.aarch64.sve.uzp.x4.nxv2i64(<vscale x 2 x i64> %zn1, <vscale x 2 x i64> %zn2, <vscale x 2 x i64> %zn3, <vscale x 2 x i64> %zn4)
declare { <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half> } @llvm.aarch64.sve.uzp.x4.nxv8f16(<vscale x 8 x half> %zn1, <vscale x 8 x half> %zn2, <vscale x 8 x half> %zn3, <vscale x 8 x half> %zn4)
declare { <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat> } @llvm.aarch64.sve.uzp.x4.nxv8bf16(<vscale x 8 x bfloat> %zn1, <vscale x 8 x bfloat> %zn2, <vscale x 8 x bfloat> %zn3, <vscale x 8 x bfloat> %zn4)
declare { <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float> } @llvm.aarch64.sve.uzp.x4.nxv4f32(<vscale x 4 x float> %zn1, <vscale x 4 x float> %zn2, <vscale x 4 x float> %zn3, <vscale x 4 x float> %zn4)
declare { <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double> } @llvm.aarch64.sve.uzp.x4.nxv2f64(<vscale x 2 x double> %zn1, <vscale x 2 x double> %zn2, <vscale x 2 x double> %zn3, <vscale x 2 x double> %zn4)

; == 128-bit elements ==
declare { <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i8> } @llvm.aarch64.sve.uzpq.x4.nxv16i8(<vscale x 16 x i8> %zn1, <vscale x 16 x i8> %zn2, <vscale x 16 x i8> %zn3, <vscale x 16 x i8> %zn4)
declare { <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16> } @llvm.aarch64.sve.uzpq.x4.nxv8i16(<vscale x 8 x i16> %zn1, <vscale x 8 x i16> %zn2, <vscale x 8 x i16> %zn3, <vscale x 8 x i16> %zn4)
declare { <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i32> } @llvm.aarch64.sve.uzpq.x4.nxv4i32(<vscale x 4 x i32> %zn1, <vscale x 4 x i32> %zn2, <vscale x 4 x i32> %zn3, <vscale x 4 x i32> %zn4)
declare { <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i64> } @llvm.aarch64.sve.uzpq.x4.nxv2i64(<vscale x 2 x i64> %zn1, <vscale x 2 x i64> %zn2, <vscale x 2 x i64> %zn3, <vscale x 2 x i64> %zn4)
declare { <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x half> } @llvm.aarch64.sve.uzpq.x4.nxv8f16(<vscale x 8 x half> %zn1, <vscale x 8 x half> %zn2, <vscale x 8 x half> %zn3, <vscale x 8 x half> %zn4)
declare { <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat>, <vscale x 8 x bfloat> } @llvm.aarch64.sve.uzpq.x4.nxv8bf16(<vscale x 8 x bfloat> %zn1, <vscale x 8 x bfloat> %zn2, <vscale x 8 x bfloat> %zn3, <vscale x 8 x bfloat> %zn4)
declare { <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x float> } @llvm.aarch64.sve.uzpq.x4.nxv4f32(<vscale x 4 x float> %zn1, <vscale x 4 x float> %zn2, <vscale x 4 x float> %zn3, <vscale x 4 x float> %zn4)
declare { <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x double> } @llvm.aarch64.sve.uzpq.x4.nxv2f64(<vscale x 2 x double> %zn1, <vscale x 2 x double> %zn2, <vscale x 2 x double> %zn3, <vscale x 2 x double> %zn4)