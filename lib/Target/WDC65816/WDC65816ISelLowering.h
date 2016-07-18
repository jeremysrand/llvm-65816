//===- WDC65816ISelLowering.h - WDC65816 DAG Lowering Interface -*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file defines the interfaces that WDC65816 uses to lower LLVM code into a
// selection DAG.
//
//===----------------------------------------------------------------------===//

#ifndef WDC65816_ISELLOWERING_H
#define WDC65816_ISELLOWERING_H

#include "WDC65816.h"
#include "llvm/Target/TargetLowering.h"

namespace llvm {
    namespace WDCISD {
        enum {
            FIRST_NUMBER = ISD::BUILTIN_OP_END,
            RET_FLAG,    // Return with a flag operand.
            Wrapper
#if 0
            CMPICC,      // Compare two GPR operands, set icc+xcc.
            CMPFCC,      // Compare two FP operands, set fcc.
            BRICC,       // Branch to dest on icc condition
            BRXCC,       // Branch to dest on xcc condition (64-bit only).
            BRFCC,       // Branch to dest on fcc condition
            SELECT_ICC,  // Select between two values using the current ICC flags.
            SELECT_XCC,  // Select between two values using the current XCC flags.
            SELECT_FCC,  // Select between two values using the current FCC flags.
            
            Hi, Lo,      // Hi/Lo operations, typically on a global address.
            
            FTOI,        // FP to Int within a FP register.
            ITOF,        // Int to FP within a FP register.
            FTOX,        // FP to Int64 within a FP register.
            XTOF,        // Int64 to FP within a FP register.
            
            CALL,        // A call instruction.
            GLOBAL_BASE_REG, // Global base reg for PIC.
            FLUSHW,      // FLUSH register windows to stack.
            
            TLS_ADD,     // For Thread Local Storage (TLS).
            TLS_LD,
            TLS_CALL
#endif
        };
    }
    
    class WDC65816TargetLowering : public TargetLowering {
    public:
        WDC65816TargetLowering(TargetMachine &TM);
        
        virtual SDValue
        LowerFormalArguments(SDValue Chain,
                             CallingConv::ID CallConv,
                             bool isVarArg,
                             const SmallVectorImpl<ISD::InputArg> &Ins,
                             SDLoc dl, SelectionDAG &DAG,
                             SmallVectorImpl<SDValue> &InVals) const;
        
        virtual SDValue
        LowerReturn(SDValue Chain,
                    CallingConv::ID CallConv, bool isVarArg,
                    const SmallVectorImpl<ISD::OutputArg> &Outs,
                    const SmallVectorImpl<SDValue> &OutVals,
                    SDLoc dl, SelectionDAG &DAG) const;
        
        virtual const char *getTargetNodeName(unsigned Opcode) const;
        SDValue LowerGlobalAddress(SDValue Op, SelectionDAG &DAG) const;
        
        virtual void ReplaceNodeResults(SDNode *N, SmallVectorImpl<SDValue>&Results,
                                        SelectionDAG &DAG) const;
        
        virtual void LowerOperationWrapper(SDNode *N,
                                           SmallVectorImpl<SDValue> &Results,
                                           SelectionDAG &DAG) const;
        virtual SDValue LowerOperation(SDValue Op, SelectionDAG &DAG) const;
    };
} // end namespace llvm

#endif    // WDC65816_ISELLOWERING_H
