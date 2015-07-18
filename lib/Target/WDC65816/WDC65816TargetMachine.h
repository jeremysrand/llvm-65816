//===- WDC65816TargetMachine.h - Define TargetMachine for WDC65816 -*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file declares the Sparc specific subclass of TargetMachine.
//
//===----------------------------------------------------------------------===//

#ifndef WDC65816TARGETMACHINE_H
#define WDC65816TARGETMACHINE_H

#include "WDC65816FrameLowering.h"
#include "WDC65816ISelLowering.h"
#include "WDC65816InstrInfo.h"
#include "WDC65816SelectionDAGInfo.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/Target/TargetFrameLowering.h"
#include "llvm/Target/TargetMachine.h"

namespace llvm {
    
    class WDC65816TargetMachine : public LLVMTargetMachine {
        // SparcSubtarget Subtarget;   WDC_TODO - Do I need this?
        const DataLayout DL;       // Calculates type size & alignment
        WDC65816InstrInfo InstrInfo;
        WDC65816TargetLowering TLInfo;
        WDC65816SelectionDAGInfo TSInfo;
        WDC65816FrameLowering FrameLowering;
    public:
        WDC65816TargetMachine(const Target &T, StringRef TT,
                           StringRef CPU, StringRef FS, const TargetOptions &Options,
                           Reloc::Model RM, CodeModel::Model CM,
                           CodeGenOpt::Level OL);
        
        virtual const WDC65816InstrInfo *getInstrInfo() const { return &InstrInfo; }
        virtual const TargetFrameLowering  *getFrameLowering() const {
            return &FrameLowering;
        }
        virtual const WDC65816RegisterInfo *getRegisterInfo() const {
            return &InstrInfo.getRegisterInfo();
        }
        virtual const WDC65816TargetLowering* getTargetLowering() const {
            return &TLInfo;
        }
        virtual const WDC65816SelectionDAGInfo* getSelectionDAGInfo() const {
            return &TSInfo;
        }
        virtual const DataLayout       *getDataLayout() const { return &DL; }
        
        // Pass Pipeline Configuration
        virtual TargetPassConfig *createPassConfig(PassManagerBase &PM);
#if 0 // WDC_TODO - Do I need this?  I think this is related to JIT
        virtual bool addCodeEmitter(PassManagerBase &PM, JITCodeEmitter &JCE);
#endif
    };
    
} // end namespace llvm

#endif
