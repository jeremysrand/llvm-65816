//===-- WDC65816BaseInfo.h - Top level definitions for 65816 - --*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains small standalone helper functions and enum definitions
// for the WDC65816 target useful for the compiler back-end and the MC libraries.
// As such, it deliberately does not include references to LLVM core code gen
// types, passes, etc..
//
//===----------------------------------------------------------------------===//

#ifndef WDC65816BASEINFO_H
#define WDC65816BASEINFO_H

namespace llvm {
    
    /// SPII - This namespace holds target specific flags for instruction info.
    namespace SPII {

#if 0 // WDC_TODO - Do I need any of this?
        /// Target Operand Flags. Sparc specific TargetFlags for MachineOperands and
        /// SDNodes.
        enum TOF {
            MO_NO_FLAG,
            
            // Extract the low 10 bits of an address.
            // Assembler: %lo(addr)
            MO_LO,
            
            // Extract bits 31-10 of an address. Only for sethi.
            // Assembler: %hi(addr) or %lm(addr)
            MO_HI,
            
            // Extract bits 43-22 of an adress. Only for sethi.
            // Assembler: %h44(addr)
            MO_H44,
            
            // Extract bits 21-12 of an address.
            // Assembler: %m44(addr)
            MO_M44,
            
            // Extract bits 11-0 of an address.
            // Assembler: %l44(addr)
            MO_L44,
            
            // Extract bits 63-42 of an address. Only for sethi.
            // Assembler: %hh(addr)
            MO_HH,
            
            // Extract bits 41-32 of an address.
            // Assembler: %hm(addr)
            MO_HM,
            
            // TargetFlags for Thread Local Storage.
            MO_TLS_GD_HI22,
            MO_TLS_GD_LO10,
            MO_TLS_GD_ADD,
            MO_TLS_GD_CALL,
            MO_TLS_LDM_HI22,
            MO_TLS_LDM_LO10,
            MO_TLS_LDM_ADD,
            MO_TLS_LDM_CALL,
            MO_TLS_LDO_HIX22,
            MO_TLS_LDO_LOX10,
            MO_TLS_LDO_ADD,
            MO_TLS_IE_HI22,
            MO_TLS_IE_LO10,
            MO_TLS_IE_LD,
            MO_TLS_IE_LDX,
            MO_TLS_IE_ADD,
            MO_TLS_LE_HIX22,
            MO_TLS_LE_LOX10
        };
#endif
        
    } // end namespace SPII
} // end namespace llvm

#endif
