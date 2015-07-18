//===- WDC65816FrameLowering.h - Define frame lowering for Sparc -*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
//
//
//===----------------------------------------------------------------------===//

#ifndef WDC65816_FRAMEINFO_H
#define WDC65816_FRAMEINFO_H

#include "WDC65816.h"
#include "WDC65816Subtarget.h"
#include "llvm/Target/TargetFrameLowering.h"

namespace llvm {
    class WDC65816Subtarget;
    
    class WDC65816FrameLowering : public TargetFrameLowering {
        const WDC65816Subtarget &SubTarget;
    public:
        explicit WDC65816FrameLowering(const WDC65816Subtarget &ST)
        : TargetFrameLowering(TargetFrameLowering::StackGrowsDown, 1, 0),
        SubTarget(ST) {}
        
        bool hasFP(const MachineFunction &MF) const;
        
        /// emitProlog/emitEpilog - These methods insert prolog and epilog code into
        /// the function.
        void emitPrologue(MachineFunction &MF) const;
        void emitEpilogue(MachineFunction &MF, MachineBasicBlock &MBB) const;
#if 0 // JSR TODO - do I need any of this?
        
        void eliminateCallFramePseudoInstr(MachineFunction &MF,
                                           MachineBasicBlock &MBB,
                                           MachineBasicBlock::iterator I) const;
        
        bool hasReservedCallFrame(const MachineFunction &MF) const;
        void processFunctionBeforeCalleeSavedScan(MachineFunction &MF,
                                                  RegScavenger *RS = NULL) const;
        
    private:
        // Remap input registers to output registers for leaf procedure.
        void remapRegsForLeafProc(MachineFunction &MF) const;
        
        // Returns true if MF is a leaf procedure.
        bool isLeafProc(MachineFunction &MF) const;
        
        
        // Emits code for adjusting SP in function prologue/epilogue.
        void emitSPAdjustment(MachineFunction &MF,
                              MachineBasicBlock &MBB,
                              MachineBasicBlock::iterator MBBI,
                              int NumBytes, unsigned ADDrr, unsigned ADDri) const;
#endif
    };
    
} // End llvm namespace

#endif
