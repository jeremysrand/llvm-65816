//===- WDC65816TargetMachine.cpp - Define TargetMachine for WDC65816 ------===//
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


#include <sys/time.h>

#include "WDC65816TargetMachine.h"
#include "WDC65816.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/PassManager.h"
#include "llvm/Support/TargetRegistry.h"

using namespace llvm;

extern "C" void LLVMInitializeWDC65816Target() {
    // Register the target.
    RegisterTargetMachine<WDC65816TargetMachine> X(TheWDC65816Target);
    WDC_LOG("Registered the target machine");
}

/// WDC65816TargetMachine ctor
///
WDC65816TargetMachine::WDC65816TargetMachine(const Target &T, StringRef TT,
                                       StringRef CPU, StringRef FS,
                                       const TargetOptions &Options,
                                       Reloc::Model RM, CodeModel::Model CM,
                                       CodeGenOpt::Level OL)
: LLVMTargetMachine(T, TT, CPU, FS, Options, RM, CM, OL),
Subtarget(TT, CPU, FS),
DL(Subtarget.getDataLayout()),
InstrInfo(Subtarget),
TLInfo(*this), TSInfo(*this),
FrameLowering(Subtarget) {
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
    return false;
}


void llvm::logWDCMessage(const char *file, const char *function, unsigned int linenum, const char *format, ...)
{
    char timebuf[64];
    va_list args;
    struct timeval now;
    const char *filename = strrchr(file, '/');
    
    if (filename != NULL)
        filename++;
    else
        filename = file;
    
    gettimeofday(&now, NULL);
    strftime(timebuf, sizeof(timebuf), "%T", localtime(&(now.tv_sec)));
    
    va_start(args, format);
    fprintf(stderr, "| WDCLog | %s.%06u | %s:%u | %s | ", timebuf, now.tv_usec, filename, linenum, function);
    vfprintf(stderr, format, args);
    fprintf(stderr, " |\n");
    va_end (args);
}
