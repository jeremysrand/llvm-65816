//===-- WDC65816TargetMachine.cpp - Define TargetMachine for WDC65816 -----------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
//
//===----------------------------------------------------------------------===//

#include "WDC65816TargetMachine.h"
#include "WDC65816.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/PassManager.h"
#include "llvm/Support/TargetRegistry.h"

using namespace llvm;

extern "C" void LLVMInitializeWDC65816Target() {
    // Register the target.
    RegisterTargetMachine<WDC65816TargetMachine> X(TheWDC65816Target);
}

/// WDC65816TargetMachine ctor
///
WDC65816TargetMachine::WDC65816TargetMachine(const Target &T, StringRef TT,
                                       StringRef CPU, StringRef FS,
                                       const TargetOptions &Options,
                                       Reloc::Model RM, CodeModel::Model CM,
                                       CodeGenOpt::Level OL)
: LLVMTargetMachine(T, TT, CPU, FS, Options, RM, CM, OL),
DL("e-p:32:8:8-i16:8:8-f32:8:8-f68:8:8-n16"),
InstrInfo(),
TLInfo(*this), TSInfo(*this),
FrameLowering() {
    initAsmInfo();
}

namespace {
    /// WDC65816 Code Generator Pass Configuration Options.
    class WDC65816PassConfig : public TargetPassConfig {
    public:
        WDC65816PassConfig(WDC65816TargetMachine *TM, PassManagerBase &PM)
        : TargetPassConfig(TM, PM) {}
        
        WDC65816TargetMachine &getWDC65816TargetMachine() const {
            return getTM<WDC65816TargetMachine>();
        }
        
        virtual bool addInstSelector();
        virtual bool addPreEmitPass();
    };
} // namespace

TargetPassConfig *WDC65816TargetMachine::createPassConfig(PassManagerBase &PM) {
    return new WDC65816PassConfig(this, PM);
}

bool WDC65816PassConfig::addInstSelector() {
    addPass(createWDC65816ISelDag(getWDC65816TargetMachine()));
    return false;
}

/// addPreEmitPass - This pass may be implemented by targets that want to run
/// passes immediately before machine code is emitted.  This should return
/// true if -print-machineinstrs should print out the code after the passes.
bool WDC65816PassConfig::addPreEmitPass(){
    return true;
}
