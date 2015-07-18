//===-- WDC65816.td - Describe the WDC65816 Target Machine -*- tablegen -*-===//
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

//===----------------------------------------------------------------------===//
// Target-independent interfaces which we are implementing
//===----------------------------------------------------------------------===//

include "llvm/Target/Target.td"

//===----------------------------------------------------------------------===//
// WDC65816 Subtarget features.
//

//def FeatureV9
//  : SubtargetFeature<"v9", "IsV9", "true",
//                     "Enable SPARC-V9 instructions">;

//===----------------------------------------------------------------------===//
// Register File, Calling Conv, Instruction Descriptions
//===----------------------------------------------------------------------===//

include "WDC65816RegisterInfo.td"
include "WDC65816CallingConv.td"
include "WDC65816InstrInfo.td"

def WDC65816InstrInfo : InstrInfo;

//===----------------------------------------------------------------------===//
// WDC65816 processors supported.
//===----------------------------------------------------------------------===//

class Proc<string Name, list<SubtargetFeature> Features>
 : Processor<Name, NoItineraries, Features>;

def : Proc<"wdc65816",        []>;


//===----------------------------------------------------------------------===//
// Declare the target which we are implementing
//===----------------------------------------------------------------------===//

def WDC65816 : Target {
  // Pull in Instruction Info:
  let InstructionSet = WDC65816InstrInfo;
}
