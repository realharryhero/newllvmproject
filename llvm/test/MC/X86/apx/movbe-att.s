# RUN: llvm-mc -triple x86_64 --show-encoding %s | FileCheck %s
# RUN: not llvm-mc -triple i386 -show-encoding %s 2>&1 | FileCheck %s --check-prefix=ERROR

# ERROR-COUNT-18: error:
# ERROR-NOT: error:
# CHECK: {evex}	movbew	%dx, %ax
# CHECK: encoding: [0x62,0xf4,0x7d,0x08,0x61,0xd0]
         {evex}	movbew	%dx, %ax

# CHECK: {evex}	movbew	%dx, 123(%rax,%rbx,4)
# CHECK: encoding: [0x62,0xf4,0x7d,0x08,0x61,0x54,0x98,0x7b]
         {evex}	movbew	%dx, 123(%rax,%rbx,4)

# CHECK: {evex}	movbel	%ecx, %edx
# CHECK: encoding: [0x62,0xf4,0x7c,0x08,0x61,0xca]
         {evex}	movbel	%ecx, %edx

# CHECK: {evex}	movbel	%ecx, 123(%rax,%rbx,4)
# CHECK: encoding: [0x62,0xf4,0x7c,0x08,0x61,0x4c,0x98,0x7b]
         {evex}	movbel	%ecx, 123(%rax,%rbx,4)

# CHECK: {evex}	movbeq	%r9, %r15
# CHECK: encoding: [0x62,0x54,0xfc,0x08,0x61,0xcf]
         {evex}	movbeq	%r9, %r15

# CHECK: {evex}	movbeq	%r9, 123(%rax,%rbx,4)
# CHECK: encoding: [0x62,0x74,0xfc,0x08,0x61,0x4c,0x98,0x7b]
         {evex}	movbeq	%r9, 123(%rax,%rbx,4)

# CHECK: {evex}	movbew	123(%rax,%rbx,4), %dx
# CHECK: encoding: [0x62,0xf4,0x7d,0x08,0x60,0x54,0x98,0x7b]
         {evex}	movbew	123(%rax,%rbx,4), %dx

# CHECK: {evex}	movbel	123(%rax,%rbx,4), %ecx
# CHECK: encoding: [0x62,0xf4,0x7c,0x08,0x60,0x4c,0x98,0x7b]
         {evex}	movbel	123(%rax,%rbx,4), %ecx

# CHECK: {evex}	movbeq	123(%rax,%rbx,4), %r9
# CHECK: encoding: [0x62,0x74,0xfc,0x08,0x60,0x4c,0x98,0x7b]
         {evex}	movbeq	123(%rax,%rbx,4), %r9

# CHECK: movbew	%r17w, %r21w
# CHECK: encoding: [0x62,0xec,0x7d,0x08,0x61,0xcd]
         movbew	%r17w, %r21w

# CHECK: movbew	%r17w, 291(%r28,%r29,4)
# CHECK: encoding: [0x62,0x8c,0x79,0x08,0x61,0x8c,0xac,0x23,0x01,0x00,0x00]
         movbew	%r17w, 291(%r28,%r29,4)

# CHECK: movbel	%r18d, %r22d
# CHECK: encoding: [0x62,0xec,0x7c,0x08,0x61,0xd6]
         movbel	%r18d, %r22d

# CHECK: movbel	%r18d, 291(%r28,%r29,4)
# CHECK: encoding: [0x62,0x8c,0x78,0x08,0x61,0x94,0xac,0x23,0x01,0x00,0x00]
         movbel	%r18d, 291(%r28,%r29,4)

# CHECK: movbeq	%r19, %r23
# CHECK: encoding: [0x62,0xec,0xfc,0x08,0x61,0xdf]
         movbeq	%r19, %r23

# CHECK: movbeq	%r19, 291(%r28,%r29,4)
# CHECK: encoding: [0x62,0x8c,0xf8,0x08,0x61,0x9c,0xac,0x23,0x01,0x00,0x00]
         movbeq	%r19, 291(%r28,%r29,4)

# CHECK: movbew	291(%r28,%r29,4), %r17w
# CHECK: encoding: [0x62,0x8c,0x79,0x08,0x60,0x8c,0xac,0x23,0x01,0x00,0x00]
         movbew	291(%r28,%r29,4), %r17w

# CHECK: movbel	291(%r28,%r29,4), %r18d
# CHECK: encoding: [0x62,0x8c,0x78,0x08,0x60,0x94,0xac,0x23,0x01,0x00,0x00]
         movbel	291(%r28,%r29,4), %r18d

# CHECK: movbeq	291(%r28,%r29,4), %r19
# CHECK: encoding: [0x62,0x8c,0xf8,0x08,0x60,0x9c,0xac,0x23,0x01,0x00,0x00]
         movbeq	291(%r28,%r29,4), %r19