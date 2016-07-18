//===-- WDC65816ISelLowering.cpp - WDC65816 DAG Lowering Implementation ---------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements the interfaces that WDC65816 uses to lower LLVM code into a
// selection DAG.
//
//===----------------------------------------------------------------------===//

#include "WDC65816ISelLowering.h"
#include "WDC65816MachineFunctionInfo.h"
#include "WDC65816RegisterInfo.h"
#include "WDC65816TargetMachine.h"
#include "WDC65816TargetObjectFile.h"
#include "MCTargetDesc/WDC65816BaseInfo.h"
#include "llvm/CodeGen/CallingConvLower.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/SelectionDAG.h"
#include "llvm/CodeGen/TargetLoweringObjectFileImpl.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/ErrorHandling.h"
using namespace llvm;


//===----------------------------------------------------------------------===//
// Calling Convention Implementation
//===----------------------------------------------------------------------===//

#include "WDC65816GenCallingConv.inc"


SDValue WDC65816TargetLowering::LowerFormalArguments(SDValue Chain,
                     CallingConv::ID CallConv,
                     bool isVarArg,
                     const SmallVectorImpl<ISD::InputArg> &Ins,
                     SDLoc DL,
                     SelectionDAG &DAG,
                     SmallVectorImpl<SDValue> &InVals) const {
    MachineFunction &MF = DAG.getMachineFunction();
    
    // Assign locations to all of the incoming arguments.
    SmallVector<CCValAssign, 16> ArgLocs;
    CCState CCInfo(CallConv, isVarArg, DAG.getMachineFunction(),
                   getTargetMachine(), ArgLocs, *DAG.getContext());
    CCInfo.AnalyzeFormalArguments(Ins, CC_WDC);
    
    for (unsigned i = 0, e = ArgLocs.size(); i != e; ++i) {
        CCValAssign &VA = ArgLocs[i];
        
        if (i == 0 && Ins[i].Flags.isSRet()) {
            WDC_LOG("WDC_TODO - Write code for returning a structure as a hidden input arg pointer");
            continue;
        }
        
        if (VA.isRegLoc()) {
            if (VA.needsCustom()) {
                WDC_LOG("WDC_TODO - needsCustom() in register location!");
                continue;
            }
            WDC_LOG("WDC_TODO - Write code for register location");
            continue;
        }
        
        assert(VA.isMemLoc());
        
        unsigned Offset = VA.getLocMemOffset();
        
        if (VA.needsCustom()) {
            WDC_LOG("WDC_TODO - needsCustom() in memory location, offset=" << Offset);
            continue;
        }
        
        WDC_LOG("WDC_TODO - Write code for memory location, offset=" << Offset);
    }
    
    if (MF.getFunction()->hasStructRetAttr()) {
        WDC_LOG("WDC_TODO - Write code for hasStructRetAttr()");
    }
    
    if (isVarArg) {
        WDC_LOG("WDC_TODO - Write code for isVarArg");
    }
    
    return Chain;
}


SDValue
WDC65816TargetLowering::LowerReturn(SDValue Chain,
                                    CallingConv::ID CallConv, bool IsVarArg,
                                    const SmallVectorImpl<ISD::OutputArg> &Outs,
                                    const SmallVectorImpl<SDValue> &OutVals,
                                    SDLoc DL, SelectionDAG &DAG) const {
    MachineFunction &MF = DAG.getMachineFunction();
    
    // CCValAssign - represent the assignment of the return value to locations.
    SmallVector<CCValAssign, 16> RVLocs;
    
    // CCState - Info about the registers and stack slot.
    CCState CCInfo(CallConv, IsVarArg, DAG.getMachineFunction(),
                   DAG.getTarget(), RVLocs, *DAG.getContext());
    
    // Analyze return values.
    CCInfo.AnalyzeReturn(Outs, RetCC_WDC);
    
    SDValue Flag;
    SmallVector<SDValue, 4> RetOps(1, Chain);
    
    // Copy the result values into the output registers.
    for (unsigned i = 0; i != RVLocs.size(); ++i) {
        CCValAssign &VA = RVLocs[i];
        assert(VA.isRegLoc() && "Can only return in registers!");
        
        Chain = DAG.getCopyToReg(Chain, DL, VA.getLocReg(),
                                 OutVals[i], Flag);
        
        // Guarantee that all emitted copies are stuck together with flags.
        Flag = Chain.getValue(1);
        RetOps.push_back(DAG.getRegister(VA.getLocReg(), VA.getLocVT()));
    }
    
    if (MF.getFunction()->hasStructRetAttr()) {
        WDC_LOG("WDC_TODO - Need to implement hasStructRetAttr() case");
    }
    
    RetOps[0] = Chain;  // Update chain.
    
    // Add the flag if we have it.
    if (Flag.getNode())
        RetOps.push_back(Flag);
    
    return DAG.getNode(WDCISD::RET_FLAG, DL, MVT::Other,
                       &RetOps[0], RetOps.size());
}


SDValue WDC65816TargetLowering::LowerGlobalAddress(SDValue Op,
                                                   SelectionDAG &DAG) const
{
    const GlobalValue *GV = cast<GlobalAddressSDNode>(Op)->getGlobal();
    int64_t Offset = cast<GlobalAddressSDNode>(Op)->getOffset();
    
    // Create the TargetGlobalAddress node, folding in the constant offset.
    SDValue Result = DAG.getTargetGlobalAddress(GV, SDLoc(Op),
                                                getPointerTy(), Offset);
    return DAG.getNode(WDCISD::Wrapper, SDLoc(Op),
                       getPointerTy(), Result);
}


WDC65816TargetLowering::WDC65816TargetLowering(TargetMachine &TM)
: TargetLowering(TM, new WDC65816TargetObjectFile()) {
    
    addRegisterClass(MVT::i16, &WDC::AccRegsRegClass);
    addRegisterClass(MVT::i16, &WDC::IndexXRegsRegClass);
    addRegisterClass(MVT::i16, &WDC::IndexYRegsRegClass);
    addRegisterClass(MVT::i16, &WDC::Int16RegsRegClass);
    addRegisterClass(MVT::i32, &WDC::Int32RegsRegClass);
    addRegisterClass(MVT::i64, &WDC::Int64RegsRegClass);
    addRegisterClass(MVT::f32, &WDC::Float32RegsRegClass);
    addRegisterClass(MVT::f64, &WDC::Float64RegsRegClass);
    
    computeRegisterProperties();
    
    // Division is expensive
    setIntDivIsCheap(false);
    
    setOperationAction(ISD::GlobalAddress, MVT::i32, Custom);
}

const char *WDC65816TargetLowering::getTargetNodeName(unsigned Opcode) const {
    switch (Opcode) {
        default: return 0;
        case WDCISD::RET_FLAG:   return "WDCSD::RET_FLAG";
        case WDCISD::Wrapper:    return "WDCISD::Wrapper";
    }
}



SDValue WDC65816TargetLowering::
LowerOperation(SDValue Op, SelectionDAG &DAG) const {
    switch (Op.getOpcode()) {
        default: llvm_unreachable("Should not custom lower this!");
        case ISD::GlobalAddress:      return LowerGlobalAddress(Op, DAG);
    }
}


void
WDC65816TargetLowering::LowerOperationWrapper(SDNode *N,
                                          SmallVectorImpl<SDValue> &Results,
                                          SelectionDAG &DAG) const {
    SDValue Res = LowerOperation(SDValue(N, 0), DAG);
    
    for (unsigned I = 0, E = Res->getNumValues(); I != E; ++I)
        Results.push_back(Res.getValue(I));
}

void
WDC65816TargetLowering::ReplaceNodeResults(SDNode *N,
                                       SmallVectorImpl<SDValue> &Results,
                                       SelectionDAG &DAG) const {
    return LowerOperationWrapper(N, Results, DAG);
}


// Pin WDC65816Section's and WDC65816TargetObjectFile's vtables to this file.
void WDC65816Section::anchor() {}

WDC65816TargetObjectFile::~WDC65816TargetObjectFile() {
    delete TextSection;
    delete DataSection;
    delete BSSSection;
    delete ReadOnlySection;
    
    delete StaticCtorSection;
    delete StaticDtorSection;
    delete LSDASection;
    delete EHFrameSection;
    delete DwarfAbbrevSection;
    delete DwarfInfoSection;
    delete DwarfLineSection;
    delete DwarfFrameSection;
    delete DwarfPubTypesSection;
    delete DwarfDebugInlineSection;
    delete DwarfStrSection;
    delete DwarfLocSection;
    delete DwarfARangesSection;
    delete DwarfRangesSection;
    delete DwarfMacroInfoSection;
}
