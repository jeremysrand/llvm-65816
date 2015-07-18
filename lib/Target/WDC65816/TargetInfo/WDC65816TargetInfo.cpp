//===-- WDC65816TargetInfo.cpp - WDC65816 Target Implementation -----------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include <stdio.h>
#include "WDC65816.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/TargetRegistry.h"
using namespace llvm;

Target llvm::TheWDC65816Target;

extern "C" void LLVMInitializeWDC65816TargetInfo() {
    printf("I got called!\n");
    RegisterTarget<Triple::wdc65816, /*HasJIT=*/ false>
    X(TheWDC65816Target, "wdc65816", "WDC65816");
    
    TargetRegistry::printRegisteredTargetsForVersion();
}
