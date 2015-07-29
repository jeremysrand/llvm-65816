//===- WDC65816MachineFunctionInfo.h - WDC65816 Machine Function Info -*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file declares  WDC65816 specific per-machine-function information.
//
//===----------------------------------------------------------------------===//
#ifndef WDC65816MACHINEFUNCTIONINFO_H
#define WDC65816MACHINEFUNCTIONINFO_H

#include "WDC65816.h"
#include "llvm/CodeGen/MachineFunction.h"

namespace llvm {
    
    class WDC65816MachineFunctionInfo : public MachineFunctionInfo {
        
        virtual void anchor();
    private:
        unsigned GlobalBaseReg;
#if 0 // WDC_TODO - Do I need any of this
        
        /// VarArgsFrameOffset - Frame offset to start of varargs area.
        int VarArgsFrameOffset;
        
        /// SRetReturnReg - Holds the virtual register into which the sret
        /// argument is passed.
        unsigned SRetReturnReg;
        
        /// IsLeafProc - True if the function is a leaf procedure.
        bool IsLeafProc;
#endif
        
    public:
        WDC65816MachineFunctionInfo()
            : GlobalBaseReg(0) {}
#if 0 // WDC_TODO - Disable these members for now
        , VarArgsFrameOffset(0), SRetReturnReg(0),
        IsLeafProc(false) {}
#endif
        
        
        unsigned getGlobalBaseReg() const {
            WDC_LOG("Returning %u", GlobalBaseReg);
            return GlobalBaseReg;
        }
        
        void setGlobalBaseReg(unsigned Reg) {
            WDC_LOG("Setting global base register to %u", Reg);
            GlobalBaseReg = Reg;
        }
        
        explicit WDC65816MachineFunctionInfo(MachineFunction &MF)
            : GlobalBaseReg(0) {}
#if 0 // WDC_TODO - Disable these members for now
        , VarArgsFrameOffset(0), SRetReturnReg(0),
        IsLeafProc(false) {}

        
        int getVarArgsFrameOffset() const { return VarArgsFrameOffset; }
        void setVarArgsFrameOffset(int Offset) { VarArgsFrameOffset = Offset; }
        
        unsigned getSRetReturnReg() const { return SRetReturnReg; }
        void setSRetReturnReg(unsigned Reg) { SRetReturnReg = Reg; }
        
        void setLeafProc(bool rhs) { IsLeafProc = rhs; }
        bool isLeafProc() const { return IsLeafProc; }
#endif
    };
}

#endif
