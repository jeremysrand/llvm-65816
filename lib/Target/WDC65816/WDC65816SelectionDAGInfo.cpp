//===- WDC65816SelectionDAGInfo.cpp - WDC 65816 SelectionDAG Info ---------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements the WDC65816SelectionDAGInfo class.
//
//===----------------------------------------------------------------------===//

//#define DEBUG_TYPE "sparc-selectiondag-info"
#include "WDC65816TargetMachine.h"
using namespace llvm;

WDC65816SelectionDAGInfo::WDC65816SelectionDAGInfo(const WDC65816TargetMachine &TM)
: TargetSelectionDAGInfo(TM) {
}

WDC65816SelectionDAGInfo::~WDC65816SelectionDAGInfo() {
}
