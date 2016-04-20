//===-- WDC65816MCAsmInfo.h - WDC65816 asm properties ----------*- C++ -*--===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the declaration of the WDC65816MCAsmInfo class.
//
//===----------------------------------------------------------------------===//

#ifndef WDC65816TARGETASMINFO_H
#define WDC65816TARGETASMINFO_H

#include "llvm/MC/MCAsmInfo.h"

namespace llvm {
    class StringRef;
    
    class WDC65816MCAsmInfo : public MCAsmInfo {
        virtual void anchor();
    public:
        explicit WDC65816MCAsmInfo(StringRef TT);
    };
    
} // namespace llvm

#endif
