//===-- WDC65816InstrInfo.cpp - WDC65816 Instruction Information ----------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the WDC65816 implementation of the TargetInstrInfo class.
//
//===----------------------------------------------------------------------===//

#include "WDC65816InstrInfo.h"
#include "WDC65816.h"
#include "WDC65816MachineFunctionInfo.h"
#include "WDC65816Subtarget.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineMemOperand.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/TargetRegistry.h"

#define GET_INSTRINFO_CTOR_DTOR
#include "WDC65816GenInstrInfo.inc"

using namespace llvm;


// Pin the vtable to this file.
void WDC65816InstrInfo::anchor() {}

WDC65816InstrInfo::WDC65816InstrInfo(WDC65816Subtarget &ST)
: WDC65816GenInstrInfo(WDC::ADJCALLSTACKDOWN, WDC::ADJCALLSTACKUP),
RI(ST), Subtarget(ST) {
}


unsigned WDC65816InstrInfo::getGlobalBaseReg(MachineFunction *MF) const
{
    WDC65816MachineFunctionInfo *WDC65816FI = MF->getInfo<WDC65816MachineFunctionInfo>();
    
    return WDC65816FI->getGlobalBaseReg();
    
#if 0 // WDC_TODO - Do something better here...
    unsigned GlobalBaseReg = WDC65816FI->getGlobalBaseReg();
    if (GlobalBaseReg != 0)
        return GlobalBaseReg;
    
    // Insert the set of GlobalBaseReg into the first MBB of the function
    MachineBasicBlock &FirstMBB = MF->front();
    MachineBasicBlock::iterator MBBI = FirstMBB.begin();
    MachineRegisterInfo &RegInfo = MF->getRegInfo();
    
    GlobalBaseReg = RegInfo.createVirtualRegister(&SP::IntRegsRegClass);
    
    DebugLoc dl;
    
    BuildMI(FirstMBB, MBBI, dl, get(SP::GETPCX), GlobalBaseReg);
    SparcFI->setGlobalBaseReg(GlobalBaseReg);
    return GlobalBaseReg;
#endif
}

void WDC65816InstrInfo::storeRegToStackSlot(MachineBasicBlock &MBB,
                                          MachineBasicBlock::iterator MI,
                                          unsigned SrcReg, bool isKill, int FrameIdx,
                                          const TargetRegisterClass *RC,
                                          const TargetRegisterInfo *TRI) const {
    DebugLoc DL;
    if (MI != MBB.end()) DL = MI->getDebugLoc();
    MachineFunction &MF = *MBB.getParent();
    MachineFrameInfo &MFI = *MF.getFrameInfo();
    
    MachineMemOperand *MMO =
    MF.getMachineMemOperand(MachinePointerInfo::getFixedStack(FrameIdx),
                            MachineMemOperand::MOStore,
                            MFI.getObjectSize(FrameIdx),
                            MFI.getObjectAlignment(FrameIdx));
    
    if (RC == &WDC::AccRegsRegClass)
        BuildMI(MBB, MI, DL, get(WDC::STAabsl))
        .addFrameIndex(FrameIdx).addReg(SrcReg, getKillRegState(isKill)).addMemOperand(MMO);
    else
        llvm_unreachable("Cannot store this register to stack slot!");
}

void WDC65816InstrInfo::loadRegFromStackSlot(MachineBasicBlock &MBB,
                                           MachineBasicBlock::iterator MI,
                                           unsigned DestReg, int FrameIdx,
                                           const TargetRegisterClass *RC,
                                           const TargetRegisterInfo *TRI) const{
    DebugLoc DL;
    if (MI != MBB.end()) DL = MI->getDebugLoc();
    MachineFunction &MF = *MBB.getParent();
    MachineFrameInfo &MFI = *MF.getFrameInfo();
    
    MachineMemOperand *MMO =
    MF.getMachineMemOperand(MachinePointerInfo::getFixedStack(FrameIdx),
                            MachineMemOperand::MOLoad,
                            MFI.getObjectSize(FrameIdx),
                            MFI.getObjectAlignment(FrameIdx));
    
    if (RC == &WDC::AccRegsRegClass)
        BuildMI(MBB, MI, DL, get(WDC::LDAabsl))
        .addReg(DestReg).addFrameIndex(FrameIdx).addMemOperand(MMO);
    else
        llvm_unreachable("Cannot store this register to stack slot!");
}