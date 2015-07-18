//===-- WDC65816MCTargetDesc.h - WDC65816 Target Descriptions ---*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file provides WDC65816 specific target descriptions.
//
//===----------------------------------------------------------------------===//

#ifndef WDC65816MCTARGETDESC_H
#define WDC65816MCTARGETDESC_H

namespace llvm {
    class Target;
    
    extern Target TheWDC65816Target;
    
} // End llvm namespace

// Defines symbolic names for WDC65816 registers.  This defines a mapping from
// register name to register number.
//
#define GET_REGINFO_ENUM
#include "WDC65816GenRegisterInfo.inc"

// Defines symbolic names for the WDC65816 instructions.
//
#define GET_INSTRINFO_ENUM
#include "WDC65816GenInstrInfo.inc"

#define GET_SUBTARGETINFO_ENUM
#include "WDC65816GenSubtargetInfo.inc"

#endif
