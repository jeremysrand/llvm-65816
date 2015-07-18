//===- WDC65816SelectionDAGInfo.h - WDC 65816 SelectionDAG Info -*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file defines the WDC 65816 subclass for TargetSelectionDAGInfo.
//
//===----------------------------------------------------------------------===//

#ifndef WDC65816SELECTIONDAGINFO_H
#define WDC65816SELECTIONDAGINFO_H

#include "llvm/Target/TargetSelectionDAGInfo.h"

namespace llvm {
    
    class WDC65816TargetMachine;
    
    class WDC65816SelectionDAGInfo : public TargetSelectionDAGInfo {
    public:
        explicit WDC65816SelectionDAGInfo(const WDC65816TargetMachine &TM);
        ~WDC65816SelectionDAGInfo();
    };
    
}

#endif
