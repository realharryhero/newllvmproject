// NOTE: Assertions have been autogenerated by utils/update_cc_test_checks.py
// RUN: %clang_cc1 -triple x86_64-linux-gnu -emit-llvm -o - %s | FileCheck %s

typedef struct { struct {} a; } empty;

// CHECK-LABEL: @_Z17empty_record_testiz(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[Z_ADDR:%.*]] = alloca i32, align 4
// CHECK-NEXT:    [[LIST:%.*]] = alloca [1 x %struct.__va_list_tag], align 16
// CHECK-NEXT:    store i32 [[Z:%.*]], ptr [[Z_ADDR]], align 4
// CHECK-NEXT:    [[ARRAYDECAY:%.*]] = getelementptr inbounds [1 x %struct.__va_list_tag], ptr [[LIST]], i64 0, i64 0
// CHECK-NEXT:    call void @llvm.va_start.p0(ptr [[ARRAYDECAY]])
// CHECK-NEXT:    [[ARRAYDECAY1:%.*]] = getelementptr inbounds [1 x %struct.__va_list_tag], ptr [[LIST]], i64 0, i64 0
// CHECK-NEXT:    ret void
//
empty empty_record_test(int z, ...) {
  __builtin_va_list list;
  __builtin_va_start(list, z);
  return __builtin_va_arg(list, empty);
}

typedef struct {
  struct{} a;
  double b;
} s1;

// CHECK-LABEL: @_Z1fiz(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[RETVAL:%.*]] = alloca [[STRUCT_S1:%.*]], align 8
// CHECK-NEXT:    [[Z_ADDR:%.*]] = alloca i32, align 4
// CHECK-NEXT:    [[LIST:%.*]] = alloca [1 x %struct.__va_list_tag], align 16
// CHECK-NEXT:    store i32 [[Z:%.*]], ptr [[Z_ADDR]], align 4
// CHECK-NEXT:    [[ARRAYDECAY:%.*]] = getelementptr inbounds [1 x %struct.__va_list_tag], ptr [[LIST]], i64 0, i64 0
// CHECK-NEXT:    call void @llvm.va_start.p0(ptr [[ARRAYDECAY]])
// CHECK-NEXT:    [[ARRAYDECAY1:%.*]] = getelementptr inbounds [1 x %struct.__va_list_tag], ptr [[LIST]], i64 0, i64 0
// CHECK-NEXT:    [[FP_OFFSET_P:%.*]] = getelementptr inbounds [[STRUCT___VA_LIST_TAG:%.*]], ptr [[ARRAYDECAY1]], i32 0, i32 1
// CHECK-NEXT:    [[FP_OFFSET:%.*]] = load i32, ptr [[FP_OFFSET_P]], align 4
// CHECK-NEXT:    [[FITS_IN_FP:%.*]] = icmp ule i32 [[FP_OFFSET]], 160
// CHECK-NEXT:    br i1 [[FITS_IN_FP]], label [[VAARG_IN_REG:%.*]], label [[VAARG_IN_MEM:%.*]]
// CHECK:       vaarg.in_reg:
// CHECK-NEXT:    [[TMP0:%.*]] = getelementptr inbounds [[STRUCT___VA_LIST_TAG]], ptr [[ARRAYDECAY1]], i32 0, i32 3
// CHECK-NEXT:    [[REG_SAVE_AREA:%.*]] = load ptr, ptr [[TMP0]], align 16
// CHECK-NEXT:    [[TMP1:%.*]] = getelementptr i8, ptr [[REG_SAVE_AREA]], i32 [[FP_OFFSET]]
// CHECK-NEXT:    [[TMP2:%.*]] = add i32 [[FP_OFFSET]], 16
// CHECK-NEXT:    store i32 [[TMP2]], ptr [[FP_OFFSET_P]], align 4
// CHECK-NEXT:    br label [[VAARG_END:%.*]]
// CHECK:       vaarg.in_mem:
// CHECK-NEXT:    [[OVERFLOW_ARG_AREA_P:%.*]] = getelementptr inbounds [[STRUCT___VA_LIST_TAG]], ptr [[ARRAYDECAY1]], i32 0, i32 2
// CHECK-NEXT:    [[OVERFLOW_ARG_AREA:%.*]] = load ptr, ptr [[OVERFLOW_ARG_AREA_P]], align 8
// CHECK-NEXT:    [[OVERFLOW_ARG_AREA_NEXT:%.*]] = getelementptr i8, ptr [[OVERFLOW_ARG_AREA]], i32 16
// CHECK-NEXT:    store ptr [[OVERFLOW_ARG_AREA_NEXT]], ptr [[OVERFLOW_ARG_AREA_P]], align 8
// CHECK-NEXT:    br label [[VAARG_END]]
// CHECK:       vaarg.end:
// CHECK-NEXT:    [[VAARG_ADDR:%.*]] = phi ptr [ [[TMP1]], [[VAARG_IN_REG]] ], [ [[OVERFLOW_ARG_AREA]], [[VAARG_IN_MEM]] ]
// CHECK-NEXT:    call void @llvm.memcpy.p0.p0.i64(ptr align 8 [[RETVAL]], ptr align 8 [[VAARG_ADDR]], i64 16, i1 false)
// CHECK-NEXT:    [[TMP3:%.*]] = getelementptr inbounds i8, ptr [[RETVAL]], i64 8
// CHECK-NEXT:    [[TMP4:%.*]] = load double, ptr [[TMP3]], align 8
// CHECK-NEXT:    ret double [[TMP4]]
//
s1 f(int z, ...) {
  __builtin_va_list list;
  __builtin_va_start(list, z);
  return __builtin_va_arg(list, s1);
}