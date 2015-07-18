//===- WDCCallingConv.td - Calling Conventions WDC65816 ----*- tablegen -*-===//
// 
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
// 
//===----------------------------------------------------------------------===//
//
// This describes the calling conventions for the WDC65816 architectures.
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Return Value Calling Conventions
//===----------------------------------------------------------------------===//

// WDC C return-value convention.
def RetCC_WDC : CallingConv<[
  CCIfType<[i16], CCAssignToReg<[A]>>,
  CCIfType<[i32], CCAssignToReg<[X, A]>>
]>;

// WDC C Calling convention.
def CC_WDC : CallingConv<[
  CCIfType<[i8], CCAssignToStack<1, 1>>,
  CCIfType<[i16], CCAssignToStack<2, 1>>,
  CCIfType<[i32, f32], CCAssignToStack<4, 1>>
]>;


def CSR_NoRegs : CalleeSavedRegs<(add)>;