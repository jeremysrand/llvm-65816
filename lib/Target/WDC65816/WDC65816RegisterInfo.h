//===- WDC65816RegisterInfo.h - WDC65816 Register Information Impl -*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the WDC65816 implementation of the TargetRegisterInfo class.
//
//===----------------------------------------------------------------------===//

#ifndef WDC65816REGISTERINFO_H
#define WDC65816REGISTERINFO_H

#include "llvm/Target/TargetRegisterInfo.h"

#define GET_REGINFO_HEADER
#include "WDC65816GenRegisterInfo.inc"

namespace llvm {
    
    class TargetInstrInfo;
    class Type;
    
    struct WDC65816RegisterInfo : public WDC65816GenRegisterInfo {
        
        WDC65816RegisterInfo(void);

        /// Code Generation virtual methods...
        const uint16_t *getCalleeSavedRegs(const MachineFunction *MF = 0) const;
        const uint32_t* getCallPreservedMask(CallingConv::ID CC) const;
        
        const uint32_t* getRTCallPreservedMask(CallingConv::ID CC) const;
        
        BitVector getReservedRegs(const MachineFunction &MF) const;
        
        const TargetRegisterClass *getPointerRegClass(const MachineFunction &MF,
                                                      unsigned Kind) const;
        
        void eliminateFrameIndex(MachineBasicBlock::iterator II,
                                 int SPAdj, unsigned FIOperandNum,
                                 RegScavenger *RS = NULL) const;
        
        void processFunctionBeforeFrameFinalized(MachineFunction &MF,
                                                 RegScavenger *RS = NULL) const;
        
        // Debug information queries.
        unsigned getFrameRegister(const MachineFunction &MF) const;
    };
    
} // end namespace llvm

#endif
