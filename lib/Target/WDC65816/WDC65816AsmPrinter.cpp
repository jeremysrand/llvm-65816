//===-- WDC65816AsmPrinter.cpp - WDC65816 LLVM assembly writer ------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains a printer that converts from our internal representation
// of machine-dependent LLVM code to GAS-format SPARC assembly language.
//
//===----------------------------------------------------------------------===//

#define DEBUG_TYPE "asm-printer"
#include "WDC65816.h"
#include "WDC65816InstrInfo.h"
#include "WDC65816TargetMachine.h"
#include "MCTargetDesc/WDC65816BaseInfo.h"
#include "MCTargetDesc/WDC65816TargetStreamer.h"
#include "llvm/ADT/SmallString.h"
#include "llvm/CodeGen/AsmPrinter.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/IR/Module.h"
#include "llvm/MC/MCAsmInfo.h"
#include "llvm/MC/MCStreamer.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/Support/TargetRegistry.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Target/Mangler.h"

using namespace llvm;

namespace {
    class WDC65816AsmPrinter : public AsmPrinter {
        WDC65816TargetStreamer &getTargetStreamer();
        
    public:
        explicit WDC65816AsmPrinter(TargetMachine &TM, MCStreamer &Streamer)
        : AsmPrinter(TM, Streamer) {}
        
        virtual const char *getPassName() const {
            return "WDC65816 Assembly Printer";
        }
        
        void printInstruction(const MachineInstr *MI, raw_ostream &OS);// autogen'd.
        void printOperand(const MachineInstr *MI, int opNum, raw_ostream &OS);
        void printMemOperand(const MachineInstr *MI, int opNum, raw_ostream &OS,
                             const char *Modifier = 0);
        
        bool printGetPCX(const MachineInstr *MI, unsigned OpNo, raw_ostream &OS);
        
        static const char *getRegisterName(unsigned RegNo);
        
        virtual void EmitStartOfAsmFile(Module &module);
        virtual void EmitEndOfAsmFile(Module &module);
        virtual void EmitFunctionEntryLabel();
        
        virtual void EmitInstruction(const MachineInstr *MI) {
            SmallString<128> Str;
            raw_svector_ostream OS(Str);
            printInstruction(MI, OS);
            
            WDC65816TargetStreamer &streamer = getTargetStreamer();
            streamer.EmitInstruction(OS.str());
        }
        
    };
} // end of anonymous namespace

#include "WDC65816GenAsmWriter.inc"



WDC65816TargetStreamer &WDC65816AsmPrinter::getTargetStreamer() {
    return static_cast<WDC65816TargetStreamer &>(OutStreamer.getTargetStreamer());
}


void WDC65816AsmPrinter::EmitStartOfAsmFile(Module &module)
{
    WDC65816TargetStreamer &streamer = getTargetStreamer();
    
    streamer.EmitCaseDirective();
    streamer.EmitKeepDirective(module.getModuleIdentifier());
    streamer.EmitSegStartDirective(module.getModuleIdentifier());
}


void WDC65816AsmPrinter::EmitEndOfAsmFile(Module &module)
{
    WDC65816TargetStreamer &streamer = getTargetStreamer();
    
    streamer.EmitSegEndDirective();
}


void WDC65816AsmPrinter::printOperand(const MachineInstr *MI, int opNum,
                                      raw_ostream &O) {
    const MachineOperand &MO = MI->getOperand(opNum);
    switch (MO.getType()) {
        default: llvm_unreachable("Not implemented yet!");
        case MachineOperand::MO_Register:
            O << StringRef(getRegisterName(MO.getReg()));
            return;
        case MachineOperand::MO_Immediate:
            O << "#" << MO.getImm();
            return;
        case MachineOperand::MO_MachineBasicBlock:
            O << *MO.getMBB()->getSymbol();
            return;
        case MachineOperand::MO_GlobalAddress: {
            O << *getSymbol(MO.getGlobal());
            return;
        }
        case MachineOperand::MO_ExternalSymbol: {
            O << MAI->getGlobalPrefix() << MO.getSymbolName();
            return;
        }
    }
}


void WDC65816AsmPrinter::printMemOperand(const MachineInstr *MI, int opNum,
                                         raw_ostream &O, const char *Modifier) {
    WDC_LOG("WDC_TODO - Unimplemented method called");
}


bool WDC65816AsmPrinter::printGetPCX(const MachineInstr *MI, unsigned opNum,
                                     raw_ostream &O) {
    WDC_LOG("WDC_TODO - Unimplemented method called");
    return true;
}


void WDC65816AsmPrinter::EmitFunctionEntryLabel() {
    WDC65816TargetStreamer &streamer = getTargetStreamer();
    streamer.EmitFunctionEntryLabel(CurrentFnSym->getName());
}

// Force static initialization.
extern "C" void LLVMInitializeWDC65816AsmPrinter() {
    RegisterAsmPrinter<WDC65816AsmPrinter> X(TheWDC65816Target);
    WDC_LOG("Assembly printer registered");
}
