//===-- WDC65816MCTargetDesc.cpp - WDC65816 Target Descriptions -----------===//
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

#include "WDC65816MCTargetDesc.h"
#include "WDC65816MCAsmInfo.h"
#include "llvm/MC/MCCodeGenInfo.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCRegisterInfo.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/TargetRegistry.h"

#define GET_INSTRINFO_MC_DESC
#include "WDC65816GenInstrInfo.inc"

#define GET_SUBTARGETINFO_MC_DESC
#include "WDC65816GenSubtargetInfo.inc"

#define GET_REGINFO_MC_DESC
#include "WDC65816GenRegisterInfo.inc"

using namespace llvm;

static MCInstrInfo *createWDC65816MCInstrInfo() {
    MCInstrInfo *X = new MCInstrInfo();
    InitWDC65816MCInstrInfo(X);
    return X;
}

static MCRegisterInfo *createWDC65816MCRegisterInfo(StringRef TT) {
    MCRegisterInfo *X = new MCRegisterInfo();
    InitWDC65816MCRegisterInfo(X, WDC::FP);
    return X;
}

static MCSubtargetInfo *createWDC65816MCSubtargetInfo(StringRef TT, StringRef CPU,
                                                   StringRef FS) {
    MCSubtargetInfo *X = new MCSubtargetInfo();
    InitWDC65816MCSubtargetInfo(X, TT, CPU, FS);
    return X;
}


static MCCodeGenInfo *createWDC65816MCCodeGenInfo(StringRef TT, Reloc::Model RM,
                                               CodeModel::Model CM,
                                               CodeGenOpt::Level OL) {
    MCCodeGenInfo *X = new MCCodeGenInfo();
    
    // The default 32-bit code model is abs32/pic32.
    if (CM == CodeModel::Default)
        CM = CodeModel::Medium;
    
    X->InitMCCodeGenInfo(RM, CM, OL);
    return X;
}


extern "C" void LLVMInitializeWDC65816TargetMC() {
    // Register the MC asm info.
    RegisterMCAsmInfo<WDC65816ELFMCAsmInfo> X(TheWDC65816Target);
    
    // Register the MC codegen info.
    TargetRegistry::RegisterMCCodeGenInfo(TheWDC65816Target,
                                          createWDC65816MCCodeGenInfo);
    
    // Register the MC instruction info.
    TargetRegistry::RegisterMCInstrInfo(TheWDC65816Target, createWDC65816MCInstrInfo);
    
    // Register the MC register info.
    TargetRegistry::RegisterMCRegInfo(TheWDC65816Target, createWDC65816MCRegisterInfo);
    
    // Register the MC subtarget info.
    TargetRegistry::RegisterMCSubtargetInfo(TheWDC65816Target,
                                            createWDC65816MCSubtargetInfo);
}
