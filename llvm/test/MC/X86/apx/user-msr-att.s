# RUN: llvm-mc -triple x86_64 --show-encoding %s | FileCheck %s
# RUN: not llvm-mc -triple i386 -show-encoding %s 2>&1 | FileCheck %s --check-prefix=ERROR

# ERROR-COUNT-8: error:
# ERROR-NOT: error:

## urdmsr

# CHECK: {evex}	urdmsr	$123, %r9
# CHECK: encoding: [0x62,0xd7,0x7f,0x08,0xf8,0xc1,0x7b,0x00,0x00,0x00]
         {evex}	urdmsr	$123, %r9

# CHECK: {evex}	urdmsr	%r9, %r15
# CHECK: encoding: [0x62,0x54,0x7f,0x08,0xf8,0xf9]
         {evex}	urdmsr	%r9, %r15

# CHECK: urdmsr	$123, %r19
# CHECK: encoding: [0x62,0xff,0x7f,0x08,0xf8,0xc3,0x7b,0x00,0x00,0x00]
         urdmsr	$123, %r19

# CHECK: urdmsr	%r19, %r23
# CHECK: encoding: [0x62,0xec,0x7f,0x08,0xf8,0xfb]
         urdmsr	%r19, %r23

## uwrmsr

# CHECK: {evex}	uwrmsr	%r9, $123
# CHECK: encoding: [0x62,0xd7,0x7e,0x08,0xf8,0xc1,0x7b,0x00,0x00,0x00]
         {evex}	uwrmsr	%r9, $123

# CHECK: {evex}	uwrmsr	%r9, %r15
# CHECK: encoding: [0x62,0x54,0x7e,0x08,0xf8,0xf9]
         {evex}	uwrmsr	%r9, %r15

# CHECK: uwrmsr	%r19, $123
# CHECK: encoding: [0x62,0xff,0x7e,0x08,0xf8,0xc3,0x7b,0x00,0x00,0x00]
         uwrmsr	%r19, $123

# CHECK: uwrmsr	%r19, %r23
# CHECK: encoding: [0x62,0xec,0x7e,0x08,0xf8,0xfb]
         uwrmsr	%r19, %r23