; NOTE: Assertions have been autogenerated by utils/update_analyze_test_checks.py
; RUN: opt < %s -mtriple=x86_64-apple-macosx10.8.0 -cost-model -analyze -mattr=+sse2 | FileCheck %s --check-prefixes=CHECK,SSE,SSE2
; RUN: opt < %s -mtriple=x86_64-apple-macosx10.8.0 -cost-model -analyze -mattr=+sse3 | FileCheck %s --check-prefixes=CHECK,SSE,SSE3
; RUN: opt < %s -mtriple=x86_64-apple-macosx10.8.0 -cost-model -analyze -mattr=+ssse3 | FileCheck %s --check-prefixes=CHECK,SSE,SSSE3
; RUN: opt < %s -mtriple=x86_64-apple-macosx10.8.0 -cost-model -analyze -mattr=+sse4.1 | FileCheck %s --check-prefixes=CHECK,SSE,SSE41
; RUN: opt < %s -mtriple=x86_64-apple-macosx10.8.0 -cost-model -analyze -mattr=+sse4.2 | FileCheck %s --check-prefixes=CHECK,SSE,SSE42
; RUN: opt < %s -mtriple=x86_64-apple-macosx10.8.0 -cost-model -analyze -mattr=+avx | FileCheck %s --check-prefixes=CHECK,AVX,AVX1
; RUN: opt < %s -mtriple=x86_64-apple-macosx10.8.0 -cost-model -analyze -mattr=+avx2 | FileCheck %s --check-prefixes=CHECK,AVX,AVX2
; RUN: opt < %s -mtriple=x86_64-apple-macosx10.8.0 -cost-model -analyze -mattr=+avx512f | FileCheck %s --check-prefixes=CHECK,AVX512,AVX512F
; RUN: opt < %s -mtriple=x86_64-apple-macosx10.8.0 -cost-model -analyze -mattr=+avx512f,+avx512bw | FileCheck %s --check-prefixes=CHECK,AVX512,AVX512BW
;
; RUN: opt < %s -mtriple=x86_64-apple-macosx10.8.0 -cost-model -analyze -mcpu=slm | FileCheck %s --check-prefixes=CHECK,SSE,SSE42
; RUN: opt < %s -mtriple=x86_64-apple-macosx10.8.0 -cost-model -analyze -mcpu=goldmont | FileCheck %s --check-prefixes=CHECK,SSE,SSE42
; RUN: opt < %s -mtriple=x86_64-apple-macosx10.8.0 -cost-model -analyze -mcpu=btver2 | FileCheck %s --check-prefixes=BTVER2

define i32 @cmp_float(i32 %arg) {
; SSE2-LABEL: 'cmp_float'
; SSE2-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %V2F32 = fcmp olt <2 x float> undef, undef
; SSE2-NEXT:  Cost Model: Found an estimated cost of 7 for instruction: %V4F32 = fcmp olt <4 x float> undef, undef
; SSE2-NEXT:  Cost Model: Found an estimated cost of 14 for instruction: %V8F32 = fcmp olt <8 x float> undef, undef
; SSE2-NEXT:  Cost Model: Found an estimated cost of 28 for instruction: %V16F32 = fcmp olt <16 x float> undef, undef
; SSE2-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %V2F64 = fcmp olt <2 x double> undef, undef
; SSE2-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %V4F64 = fcmp olt <4 x double> undef, undef
; SSE2-NEXT:  Cost Model: Found an estimated cost of 12 for instruction: %V8F64 = fcmp olt <8 x double> undef, undef
; SSE2-NEXT:  Cost Model: Found an estimated cost of 24 for instruction: %V16F64 = fcmp olt <16 x double> undef, undef
; SSE2-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; SSE3-LABEL: 'cmp_float'
; SSE3-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %V2F32 = fcmp olt <2 x float> undef, undef
; SSE3-NEXT:  Cost Model: Found an estimated cost of 7 for instruction: %V4F32 = fcmp olt <4 x float> undef, undef
; SSE3-NEXT:  Cost Model: Found an estimated cost of 14 for instruction: %V8F32 = fcmp olt <8 x float> undef, undef
; SSE3-NEXT:  Cost Model: Found an estimated cost of 28 for instruction: %V16F32 = fcmp olt <16 x float> undef, undef
; SSE3-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %V2F64 = fcmp olt <2 x double> undef, undef
; SSE3-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %V4F64 = fcmp olt <4 x double> undef, undef
; SSE3-NEXT:  Cost Model: Found an estimated cost of 12 for instruction: %V8F64 = fcmp olt <8 x double> undef, undef
; SSE3-NEXT:  Cost Model: Found an estimated cost of 24 for instruction: %V16F64 = fcmp olt <16 x double> undef, undef
; SSE3-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; SSSE3-LABEL: 'cmp_float'
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %V2F32 = fcmp olt <2 x float> undef, undef
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 7 for instruction: %V4F32 = fcmp olt <4 x float> undef, undef
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 14 for instruction: %V8F32 = fcmp olt <8 x float> undef, undef
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 28 for instruction: %V16F32 = fcmp olt <16 x float> undef, undef
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %V2F64 = fcmp olt <2 x double> undef, undef
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %V4F64 = fcmp olt <4 x double> undef, undef
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 12 for instruction: %V8F64 = fcmp olt <8 x double> undef, undef
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 24 for instruction: %V16F64 = fcmp olt <16 x double> undef, undef
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; SSE41-LABEL: 'cmp_float'
; SSE41-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %V2F32 = fcmp olt <2 x float> undef, undef
; SSE41-NEXT:  Cost Model: Found an estimated cost of 7 for instruction: %V4F32 = fcmp olt <4 x float> undef, undef
; SSE41-NEXT:  Cost Model: Found an estimated cost of 14 for instruction: %V8F32 = fcmp olt <8 x float> undef, undef
; SSE41-NEXT:  Cost Model: Found an estimated cost of 28 for instruction: %V16F32 = fcmp olt <16 x float> undef, undef
; SSE41-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %V2F64 = fcmp olt <2 x double> undef, undef
; SSE41-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %V4F64 = fcmp olt <4 x double> undef, undef
; SSE41-NEXT:  Cost Model: Found an estimated cost of 12 for instruction: %V8F64 = fcmp olt <8 x double> undef, undef
; SSE41-NEXT:  Cost Model: Found an estimated cost of 24 for instruction: %V16F64 = fcmp olt <16 x double> undef, undef
; SSE41-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; SSE42-LABEL: 'cmp_float'
; SSE42-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V2F32 = fcmp olt <2 x float> undef, undef
; SSE42-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4F32 = fcmp olt <4 x float> undef, undef
; SSE42-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V8F32 = fcmp olt <8 x float> undef, undef
; SSE42-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V16F32 = fcmp olt <16 x float> undef, undef
; SSE42-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V2F64 = fcmp olt <2 x double> undef, undef
; SSE42-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V4F64 = fcmp olt <4 x double> undef, undef
; SSE42-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V8F64 = fcmp olt <8 x double> undef, undef
; SSE42-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V16F64 = fcmp olt <16 x double> undef, undef
; SSE42-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX-LABEL: 'cmp_float'
; AVX-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V2F32 = fcmp olt <2 x float> undef, undef
; AVX-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4F32 = fcmp olt <4 x float> undef, undef
; AVX-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8F32 = fcmp olt <8 x float> undef, undef
; AVX-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V16F32 = fcmp olt <16 x float> undef, undef
; AVX-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V2F64 = fcmp olt <2 x double> undef, undef
; AVX-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4F64 = fcmp olt <4 x double> undef, undef
; AVX-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V8F64 = fcmp olt <8 x double> undef, undef
; AVX-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V16F64 = fcmp olt <16 x double> undef, undef
; AVX-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512-LABEL: 'cmp_float'
; AVX512-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V2F32 = fcmp olt <2 x float> undef, undef
; AVX512-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4F32 = fcmp olt <4 x float> undef, undef
; AVX512-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8F32 = fcmp olt <8 x float> undef, undef
; AVX512-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V16F32 = fcmp olt <16 x float> undef, undef
; AVX512-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V2F64 = fcmp olt <2 x double> undef, undef
; AVX512-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4F64 = fcmp olt <4 x double> undef, undef
; AVX512-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8F64 = fcmp olt <8 x double> undef, undef
; AVX512-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V16F64 = fcmp olt <16 x double> undef, undef
; AVX512-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; BTVER2-LABEL: 'cmp_float'
; BTVER2-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V2F32 = fcmp olt <2 x float> undef, undef
; BTVER2-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4F32 = fcmp olt <4 x float> undef, undef
; BTVER2-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8F32 = fcmp olt <8 x float> undef, undef
; BTVER2-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V16F32 = fcmp olt <16 x float> undef, undef
; BTVER2-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V2F64 = fcmp olt <2 x double> undef, undef
; BTVER2-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4F64 = fcmp olt <4 x double> undef, undef
; BTVER2-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V8F64 = fcmp olt <8 x double> undef, undef
; BTVER2-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V16F64 = fcmp olt <16 x double> undef, undef
; BTVER2-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
  %V2F32 = fcmp olt <2 x float> undef, undef
  %V4F32 = fcmp olt <4 x float> undef, undef
  %V8F32 = fcmp olt <8 x float> undef, undef
  %V16F32 = fcmp olt <16 x float> undef, undef

  %V2F64 = fcmp olt <2 x double> undef, undef
  %V4F64 = fcmp olt <4 x double> undef, undef
  %V8F64 = fcmp olt <8 x double> undef, undef
  %V16F64 = fcmp olt <16 x double> undef, undef

  ret i32 undef
}

define i32 @cmp_int(i32 %arg) {
; SSE2-LABEL: 'cmp_int'
; SSE2-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V16I8 = icmp eq <16 x i8> undef, undef
; SSE2-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V32I8 = icmp eq <32 x i8> undef, undef
; SSE2-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V64I8 = icmp eq <64 x i8> undef, undef
; SSE2-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V128I8 = icmp eq <128 x i8> undef, undef
; SSE2-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8I16 = icmp eq <8 x i16> undef, undef
; SSE2-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V16I16 = icmp eq <16 x i16> undef, undef
; SSE2-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V32I16 = icmp eq <32 x i16> undef, undef
; SSE2-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V64I16 = icmp eq <64 x i16> undef, undef
; SSE2-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4I32 = icmp eq <4 x i32> undef, undef
; SSE2-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V8I32 = icmp eq <8 x i32> undef, undef
; SSE2-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V16I32 = icmp eq <16 x i32> undef, undef
; SSE2-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V32I32 = icmp eq <32 x i32> undef, undef
; SSE2-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V2I64 = icmp eq <2 x i64> undef, undef
; SSE2-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V4I64 = icmp eq <4 x i64> undef, undef
; SSE2-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %V8I64 = icmp eq <8 x i64> undef, undef
; SSE2-NEXT:  Cost Model: Found an estimated cost of 64 for instruction: %V16I64 = icmp eq <16 x i64> undef, undef
; SSE2-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; SSE3-LABEL: 'cmp_int'
; SSE3-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V16I8 = icmp eq <16 x i8> undef, undef
; SSE3-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V32I8 = icmp eq <32 x i8> undef, undef
; SSE3-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V64I8 = icmp eq <64 x i8> undef, undef
; SSE3-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V128I8 = icmp eq <128 x i8> undef, undef
; SSE3-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8I16 = icmp eq <8 x i16> undef, undef
; SSE3-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V16I16 = icmp eq <16 x i16> undef, undef
; SSE3-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V32I16 = icmp eq <32 x i16> undef, undef
; SSE3-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V64I16 = icmp eq <64 x i16> undef, undef
; SSE3-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4I32 = icmp eq <4 x i32> undef, undef
; SSE3-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V8I32 = icmp eq <8 x i32> undef, undef
; SSE3-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V16I32 = icmp eq <16 x i32> undef, undef
; SSE3-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V32I32 = icmp eq <32 x i32> undef, undef
; SSE3-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V2I64 = icmp eq <2 x i64> undef, undef
; SSE3-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V4I64 = icmp eq <4 x i64> undef, undef
; SSE3-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %V8I64 = icmp eq <8 x i64> undef, undef
; SSE3-NEXT:  Cost Model: Found an estimated cost of 64 for instruction: %V16I64 = icmp eq <16 x i64> undef, undef
; SSE3-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; SSSE3-LABEL: 'cmp_int'
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V16I8 = icmp eq <16 x i8> undef, undef
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V32I8 = icmp eq <32 x i8> undef, undef
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V64I8 = icmp eq <64 x i8> undef, undef
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V128I8 = icmp eq <128 x i8> undef, undef
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8I16 = icmp eq <8 x i16> undef, undef
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V16I16 = icmp eq <16 x i16> undef, undef
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V32I16 = icmp eq <32 x i16> undef, undef
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V64I16 = icmp eq <64 x i16> undef, undef
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4I32 = icmp eq <4 x i32> undef, undef
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V8I32 = icmp eq <8 x i32> undef, undef
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V16I32 = icmp eq <16 x i32> undef, undef
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V32I32 = icmp eq <32 x i32> undef, undef
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V2I64 = icmp eq <2 x i64> undef, undef
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V4I64 = icmp eq <4 x i64> undef, undef
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %V8I64 = icmp eq <8 x i64> undef, undef
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 64 for instruction: %V16I64 = icmp eq <16 x i64> undef, undef
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; SSE41-LABEL: 'cmp_int'
; SSE41-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V16I8 = icmp eq <16 x i8> undef, undef
; SSE41-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V32I8 = icmp eq <32 x i8> undef, undef
; SSE41-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V64I8 = icmp eq <64 x i8> undef, undef
; SSE41-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V128I8 = icmp eq <128 x i8> undef, undef
; SSE41-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8I16 = icmp eq <8 x i16> undef, undef
; SSE41-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V16I16 = icmp eq <16 x i16> undef, undef
; SSE41-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V32I16 = icmp eq <32 x i16> undef, undef
; SSE41-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V64I16 = icmp eq <64 x i16> undef, undef
; SSE41-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4I32 = icmp eq <4 x i32> undef, undef
; SSE41-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V8I32 = icmp eq <8 x i32> undef, undef
; SSE41-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V16I32 = icmp eq <16 x i32> undef, undef
; SSE41-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V32I32 = icmp eq <32 x i32> undef, undef
; SSE41-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V2I64 = icmp eq <2 x i64> undef, undef
; SSE41-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V4I64 = icmp eq <4 x i64> undef, undef
; SSE41-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %V8I64 = icmp eq <8 x i64> undef, undef
; SSE41-NEXT:  Cost Model: Found an estimated cost of 64 for instruction: %V16I64 = icmp eq <16 x i64> undef, undef
; SSE41-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; SSE42-LABEL: 'cmp_int'
; SSE42-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V16I8 = icmp eq <16 x i8> undef, undef
; SSE42-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V32I8 = icmp eq <32 x i8> undef, undef
; SSE42-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V64I8 = icmp eq <64 x i8> undef, undef
; SSE42-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V128I8 = icmp eq <128 x i8> undef, undef
; SSE42-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8I16 = icmp eq <8 x i16> undef, undef
; SSE42-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V16I16 = icmp eq <16 x i16> undef, undef
; SSE42-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V32I16 = icmp eq <32 x i16> undef, undef
; SSE42-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V64I16 = icmp eq <64 x i16> undef, undef
; SSE42-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4I32 = icmp eq <4 x i32> undef, undef
; SSE42-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V8I32 = icmp eq <8 x i32> undef, undef
; SSE42-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V16I32 = icmp eq <16 x i32> undef, undef
; SSE42-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V32I32 = icmp eq <32 x i32> undef, undef
; SSE42-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V2I64 = icmp eq <2 x i64> undef, undef
; SSE42-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V4I64 = icmp eq <4 x i64> undef, undef
; SSE42-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V8I64 = icmp eq <8 x i64> undef, undef
; SSE42-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V16I64 = icmp eq <16 x i64> undef, undef
; SSE42-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX1-LABEL: 'cmp_int'
; AVX1-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V16I8 = icmp eq <16 x i8> undef, undef
; AVX1-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V32I8 = icmp eq <32 x i8> undef, undef
; AVX1-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V64I8 = icmp eq <64 x i8> undef, undef
; AVX1-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V128I8 = icmp eq <128 x i8> undef, undef
; AVX1-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8I16 = icmp eq <8 x i16> undef, undef
; AVX1-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V16I16 = icmp eq <16 x i16> undef, undef
; AVX1-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V32I16 = icmp eq <32 x i16> undef, undef
; AVX1-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V64I16 = icmp eq <64 x i16> undef, undef
; AVX1-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4I32 = icmp eq <4 x i32> undef, undef
; AVX1-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V8I32 = icmp eq <8 x i32> undef, undef
; AVX1-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V16I32 = icmp eq <16 x i32> undef, undef
; AVX1-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V32I32 = icmp eq <32 x i32> undef, undef
; AVX1-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V2I64 = icmp eq <2 x i64> undef, undef
; AVX1-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V4I64 = icmp eq <4 x i64> undef, undef
; AVX1-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V8I64 = icmp eq <8 x i64> undef, undef
; AVX1-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V16I64 = icmp eq <16 x i64> undef, undef
; AVX1-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX2-LABEL: 'cmp_int'
; AVX2-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V16I8 = icmp eq <16 x i8> undef, undef
; AVX2-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V32I8 = icmp eq <32 x i8> undef, undef
; AVX2-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V64I8 = icmp eq <64 x i8> undef, undef
; AVX2-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V128I8 = icmp eq <128 x i8> undef, undef
; AVX2-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8I16 = icmp eq <8 x i16> undef, undef
; AVX2-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V16I16 = icmp eq <16 x i16> undef, undef
; AVX2-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V32I16 = icmp eq <32 x i16> undef, undef
; AVX2-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V64I16 = icmp eq <64 x i16> undef, undef
; AVX2-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4I32 = icmp eq <4 x i32> undef, undef
; AVX2-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8I32 = icmp eq <8 x i32> undef, undef
; AVX2-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V16I32 = icmp eq <16 x i32> undef, undef
; AVX2-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V32I32 = icmp eq <32 x i32> undef, undef
; AVX2-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V2I64 = icmp eq <2 x i64> undef, undef
; AVX2-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4I64 = icmp eq <4 x i64> undef, undef
; AVX2-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V8I64 = icmp eq <8 x i64> undef, undef
; AVX2-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V16I64 = icmp eq <16 x i64> undef, undef
; AVX2-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512F-LABEL: 'cmp_int'
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V16I8 = icmp eq <16 x i8> undef, undef
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V32I8 = icmp eq <32 x i8> undef, undef
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V64I8 = icmp eq <64 x i8> undef, undef
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V128I8 = icmp eq <128 x i8> undef, undef
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8I16 = icmp eq <8 x i16> undef, undef
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V16I16 = icmp eq <16 x i16> undef, undef
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V32I16 = icmp eq <32 x i16> undef, undef
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V64I16 = icmp eq <64 x i16> undef, undef
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4I32 = icmp eq <4 x i32> undef, undef
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8I32 = icmp eq <8 x i32> undef, undef
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V16I32 = icmp eq <16 x i32> undef, undef
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V32I32 = icmp eq <32 x i32> undef, undef
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V2I64 = icmp eq <2 x i64> undef, undef
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4I64 = icmp eq <4 x i64> undef, undef
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8I64 = icmp eq <8 x i64> undef, undef
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V16I64 = icmp eq <16 x i64> undef, undef
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512BW-LABEL: 'cmp_int'
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V16I8 = icmp eq <16 x i8> undef, undef
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V32I8 = icmp eq <32 x i8> undef, undef
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V64I8 = icmp eq <64 x i8> undef, undef
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V128I8 = icmp eq <128 x i8> undef, undef
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8I16 = icmp eq <8 x i16> undef, undef
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V16I16 = icmp eq <16 x i16> undef, undef
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V32I16 = icmp eq <32 x i16> undef, undef
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V64I16 = icmp eq <64 x i16> undef, undef
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4I32 = icmp eq <4 x i32> undef, undef
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8I32 = icmp eq <8 x i32> undef, undef
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V16I32 = icmp eq <16 x i32> undef, undef
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V32I32 = icmp eq <32 x i32> undef, undef
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V2I64 = icmp eq <2 x i64> undef, undef
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4I64 = icmp eq <4 x i64> undef, undef
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8I64 = icmp eq <8 x i64> undef, undef
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V16I64 = icmp eq <16 x i64> undef, undef
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; BTVER2-LABEL: 'cmp_int'
; BTVER2-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V16I8 = icmp eq <16 x i8> undef, undef
; BTVER2-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V32I8 = icmp eq <32 x i8> undef, undef
; BTVER2-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V64I8 = icmp eq <64 x i8> undef, undef
; BTVER2-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V128I8 = icmp eq <128 x i8> undef, undef
; BTVER2-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8I16 = icmp eq <8 x i16> undef, undef
; BTVER2-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V16I16 = icmp eq <16 x i16> undef, undef
; BTVER2-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V32I16 = icmp eq <32 x i16> undef, undef
; BTVER2-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V64I16 = icmp eq <64 x i16> undef, undef
; BTVER2-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4I32 = icmp eq <4 x i32> undef, undef
; BTVER2-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V8I32 = icmp eq <8 x i32> undef, undef
; BTVER2-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V16I32 = icmp eq <16 x i32> undef, undef
; BTVER2-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V32I32 = icmp eq <32 x i32> undef, undef
; BTVER2-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V2I64 = icmp eq <2 x i64> undef, undef
; BTVER2-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V4I64 = icmp eq <4 x i64> undef, undef
; BTVER2-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V8I64 = icmp eq <8 x i64> undef, undef
; BTVER2-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V16I64 = icmp eq <16 x i64> undef, undef
; BTVER2-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
  %V16I8 = icmp eq <16 x i8> undef, undef
  %V32I8 = icmp eq <32 x i8> undef, undef
  %V64I8 = icmp eq <64 x i8> undef, undef
  %V128I8 = icmp eq <128 x i8> undef, undef

  %V8I16  = icmp eq <8 x i16> undef, undef
  %V16I16 = icmp eq <16 x i16> undef, undef
  %V32I16 = icmp eq <32 x i16> undef, undef
  %V64I16 = icmp eq <64 x i16> undef, undef

  %V4I32 = icmp eq <4 x i32> undef, undef
  %V8I32 = icmp eq <8 x i32> undef, undef
  %V16I32 = icmp eq <16 x i32> undef, undef
  %V32I32 = icmp eq <32 x i32> undef, undef

  %V2I64 = icmp eq <2 x i64> undef, undef
  %V4I64 = icmp eq <4 x i64> undef, undef
  %V8I64 = icmp eq <8 x i64> undef, undef
  %V16I64 = icmp eq <16 x i64> undef, undef

  ret i32 undef
}