//===-- WDC65816InstrInfo.h - WDC65816 Instruction Information --*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the WDC65816 implementation of the TargetInstrInfo class.
//
//===----------------------------------------------------------------------===//

#ifndef WDC65816INSTRUCTIONINFO_H
#define WDC65816INSTRUCTIONINFO_H

#include "WDC65816RegisterInfo.h"
#include "llvm/Target/TargetInstrInfo.h"

#define GET_INSTRINFO_HEADER
#include "WDC65816GenInstrInfo.inc"

namespace llvm {
    
    class WDC65816InstrInfo : public WDC65816GenInstrInfo {
        const WDC65816RegisterInfo RI;
        virtual void anchor();
    public:
        explicit WDC65816InstrInfo(void);
        
        /// getRegisterInfo - TargetInstrInfo is a superset of MRegister info.  As
        /// such, whenever a client has an instance of instruction info, it should
        /// always be able to get register info as well (through this method).
        ///
        virtual const WDC65816RegisterInfo &getRegisterInfo() const { return RI; }
        
        unsigned getGlobalBaseReg(MachineFunction *MF) const;
        
    };
    
}

#endif
