//===-- WDC65816Subtarget.cpp - WDC65816 Subtarget Information ------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements the WDC65816 specific subclass of TargetSubtargetInfo.
//
//===----------------------------------------------------------------------===//

#include "WDC65816Subtarget.h"
#include "WDC65816.h"
#include "llvm/Support/MathExtras.h"
#include "llvm/Support/TargetRegistry.h"

#define GET_SUBTARGETINFO_TARGET_DESC
#define GET_SUBTARGETINFO_CTOR
#include "WDC65816GenSubtargetInfo.inc"

using namespace llvm;

void WDC65816Subtarget::anchor() { }

WDC65816Subtarget::WDC65816Subtarget(const std::string &TT, const std::string &CPU,
                               const std::string &FS) :
WDC65816GenSubtargetInfo(TT, CPU, FS) {
    
    // Determine default and user specified characteristics
    std::string CPUName = CPU;
    
    // Parse features string.
    ParseSubtargetFeatures(CPUName, FS);
}

#if 0 // WDC_TODO - Do I need this?
int SparcSubtarget::getAdjustedFrameSize(int frameSize) const {
    
    if (is64Bit()) {
        // All 64-bit stack frames must be 16-byte aligned, and must reserve space
        // for spilling the 16 window registers at %sp+BIAS..%sp+BIAS+128.
        frameSize += 128;
        // Frames with calls must also reserve space for 6 outgoing arguments
        // whether they are used or not. LowerCall_64 takes care of that.
        assert(frameSize % 16 == 0 && "Stack size not 16-byte aligned");
    } else {
        // Emit the correct save instruction based on the number of bytes in
        // the frame. Minimum stack frame size according to V8 ABI is:
        //   16 words for register window spill
        //    1 word for address of returned aggregate-value
        // +  6 words for passing parameters on the stack
        // ----------
        //   23 words * 4 bytes per word = 92 bytes
        frameSize += 92;
        
        // Round up to next doubleword boundary -- a double-word boundary
        // is required by the ABI.
        frameSize = RoundUpToAlignment(frameSize, 8);
    }
    return frameSize;
}
#endif
