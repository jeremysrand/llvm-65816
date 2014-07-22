//===- WDCInstrInfo.td - Target Description for WDC 65816 Target ------------===//
// 
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
// 
//===----------------------------------------------------------------------===//
//
// This file describes the WDC 65816 instructions in TableGen format.
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Instruction format superclass
//===----------------------------------------------------------------------===//

include "WDC65816InstrFormats.td"

//===----------------------------------------------------------------------===//
// Feature predicates.
//===----------------------------------------------------------------------===//



//===----------------------------------------------------------------------===//
// Instruction Pattern Stuff
//===----------------------------------------------------------------------===//

// Adressing modes.
//def ADDRabs : ComplexPattern<i16, 1, "SelectAbs", [], []>;
//def ADDRabsl : ComplexPattern<i32, 1, "SelectAbsLong", [], []>;
//def ADDRdp : ComplexPattern<i8, 1, "SelectDirectPage", [], []>;

def addr      : ComplexPattern<iPTR, 5, "SelectAddr", [], [SDNPWantParent]>;

// Address operands
def ADDRabs : Operand<iPTR> {
  let PrintMethod = "printMemOperand";
  //let MIOperandInfo = (ops ptr_rc, ptr_rc);
}

def ADDRabsl : Operand<iPTR> {
  let PrintMethod = "printMemOperand";
  //let MIOperandInfo = (ops ptr_rc, ptr_rc);
}

def ADDRdp : Operand<iPTR> {
  let PrintMethod = "printMemOperand";
  //let MIOperandInfo = (ops ptr_rc, ptr_rc);
}

//===----------------------------------------------------------------------===//
// WDC 65816 Flag Conditions
//===----------------------------------------------------------------------===//

// Note that these values must be kept in sync with the CCOp::CondCode enum
// values.


//===----------------------------------------------------------------------===//
// Instruction Class Templates
//===----------------------------------------------------------------------===//



//===----------------------------------------------------------------------===//
// Instructions
//===----------------------------------------------------------------------===//


// Group #1 Instructions

// JSR TODO - Need to set all of the DAG patterns
// JSR TODO - Addresses are 32-bit to llvm but can we toss the upper byte for long addressing modes which are 24-bit
// JSR TODO - Need to specify flag behaviour, especially carry for ADC, SBC, CMP

def ADCimm : Group1<OpGrp1ADC, AddrModeGrp1Imm,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, i16imm:$src2),
                  "ADC #>$src2",
                  [(set AccRegs:$dst, (add AccRegs:$src1, i16:$src2))]>;

def ADCabs :  Group1<OpGrp1ADC, AddrModeGrp1Abs,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabs:$src2),
                  "ADC |$src2",
                  [(set AccRegs:$dst, (add AccRegs:$src1, (load addr:$src2)))]>;   

def ADCabsl :  Group1<OpGrp1ADC, AddrModeGrp1AbsLong,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabsl:$src2),
                  "ADC >$src2",
                  [(set AccRegs:$dst, (add AccRegs:$src1, (load addr:$src2)))]>;

def ADCdp :  Group1<OpGrp1ADC, AddrModeGrp1DP,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2),
                  "ADC <$src2",
                  [(set AccRegs:$dst, (add AccRegs:$src1, (load addr:$src2)))]>;

def ADCdpindir :  Group1<OpGrp1ADC, AddrModeGrp1DPIndir,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2),
                  "ADC (<$src2)",
                  []>;  

def ADCdpindirl :  Group1<OpGrp1ADC, AddrModeGrp1DPIndirLong,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2),
                  "ADC [<$src2]",
                  []>;  

def ADCabsix :  Group1<OpGrp1ADC, AddrModeGrp1AbsIdxX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabs:$src2, IndexXRegs:$src3),
                  "ADC |$src2,$src3",
                  []>;   

def ADCabsiy :  Group1<OpGrp1ADC, AddrModeGrp1AbsIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabs:$src2, IndexYRegs:$src3),
                  "ADC |$src2,$src3",
                  []>;  

def ADCabsixl :  Group1<OpGrp1ADC, AddrModeGrp1AbsLongIdxX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabsl:$src2, IndexXRegs:$src3),
                  "ADC >$src2,$src3",
                  []>; 

def ADCdpix :  Group1<OpGrp1ADC, AddrModeGrp1DPIdxX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexXRegs:$src3),
                  "ADC <$src2,$src3",
                  []>;  

def ADCdpiindirx :  Group1<OpGrp1ADC, AddrModeGrp1DPIdxIndirX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexXRegs:$src3),
                  "ADC (<$src2,$src3)",
                  []>; 

def ADCdpindiriy :  Group1<OpGrp1ADC, AddrModeGrp1DPIndirIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexYRegs:$src3),
                  "ADC (<$src2),$src3",
                  []>;

def ADCdpindirliy :  Group1<OpGrp1ADC, AddrModeGrp1DPIndirLongIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexYRegs:$src3),
                  "ADC [<$src2],$src3",
                  []>; 

def ADCsr :  Group1<OpGrp1ADC, AddrModeGrp1StackRel,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2),
                  "ADC <$src2,S",
                  []>;  

def ADCsrindir :  Group1<OpGrp1ADC, AddrModeGrp1StackRelIndirIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexYRegs:$src3),
                  "ADC (<$src2,S),$src3",
                  []>;                

def ANDimm : Group1<OpGrp1AND, AddrModeGrp1Imm,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, i16imm:$src2),
                  "AND #>$src2",
                  [(set AccRegs:$dst, (and AccRegs:$src1, i16:$src2))]>;

def ANDabs :  Group1<OpGrp1AND, AddrModeGrp1Abs,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabs:$src2),
                  "AND |$src2",
                  [(set AccRegs:$dst, (and AccRegs:$src1, (load addr:$src2)))]>;

def ANDabsl :  Group1<OpGrp1AND, AddrModeGrp1AbsLong,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabsl:$src2),
                  "AND >$src2",
                  [(set AccRegs:$dst, (and AccRegs:$src1, (load addr:$src2)))]>;

def ANDdp :  Group1<OpGrp1AND, AddrModeGrp1DP,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2),
                  "AND <$src2",
                  [(set AccRegs:$dst, (and AccRegs:$src1, (load addr:$src2)))]>;

def ANDdpindir :  Group1<OpGrp1AND, AddrModeGrp1DPIndir,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2),
                  "AND (<$src2)",
                  []>;  

def ANDdpindirl :  Group1<OpGrp1AND, AddrModeGrp1DPIndirLong,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2),
                  "AND [<$src2]",
                  []>;  

def ANDabsix :  Group1<OpGrp1AND, AddrModeGrp1AbsIdxX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabs:$src2, IndexXRegs:$src3),
                  "AND |$src2,$src3",
                  []>;   

def ANDabsiy :  Group1<OpGrp1AND, AddrModeGrp1AbsIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabs:$src2, IndexYRegs:$src3),
                  "AND |$src2,$src3",
                  []>;  

def ANDabsixl :  Group1<OpGrp1AND, AddrModeGrp1AbsLongIdxX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabsl:$src2, IndexXRegs:$src3),
                  "AND >$src2,$src3",
                  []>; 

def ANDdpix :  Group1<OpGrp1AND, AddrModeGrp1DPIdxX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexXRegs:$src3),
                  "AND <$src2,$src3",
                  []>;  

def ANDdpiindirx :  Group1<OpGrp1AND, AddrModeGrp1DPIdxIndirX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexXRegs:$src3),
                  "AND (<$src2,$src3)",
                  []>; 

def ANDdpindiriy :  Group1<OpGrp1AND, AddrModeGrp1DPIndirIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexYRegs:$src3),
                  "AND (<$src2),$src3",
                  []>;

def ANDdpindirliy :  Group1<OpGrp1AND, AddrModeGrp1DPIndirLongIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexYRegs:$src3),
                  "AND [<$src2],$src2",
                  []>; 

def ANDsr :  Group1<OpGrp1AND, AddrModeGrp1StackRel,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2),
                  "AND <$src2,S",
                  []>;  

def ANDsrindir :  Group1<OpGrp1AND, AddrModeGrp1StackRelIndirIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexYRegs:$src3),
                  "AND (<$src2,S),$src3",
                  []>;  

def CMPimm : Group1<OpGrp1CMP, AddrModeGrp1Imm,
                  (outs ), (ins AccRegs:$src1, i16imm:$src2),
                  "CMP #>$src2",
                  []>;

def CMPabs :  Group1<OpGrp1CMP, AddrModeGrp1Abs,
                  (outs ), (ins AccRegs:$src1, ADDRabs:$src2),
                  "CMP |$src2",
                  []>;   

def CMPabsl :  Group1<OpGrp1CMP, AddrModeGrp1AbsLong,
                  (outs ), (ins AccRegs:$src1, ADDRabsl:$src2),
                  "CMP >$src2",
                  []>;  

def CMPdp :  Group1<OpGrp1CMP, AddrModeGrp1DP,
                  (outs ), (ins AccRegs:$src1, ADDRdp:$src2),
                  "CMP <$src2",
                  []>; 

def CMPdpindir :  Group1<OpGrp1CMP, AddrModeGrp1DPIndir,
                  (outs ), (ins AccRegs:$src1, ADDRdp:$src2),
                  "CMP (<$src2)",
                  []>;  

def CMPdpindirl :  Group1<OpGrp1CMP, AddrModeGrp1DPIndirLong,
                  (outs ), (ins AccRegs:$src1, ADDRdp:$src2),
                  "CMP [<$src2]",
                  []>;  

def CMPabsix :  Group1<OpGrp1CMP, AddrModeGrp1AbsIdxX,
                  (outs ), (ins AccRegs:$src1, ADDRabs:$src2, IndexXRegs:$src3),
                  "CMP |$src2,$src3",
                  []>;   

def CMPabsiy :  Group1<OpGrp1CMP, AddrModeGrp1AbsIdxY,
                  (outs ), (ins AccRegs:$src1, ADDRabs:$src2, IndexYRegs:$src3),
                  "CMP |$src2,$src3",
                  []>;  

def CMPabsixl :  Group1<OpGrp1CMP, AddrModeGrp1AbsLongIdxX,
                  (outs ), (ins AccRegs:$src1, ADDRabsl:$src2, IndexXRegs:$src3),
                  "CMP >$src2,$src3",
                  []>; 

def CMPdpix :  Group1<OpGrp1CMP, AddrModeGrp1DPIdxX,
                  (outs ), (ins AccRegs:$src1, ADDRdp:$src2, IndexXRegs:$src3),
                  "CMP <$src2,$src3",
                  []>;  

def CMPdpiindirx :  Group1<OpGrp1CMP, AddrModeGrp1DPIdxIndirX,
                  (outs ), (ins AccRegs:$src1, ADDRdp:$src2, IndexXRegs:$src3),
                  "CMP (<$src2,$src3)",
                  []>; 

def CMPdpindiriy :  Group1<OpGrp1CMP, AddrModeGrp1DPIndirIdxY,
                  (outs ), (ins AccRegs:$src1, ADDRdp:$src2, IndexYRegs:$src3),
                  "CMP (<$src2),$src3",
                  []>;

def CMPdpindirliy :  Group1<OpGrp1CMP, AddrModeGrp1DPIndirLongIdxY,
                  (outs ), (ins AccRegs:$src1, ADDRdp:$src2, IndexYRegs:$src3),
                  "CMP [<$src2],$src3",
                  []>; 

def CMPsr :  Group1<OpGrp1CMP, AddrModeGrp1StackRel,
                  (outs ), (ins AccRegs:$src1, ADDRdp:$src2),
                  "CMP <$src2,S",
                  []>;  

def CMPsrindir :  Group1<OpGrp1CMP, AddrModeGrp1StackRelIndirIdxY,
                  (outs ), (ins AccRegs:$src1, ADDRdp:$src2, IndexYRegs:$src3),
                  "CMP (<$src2,S),$src3",
                  []>;                 

def EORimm : Group1<OpGrp1EOR, AddrModeGrp1Imm,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, i16imm:$src2),
                  "EOR #>$src2",
                  [(set AccRegs:$dst, (xor AccRegs:$src1, i16:$src2))]>;

def EORabs :  Group1<OpGrp1EOR, AddrModeGrp1Abs,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabs:$src2),
                  "EOR |$src2",
                  [(set AccRegs:$dst, (xor AccRegs:$src1, (load addr:$src2)))]>;

def EORabsl :  Group1<OpGrp1EOR, AddrModeGrp1AbsLong,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabsl:$src2),
                  "EOR >$src2",
                  [(set AccRegs:$dst, (xor AccRegs:$src1, (load addr:$src2)))]>;

def EORdp :  Group1<OpGrp1EOR, AddrModeGrp1DP,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2),
                  "EOR <$src2",
                  [(set AccRegs:$dst, (xor AccRegs:$src1, (load addr:$src2)))]>;

def EORdpindir :  Group1<OpGrp1EOR, AddrModeGrp1DPIndir,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2),
                  "EOR (<$src2)",
                  []>;  

def EORdpindirl :  Group1<OpGrp1EOR, AddrModeGrp1DPIndirLong,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2),
                  "EOR [<$src2]",
                  []>;  

def EORabsix :  Group1<OpGrp1EOR, AddrModeGrp1AbsIdxX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabs:$src2, IndexXRegs:$src3),
                  "EOR |$src2,$src3",
                  []>;   

def EORabsiy :  Group1<OpGrp1EOR, AddrModeGrp1AbsIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabs:$src2, IndexYRegs:$src3),
                  "EOR |$src2,$src3",
                  []>;  

def EORabsixl :  Group1<OpGrp1EOR, AddrModeGrp1AbsLongIdxX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabsl:$src2, IndexXRegs:$src3),
                  "EOR >$src2,$src3",
                  []>; 

def EORdpix :  Group1<OpGrp1EOR, AddrModeGrp1DPIdxX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexXRegs:$src3),
                  "EOR <$src2,$src3",
                  []>;  

def EORdpiindirx :  Group1<OpGrp1EOR, AddrModeGrp1DPIdxIndirX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexXRegs:$src3),
                  "EOR (<$src2,$src3)",
                  []>; 

def EORdpindiriy :  Group1<OpGrp1EOR, AddrModeGrp1DPIndirIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexYRegs:$src3),
                  "EOR (<$src2),$src3",
                  []>;

def EORdpindirliy :  Group1<OpGrp1EOR, AddrModeGrp1DPIndirLongIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexYRegs:$src3),
                  "EOR [<$src2],$src2",
                  []>; 

def EORsr :  Group1<OpGrp1EOR, AddrModeGrp1StackRel,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2),
                  "EOR <$src2,S",
                  []>;  

def EORsrindir :  Group1<OpGrp1EOR, AddrModeGrp1StackRelIndirIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexYRegs:$src3),
                  "EOR (<$src2,S),$src3",
                  []>;                    

def LDAimm : Group1<OpGrp1LDA, AddrModeGrp1Imm,
                  (outs AccRegs:$dst), (ins i16imm:$src),
                  "LDA #>$src",
                  [(set AccRegs:$dst, i16:$src)]>;

def LDAabs :  Group1<OpGrp1LDA, AddrModeGrp1Abs,
                  (outs AccRegs:$dst), (ins ADDRabs:$src),
                  "LDA |$src",
                  [(set AccRegs:$dst, (load addr:$src))]>;

def LDAabsl :  Group1<OpGrp1LDA, AddrModeGrp1AbsLong,
                  (outs AccRegs:$dst), (ins ADDRabsl:$src),
                  "LDA >$src",
                  [(set AccRegs:$dst, (load addr:$src))]>;

def LDAdp :  Group1<OpGrp1LDA, AddrModeGrp1DP,
                  (outs AccRegs:$dst), (ins ADDRdp:$src),
                  "LDA <$src",
                  [(set AccRegs:$dst, (load addr:$src))]>;

def LDAdpindir :  Group1<OpGrp1LDA, AddrModeGrp1DPIndir,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2),
                  "LDA (<$src2)",
                  []>;  

def LDAdpindirl :  Group1<OpGrp1LDA, AddrModeGrp1DPIndirLong,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2),
                  "LDA [<$src2]",
                  []>;  

def LDAabsix :  Group1<OpGrp1LDA, AddrModeGrp1AbsIdxX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabs:$src2, IndexXRegs:$src3),
                  "LDA |$src2,$src3",
                  []>;   

def LDAabsiy :  Group1<OpGrp1LDA, AddrModeGrp1AbsIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabs:$src2, IndexYRegs:$src3),
                  "LDA |$src2,$src3",
                  []>;  

def LDAabsixl :  Group1<OpGrp1LDA, AddrModeGrp1AbsLongIdxX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabsl:$src2, IndexXRegs:$src3),
                  "LDA >$src2,$src3",
                  []>; 

def LDAdpix :  Group1<OpGrp1LDA, AddrModeGrp1DPIdxX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexXRegs:$src3),
                  "LDA <$src2,$src3",
                  []>;  

def LDAdpiindirx :  Group1<OpGrp1LDA, AddrModeGrp1DPIdxIndirX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexXRegs:$src3),
                  "LDA (<$src2,$src3)",
                  []>; 

def LDAdpindiriy :  Group1<OpGrp1LDA, AddrModeGrp1DPIndirIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexYRegs:$src3),
                  "LDA (<$src2),$src3",
                  []>;

def LDAdpindirliy :  Group1<OpGrp1LDA, AddrModeGrp1DPIndirLongIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexYRegs:$src3),
                  "LDA [<$src2],$src2",
                  []>; 

def LDAsr :  Group1<OpGrp1LDA, AddrModeGrp1StackRel,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2),
                  "LDA <$src2,S",
                  []>;  

def LDAsrindir :  Group1<OpGrp1LDA, AddrModeGrp1StackRelIndirIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexYRegs:$src3),
                  "LDA (<$src2,S),$src3",
                  []>;                       

def ORAimm : Group1<OpGrp1ORA, AddrModeGrp1Imm,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, i16imm:$src2),
                  "ORA #>$src2",
                  [(set AccRegs:$dst, (or AccRegs:$src1, i16:$src2))]>;

def ORAabs :  Group1<OpGrp1ORA, AddrModeGrp1Abs,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabs:$src2),
                  "ORA |$src2",
                  [(set AccRegs:$dst, (or AccRegs:$src1, (load addr:$src2)))]>;

def ORAabsl :  Group1<OpGrp1ORA, AddrModeGrp1AbsLong,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabsl:$src2),
                  "ORA >$src2",
                  [(set AccRegs:$dst, (or AccRegs:$src1, (load addr:$src2)))]>;

def ORAdp :  Group1<OpGrp1ORA, AddrModeGrp1DP,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2),
                  "ORA <$src2",
                  [(set AccRegs:$dst, (or AccRegs:$src1, (load addr:$src2)))]>;

def ORAdpindir :  Group1<OpGrp1ORA, AddrModeGrp1DPIndir,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2),
                  "ORA (<$src2)",
                  []>;  

def ORAdpindirl :  Group1<OpGrp1ORA, AddrModeGrp1DPIndirLong,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2),
                  "ORA [<$src2]",
                  []>;  

def ORAabsix :  Group1<OpGrp1ORA, AddrModeGrp1AbsIdxX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabs:$src2, IndexXRegs:$src3),
                  "ORA |$src2,$src3",
                  []>;   

def ORAabsiy :  Group1<OpGrp1ORA, AddrModeGrp1AbsIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabs:$src2, IndexYRegs:$src3),
                  "ORA |$src2,$src3",
                  []>;  

def ORAabsixl :  Group1<OpGrp1ORA, AddrModeGrp1AbsLongIdxX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabsl:$src2, IndexXRegs:$src3),
                  "ORA >$src2,$src3",
                  []>; 

def ORAdpix :  Group1<OpGrp1ORA, AddrModeGrp1DPIdxX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexXRegs:$src3),
                  "ORA <$src2,$src3",
                  []>;  

def ORAdpiindirx :  Group1<OpGrp1ORA, AddrModeGrp1DPIdxIndirX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexXRegs:$src3),
                  "ORA (<$src2,$src3)",
                  []>; 

def ORAdpindiriy :  Group1<OpGrp1ORA, AddrModeGrp1DPIndirIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexYRegs:$src3),
                  "ORA (<$src2),$src3",
                  []>;

def ORAdpindirliy :  Group1<OpGrp1ORA, AddrModeGrp1DPIndirLongIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexYRegs:$src3),
                  "ORA [<$src2],$src2",
                  []>; 

def ORAsr :  Group1<OpGrp1ORA, AddrModeGrp1StackRel,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2),
                  "ORA <$src2,S",
                  []>;  

def ORAsrindir :  Group1<OpGrp1ORA, AddrModeGrp1StackRelIndirIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexYRegs:$src3),
                  "ORA (<$src2,S),$src3",
                  []>;                        

def SBCimm : Group1<OpGrp1SBC, AddrModeGrp1Imm,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, i16imm:$src2),
                  "SBC #>$src2",
                  [(set AccRegs:$dst, (sub AccRegs:$src1, i16:$src2))]>;

def SBCabs :  Group1<OpGrp1SBC, AddrModeGrp1Abs,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabs:$src2),
                  "SBC |$src2",
                  [(set AccRegs:$dst, (sub AccRegs:$src1, (load addr:$src2)))]>;

def SBCabsl :  Group1<OpGrp1SBC, AddrModeGrp1AbsLong,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabsl:$src2),
                  "SBC >$src2",
                  [(set AccRegs:$dst, (sub AccRegs:$src1, (load addr:$src2)))]>;

def SBCdp :  Group1<OpGrp1SBC, AddrModeGrp1DP,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2),
                  "SBC <$src2",
                  [(set AccRegs:$dst, (sub AccRegs:$src1, (load addr:$src2)))]>;

def SBCdpindir :  Group1<OpGrp1SBC, AddrModeGrp1DPIndir,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2),
                  "SBC (<$src2)",
                  []>;  

def SBCdpindirl :  Group1<OpGrp1SBC, AddrModeGrp1DPIndirLong,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2),
                  "SBC [<$src2]",
                  []>;  

def SBCabsix :  Group1<OpGrp1SBC, AddrModeGrp1AbsIdxX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabs:$src2, IndexXRegs:$src3),
                  "SBC |$src2,$src3",
                  []>;   

def SBCabsiy :  Group1<OpGrp1SBC, AddrModeGrp1AbsIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabs:$src2, IndexYRegs:$src3),
                  "SBC |$src2,$src3",
                  []>;  

def SBCabsixl :  Group1<OpGrp1SBC, AddrModeGrp1AbsLongIdxX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabsl:$src2, IndexXRegs:$src3),
                  "SBC >$src2,$src3",
                  []>; 

def SBCdpix :  Group1<OpGrp1SBC, AddrModeGrp1DPIdxX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexXRegs:$src3),
                  "SBC <$src2,$src3",
                  []>;  

def SBCdpiindirx :  Group1<OpGrp1SBC, AddrModeGrp1DPIdxIndirX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexXRegs:$src3),
                  "SBC (<$src2,$src3)",
                  []>; 

def SBCdpindiriy :  Group1<OpGrp1SBC, AddrModeGrp1DPIndirIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexYRegs:$src3),
                  "SBC (<$src2),$src3",
                  []>;

def SBCdpindirliy :  Group1<OpGrp1SBC, AddrModeGrp1DPIndirLongIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexYRegs:$src3),
                  "SBC [<$src2],$src2",
                  []>; 

def SBCsr :  Group1<OpGrp1SBC, AddrModeGrp1StackRel,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2),
                  "SBC <$src2,S",
                  []>;  

def SBCsrindir :  Group1<OpGrp1SBC, AddrModeGrp1StackRelIndirIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexYRegs:$src3),
                  "SBC (<$src2,S),$src3",
                  []>;  

def STAabs :  Group1<OpGrp1STA, AddrModeGrp1Abs,
                  (outs ADDRabs:$dst), (ins AccRegs:$src),
                  "STA |$dst",
                  [(store AccRegs:$src, addr:$dst)]>;

def STAabsl :  Group1<OpGrp1STA, AddrModeGrp1AbsLong,
                  (outs ADDRabsl:$dst), (ins AccRegs:$src),
                  "STA >$dst",
                  [(store AccRegs:$src, ADDRabsl:$dst)]>;  

def STAdp :  Group1<OpGrp1STA, AddrModeGrp1DP,
                  (outs ADDRdp:$dst), (ins AccRegs:$src),
                  "STA <$dst",
                  [(store AccRegs:$src, ADDRdp:$dst)]>; 

def STAdpindir :  Group1<OpGrp1STA, AddrModeGrp1DPIndir,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2),
                  "STA (<$src2)",
                  []>;  

def STAdpindirl :  Group1<OpGrp1STA, AddrModeGrp1DPIndirLong,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2),
                  "STA [<$src2]",
                  []>;  

def STAabsix :  Group1<OpGrp1STA, AddrModeGrp1AbsIdxX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabs:$src2, IndexXRegs:$src3),
                  "STA |$src2,$src3",
                  []>;   

def STAabsiy :  Group1<OpGrp1STA, AddrModeGrp1AbsIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabs:$src2, IndexYRegs:$src3),
                  "STA |$src2,$src3",
                  []>;  

def STAabsixl :  Group1<OpGrp1STA, AddrModeGrp1AbsLongIdxX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRabsl:$src2, IndexXRegs:$src3),
                  "STA >$src2,$src3",
                  []>; 

def STAdpix :  Group1<OpGrp1STA, AddrModeGrp1DPIdxX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexXRegs:$src3),
                  "STA <$src2,$src3",
                  []>;  

def STAdpiindirx :  Group1<OpGrp1STA, AddrModeGrp1DPIdxIndirX,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexXRegs:$src3),
                  "STA (<$src2,$src3)",
                  []>; 

def STAdpindiriy :  Group1<OpGrp1STA, AddrModeGrp1DPIndirIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexYRegs:$src3),
                  "STA (<$src2),$src3",
                  []>;

def STAdpindirliy :  Group1<OpGrp1STA, AddrModeGrp1DPIndirLongIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexYRegs:$src3),
                  "STA [<$src2],$src2",
                  []>; 

def STAsr :  Group1<OpGrp1STA, AddrModeGrp1StackRel,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2),
                  "STA <$src2,S",
                  []>;  

def STAsrindir :  Group1<OpGrp1STA, AddrModeGrp1StackRelIndirIdxY,
                  (outs AccRegs:$dst), (ins AccRegs:$src1, ADDRdp:$src2, IndexYRegs:$src3),
                  "STA (<$src2,S),$src3",
                  []>;   

// Group #2 Instructions

def ASLacc : Group2<OpGrp2ASL, AddrModeGrp2Acc,
                  (outs AccRegs:$dst), (ins AccRegs:$src),
                  "ASL $src",
                  [(set AccRegs:$dst, (shl AccRegs:$src, (i16 1)))]>;
                  
def ASLabs : Group2<OpGrp2ASL, AddrModeGrp2Abs,
                  (outs ), (ins ADDRabs:$dst),
                  "ASL |$dst",
                  []>;
                  // JSR TODO - [(store (shl (load addr:$dst), (i16 1)), addr:$dst)]>;
                  
def ASLdp : Group2<OpGrp2ASL, AddrModeGrp2DP,
                  (outs ), (ins ADDRdp:$dst),
                  "ASL <$src",
                  []>;
                  // JSR TODO - [(store (shl (load addr:$dst), (i8 1)), addr:$dst)]>;
                  
def ASLabsix : Group2<OpGrp2ASL, AddrModeGrp2AbsIdx,
                  (outs ADDRabs:$dst), (ins ADDRabs:$src1, IndexXRegs:$src2),
                  "ASL |$src1,$src2",
                  []>;
                  
def ASLdpix : Group2<OpGrp2ASL, AddrModeGrp2DPIdx,
                  (outs ADDRabs:$dst), (ins ADDRdp:$src1, IndexXRegs:$src2),
                  "ASL <$src1,$src2",
                  []>;

def DECacc : Group2<OpGrp2DEC, AddrModeGrp2Acc,
                  (outs AccRegs:$dst), (ins AccRegs:$src),
                  "DEC $src",
                  [(set AccRegs:$dst, (sub AccRegs:$src, 1))]>;
                  
def DECabs : Group2<OpGrp2DEC, AddrModeGrp2Abs,
                  (outs ), (ins ADDRabs:$dst),
                  "DEC |$dst",
                  []>;
                  // JSR TODO - [(store (sub (load addr:$dst), 1), addr:$dst)]>;
                  
def DECdp : Group2<OpGrp2DEC, AddrModeGrp2DP,
                  (outs ), (ins ADDRdp:$dst),
                  "DEC <$dst",
                  []>;
                  // JSR TODO - [(store (sub (load addr:$dst), 1), addr:$dst)]>;
                  
def DECabsix : Group2<OpGrp2DEC, AddrModeGrp2AbsIdx,
                  (outs ADDRabs:$dst), (ins ADDRabs:$src1, IndexXRegs:$src2),
                  "DEC |$src1,$src2",
                  []>;
                  
def DECdpix : Group2<OpGrp2DEC, AddrModeGrp2DPIdx,
                  (outs ADDRabs:$dst), (ins ADDRdp:$src1, IndexXRegs:$src2),
                  "DEC <$src1,$src2",
                  []>;

def INCacc : Group2<OpGrp2INC, AddrModeGrp2Acc,
                  (outs AccRegs:$dst), (ins AccRegs:$src),
                  "INC $src",
                  [(set AccRegs:$dst, (add AccRegs:$src, 1))]>;
                  
def INCabs : Group2<OpGrp2INC, AddrModeGrp2Abs,
                  (outs ), (ins ADDRabs:$dst),
                  "INC |$dst",
                  []>;
                  // JSR TODO - [(store (add (load addr:$dst), 1), addr:$dst)]>;
                  
def INCdp : Group2<OpGrp2INC, AddrModeGrp2DP,
                  (outs ), (ins ADDRdp:$dst),
                  "INC <$dst",
                  []>;
                  // JSR TODO - [(store (add (load addr:$dst), 1), addr:$dst)]>;
                  
def INCabsix : Group2<OpGrp2INC, AddrModeGrp2AbsIdx,
                  (outs ADDRabs:$dst), (ins ADDRabs:$src1, IndexXRegs:$src2),
                  "INC |$src1,$src2",
                  []>;
                  
def INCdpix : Group2<OpGrp2INC, AddrModeGrp2DPIdx,
                  (outs ADDRabs:$dst), (ins ADDRdp:$src1, IndexXRegs:$src2),
                  "INC <$src1,$src2",
                  []>;

def LDXimm : Group2<OpGrp2LDXY, AddrModeGrp2Imm,
                  (outs IndexXRegs:$dst), (ins i16imm:$src),
                  "LDX #$src",
                  [(set IndexXRegs:$dst, i16:$src)]>;
                  
def LDXabs : Group2<OpGrp2LDXY, AddrModeGrp2Abs,
                  (outs IndexXRegs:$dst), (ins ADDRabs:$src),
                  "LDX |$src",
                  [(set IndexXRegs:$dst, (load addr:$src))]>;
                  
def LDXdp : Group2<OpGrp2LDXY, AddrModeGrp2DP,
                  (outs IndexXRegs:$dst), (ins ADDRdp:$src),
                  "LDX <$src",
                  [(set IndexXRegs:$dst, (load addr:$src))]>;
                  
def LDXabsiy : Group2<OpGrp2LDXY, AddrModeGrp2AbsIdx,
                  (outs IndexXRegs:$dst), (ins ADDRabs:$src1, IndexYRegs:$src2),
                  "LDX |$src1,$src2",
                  []>;
                  
def LDXdpiy : Group2<OpGrp2LDXY, AddrModeGrp2DPIdx,
                  (outs IndexXRegs:$dst), (ins ADDRdp:$src1, IndexYRegs:$src2),
                  "LDX <$src1,$src2",
                  []>;

def LDYimm : Group2_Y<OpGrp2LDXY, AddrModeGrp2Imm,
                  (outs IndexYRegs:$dst), (ins i16imm:$src),
                  "LDY #$src",
                  [(set IndexYRegs:$dst, i16:$src)]>;
                  
def LDYabs : Group2_Y<OpGrp2LDXY, AddrModeGrp2Abs,
                  (outs IndexYRegs:$dst), (ins ADDRabs:$src),
                  "LDY |$src",
                  [(set IndexYRegs:$dst, (load addr:$src))]>;
                  
def LDYdp : Group2_Y<OpGrp2LDXY, AddrModeGrp2DP,
                  (outs IndexYRegs:$dst), (ins ADDRdp:$src),
                  "LDY <$src",
                  [(set IndexYRegs:$dst, (load addr:$src))]>;
                  
def LDYabsix : Group2_Y<OpGrp2LDXY, AddrModeGrp2AbsIdx,
                  (outs IndexYRegs:$dst), (ins ADDRabs:$src1, IndexXRegs:$src2),
                  "LDY |$src1,$src2",
                  []>;
                  
def LDYdpix : Group2_Y<OpGrp2LDXY, AddrModeGrp2DPIdx,
                  (outs IndexYRegs:$dst), (ins ADDRdp:$src1, IndexXRegs:$src2),
                  "LDY <$src1,$src2",
                  []>;

def LSRacc : Group2<OpGrp2LSR, AddrModeGrp2Acc,
                  (outs AccRegs:$dst), (ins AccRegs:$src),
                  "LSR $src",
                  [(set AccRegs:$dst, (srl AccRegs:$src, (i8 1)))]>;
                  
def LSRabs : Group2<OpGrp2LSR, AddrModeGrp2Abs,
                  (outs ), (ins ADDRabs:$dst),
                  "LSR |$dst",
                  []>;
                  // JSR TODO - [(store (srl (load addr:$dst), (i8 1)), addr:$dst)]>;
                  
def LSRdp : Group2<OpGrp2LSR, AddrModeGrp2DP,
                  (outs ), (ins ADDRdp:$dst),
                  "LSR <$dst",
                  []>;
                  // JSR TODO - [(store (srl (load addr:$dst), (i8 1)), addr:$dst)]>;
                  
def LSRabsix : Group2<OpGrp2LSR, AddrModeGrp2AbsIdx,
                  (outs ADDRabs:$dst), (ins ADDRabs:$src1, IndexXRegs:$src2),
                  "LSR |$src1,$src2",
                  []>;
                  
def LSRdpix : Group2<OpGrp2LSR, AddrModeGrp2DPIdx,
                  (outs ADDRabs:$dst), (ins ADDRdp:$src1, IndexXRegs:$src2),
                  "LSR <$src1,$src2",
                  []>;

def ROLacc : Group2<OpGrp2ROL, AddrModeGrp2Acc,
                  (outs AccRegs:$dst), (ins AccRegs:$src),
                  "ROL $src",
                  [(set AccRegs:$dst, (rotl AccRegs:$src, (i8 1)))]>;
                  
def ROLabs : Group2<OpGrp2ROL, AddrModeGrp2Abs,
                  (outs ), (ins ADDRabs:$dst),
                  "ROL |$dst",
                  []>;
                  // JSR TODO - [(store (rotl (load addr:$dst), (i8 1)), addr:$dst)]>;
                  
def ROLdp : Group2<OpGrp2ROL, AddrModeGrp2DP,
                  (outs ), (ins ADDRdp:$dst),
                  "ROL <$dst",
                  []>;
                  // JSR TODO - [(store (rotl (load addr:$dst), (i8 1)), addr:$dst)]>;
                  
def ROLabsix : Group2<OpGrp2ROL, AddrModeGrp2AbsIdx,
                  (outs ADDRabs:$dst), (ins ADDRabs:$src1, IndexXRegs:$src2),
                  "ROL |$src1,$src2",
                  []>;
                  
def ROLdpix : Group2<OpGrp2ROL, AddrModeGrp2DPIdx,
                  (outs ADDRabs:$dst), (ins ADDRdp:$src1, IndexXRegs:$src2),
                  "ROL <$src1,$src2",
                  []>;

def RORacc : Group2<OpGrp2ROR, AddrModeGrp2Acc,
                  (outs AccRegs:$dst), (ins AccRegs:$src),
                  "ROR $src",
                  [(set AccRegs:$dst, (rotr AccRegs:$src, (i8 1)))]>;
                  
def RORabs : Group2<OpGrp2ROR, AddrModeGrp2Abs,
                  (outs ), (ins ADDRabs:$dst),
                  "ROR |$dst",
                  []>;
                  // JSR TODO - [(store (rotr (load addr:$dst), (i8 1)), addr:$dst)]>;
                  
def RORdp : Group2<OpGrp2ROR, AddrModeGrp2DP,
                  (outs ), (ins ADDRdp:$dst),
                  "ROR <$dst",
                  []>;
                  // JSR TODO - [(store (rotr (load addr:$dst), (i8 1)), addr:$dst)]>;
                  
def RORabsix : Group2<OpGrp2ROR, AddrModeGrp2AbsIdx,
                  (outs ADDRabs:$dst), (ins ADDRabs:$src1, IndexXRegs:$src2),
                  "ROR |$src1,$src2",
                  []>;
                  
def RORdpix : Group2<OpGrp2ROR, AddrModeGrp2DPIdx,
                  (outs ADDRabs:$dst), (ins ADDRdp:$src1, IndexXRegs:$src2),
                  "ROR <$src1,$src2",
                  []>;

def STXabs : Group2<OpGrp2STXY, AddrModeGrp2Abs,
                  (outs ADDRabs:$dst), (ins IndexXRegs:$src),
                  "STX |$dst",
                  [(store IndexXRegs:$src, ADDRabs:$dst)]>;
                  
def STXdp : Group2<OpGrp2STXY, AddrModeGrp2DP,
                  (outs ADDRdp:$dst), (ins IndexXRegs:$src),
                  "STX <$dst",
                  [(store IndexXRegs:$src, ADDRdp:$dst)]>;
                  
def STXdpiy : Group2<OpGrp2STXY, AddrModeGrp2DPIdx,
                  (outs ADDRabs:$dst), (ins IndexXRegs:$src1, IndexYRegs:$src2),
                  "STX <$dst,$src2",
                  []>;

def STYabs : Group2_Y<OpGrp2STXY, AddrModeGrp2Abs,
                  (outs ADDRabs:$dst), (ins IndexYRegs:$src),
                  "STY |$dst",
                  [(store IndexYRegs:$src, ADDRabs:$dst)]>;
                  
def STYdp : Group2_Y<OpGrp2STXY, AddrModeGrp2DP,
                  (outs ADDRdp:$dst), (ins IndexYRegs:$src),
                  "STY <$dst",
                  [(store IndexYRegs:$src, ADDRdp:$dst)]>;
                  
def STYdpix : Group2_Y<OpGrp2STXY, AddrModeGrp2DPIdx,
                  (outs ADDRabs:$dst), (ins IndexYRegs:$src1, IndexXRegs:$src2),
                  "STY <$dst,$src2",
                  []>;

                  
                  
// Group #3 Instructions

def BCC : Group3<OpGrp3BCC,
                  (outs ), (ins ADDRdp:$src),
                  "BCC <$src",
                  []>;

def BCS : Group3<OpGrp3BCS,
                  (outs ), (ins ADDRdp:$src),
                  "BCS <$src",
                  []>;

def BEQ : Group3<OpGrp3BEQ,
                  (outs ), (ins ADDRdp:$src),
                  "BEQ <$src",
                  []>;

def BITimm : Group3<OpGrp3BITImm,
                  (outs ), (ins AccRegs:$src1, i16imm:$src2),
                  "BIT #>$src2",
                  []>;
                  
def BITabs : Group3<OpGrp3BITAbs,
                  (outs ), (ins AccRegs:$src1, ADDRabs:$src2),
                  "BIT |$src2",
                  []>;
                  
def BITdp : Group3<OpGrp3BITDp,
                  (outs ), (ins AccRegs:$src1, ADDRdp:$src2),
                  "BIT <$src",
                  []>;
                  
def BITabsix : Group3<OpGrp3BITAbsi,
                  (outs ), (ins AccRegs:$src1, ADDRabs:$src2, IndexXRegs:$src3),
                  "ASL |$src2,$src3",
                  []>;
                  
def BITdpix : Group3<OpGrp3BITDpi,
                  (outs ), (ins AccRegs:$src1, ADDRdp:$src2, IndexXRegs:$src3),
                  "BIT <$src2,$src3",
                  []>;

def BMI : Group3<OpGrp3BMI,
                  (outs ), (ins ADDRdp:$src),
                  "BMI <$src",
                  []>;

def BNE : Group3<OpGrp3BNE,
                  (outs ), (ins ADDRdp:$src),
                  "BNE <$src",
                  []>;

def BPL : Group3<OpGrp3BPL,
                  (outs ), (ins ADDRdp:$src),
                  "BPL <$src",
                  []>;

def BRA : Group3<OpGrp3BRA,
                  (outs ), (ins ADDRdp:$src),
                  "BRA <$src",
                  []>;

def BRK : Group3<OpGrp3BRK,
                  (outs ), (ins i8imm:$src),
                  "BRK <$src",
                  []>;

def BRL : Group3<OpGrp3BRL,
                  (outs ), (ins ADDRabs:$src),
                  "BRL |$src",
                  []>;

def BVC : Group3<OpGrp3BVC,
                  (outs ), (ins ADDRdp:$src),
                  "BVC <$src",
                  []>;

def BVS : Group3<OpGrp3BVS,
                  (outs ), (ins ADDRdp:$src),
                  "BVS <$src",
                  []>;

def CLC : Group3<OpGrp3CLC,
                  (outs ), (ins ),
                  "CLC",
                  []>;

def CLD : Group3<OpGrp3CLD,
                  (outs ), (ins ),
                  "CLD",
                  []>;

def CLI : Group3<OpGrp3CLI,
                  (outs ), (ins ),
                  "CLI",
                  []>;

def CLV : Group3<OpGrp3CLV,
                  (outs ), (ins ),
                  "CLV",
                  []>;

def COP : Group3<OpGrp3COP,
                  (outs ), (ins i8imm:$src),
                  "COP <$src",
                  []>;

def CPXimm : Group3<OpGrp3CPXimm,
                  (outs ), (ins IndexXRegs:$src1, i16imm:$src2),
                  "CPX #$src2",
                  []>;

def CPXabs :  Group3<OpGrp3CPXabs,
                  (outs ), (ins IndexXRegs:$src1, ADDRabs:$src2),
                  "CPX |$src2",
                  []>;    

def CPXdp :  Group3<OpGrp3CPXdp,
                  (outs ), (ins IndexXRegs:$src1, ADDRdp:$src2),
                  "CPX <$src2",
                  []>; 

def CPYimm : Group3<OpGrp3CPYimm,
                  (outs ), (ins IndexYRegs:$src1, i16imm:$src2),
                  "CPY #$src2",
                  []>;

def CPYabs :  Group3<OpGrp3CPYabs,
                  (outs ), (ins IndexYRegs:$src1, ADDRabs:$src2),
                  "CPY |$src2",
                  []>;    

def CPYdp :  Group3<OpGrp3CPYdp,
                  (outs ), (ins IndexYRegs:$src1, ADDRdp:$src2),
                  "CPY <$src2",
                  []>;  

def DEX :  Group3<OpGrp3DEX,
                  (outs IndexXRegs:$dst), (ins IndexXRegs:$src),
                  "DEX",
                  [(set IndexXRegs:$dst, (sub IndexXRegs:$src, 1))]>; 

def DEY :  Group3<OpGrp3DEY,
                  (outs IndexYRegs:$dst), (ins IndexYRegs:$src),
                  "DEY",
                  [(set IndexYRegs:$dst, (sub IndexYRegs:$src, 1))]>; 

def INX :  Group3<OpGrp3INX,
                  (outs IndexXRegs:$dst), (ins IndexXRegs:$src),
                  "INX",
                  [(set IndexXRegs:$dst, (add IndexXRegs:$src, 1))]>; 

def INY :  Group3<OpGrp3INY,
                  (outs IndexYRegs:$dst), (ins IndexYRegs:$src),
                  "INY",
                  [(set IndexYRegs:$dst, (add IndexYRegs:$src, 1))]>; 

def JMPabs : Group3<OpGrp3JMPabs,
                  (outs ), (ins ADDRabs:$src),
                  "JMP |$src",
                  []>;

def JMPindir : Group3<OpGrp3JMPindir,
                  (outs ), (ins ADDRabs:$src),
                  "JMP (|$src)",
                  []>;

def JMPindiri : Group3<OpGrp3JMPindiri,
                  (outs ), (ins ADDRabs:$src1, IndexXRegs:$src2),
                  "JMP (|$src1,$src2)",
                  []>;

def JMLabs : Group3<OpGrp3JMLabs,
                  (outs ), (ins ADDRabsl:$src),
                  "JML >$src",
                  []>;

def JMLindirl : Group3<OpGrp3JMLindir,
                  (outs ), (ins ADDRabsl:$src),
                  "JML [>$src]",
                  []>;

def JSL : Group3<OpGrp3JSL,
                  (outs ), (ins ADDRabsl:$src),
                  "JSL >$src",
                  []>;

def JSRabs : Group3<OpGrp3JSRabs,
                  (outs ), (ins ADDRabs:$src),
                  "JSR |$src",
                  []>;

def JSRindiri : Group3<OpGrp3JSRindiri,
                  (outs ), (ins ADDRabs:$src1, IndexXRegs:$src2),
                  "JSR (|$src1,$src2)",
                  []>;

def MVN : Group3<OpGrp3MVN,
                  (outs ), (ins ADDRdp:$src1, ADDRdp:$src2, AccRegs:$src3, IndexXRegs:$src4, IndexYRegs:$src5),
                  "MVN <$src1,<$src2",
                  []>;

def MVP : Group3<OpGrp3MVP,
                  (outs ), (ins ADDRdp:$src1, ADDRdp:$src2, AccRegs:$src3, IndexXRegs:$src4, IndexYRegs:$src5),
                  "MVP <$src1,<$src2",
                  []>;

def NOP : Group3<OpGrp3NOP,
                  (outs ), (ins ),
                  "NOP",
                  []>;

def PEA : Group3<OpGrp3PEA,
                  (outs ), (ins i16imm:$src),
                  "PEA |$src",
                  []>;

def PEI : Group3<OpGrp3PEI,
                  (outs ), (ins i8imm:$src),
                  "PEI (<$src)",
                  []>;

def PER : Group3<OpGrp3PER,
                  (outs ), (ins i16imm:$src),
                  "PER |$src",
                  []>;

def PHA : Group3<OpGrp3PHA,
                  (outs ), (ins AccRegs:$src),
                  "PHA",
                  []>;

def PHB : Group3<OpGrp3PHB,
                  (outs ), (ins ),
                  "PHB",
                  []>;

def PHD : Group3<OpGrp3PHD,
                  (outs ), (ins ),
                  "PHD",
                  []>;

def PHK : Group3<OpGrp3PHK,
                  (outs ), (ins ),
                  "PHK",
                  []>;

def PHP : Group3<OpGrp3PHP,
                  (outs ), (ins ),
                  "PHP",
                  []>;

def PHX : Group3<OpGrp3PHX,
                  (outs ), (ins IndexXRegs:$src),
                  "PHX",
                  []>;

def PHY : Group3<OpGrp3PHY,
                  (outs ), (ins IndexYRegs:$src),
                  "PHY",
                  []>;

def PLA : Group3<OpGrp3PLA,
                  (outs AccRegs:$dst), (ins ),
                  "PLA",
                  []>;

def PLB : Group3<OpGrp3PLB,
                  (outs ), (ins ),
                  "PLB",
                  []>;

def PLD : Group3<OpGrp3PLD,
                  (outs ), (ins ),
                  "PLD",
                  []>;

def PLP : Group3<OpGrp3PLP,
                  (outs ), (ins ),
                  "PLP",
                  []>;

def PLX : Group3<OpGrp3PLX,
                  (outs IndexXRegs:$dst), (ins ),
                  "PLX",
                  []>;

def PLY : Group3<OpGrp3PLY,
                  (outs IndexYRegs:$dst), (ins ),
                  "PLY",
                  []>;

def REP : Group3<OpGrp3REP,
                  (outs ), (ins i8imm:$src),
                  "REP #$src",
                  []>;

def RTI : Group3<OpGrp3RTI,
                  (outs ), (ins ),
                  "RTI",
                  []>;

def RTL : Group3<OpGrp3RTL,
                  (outs ), (ins ),
                  "RTL",
                  []>;

def RTS : Group3<OpGrp3RTS,
                  (outs ), (ins ),
                  "RTS",
                  []>;

def SEC : Group3<OpGrp3SEC,
                  (outs ), (ins ),
                  "SEC",
                  []>;

def SED : Group3<OpGrp3SED,
                  (outs ), (ins ),
                  "SED",
                  []>;

def SEI : Group3<OpGrp3SEI,
                  (outs ), (ins ),
                  "SEI",
                  []>;

def SEP : Group3<OpGrp3SEP,
                  (outs ), (ins i8imm:$src),
                  "SEP #$src",
                  []>;

def STP : Group3<OpGrp3STP,
                  (outs ), (ins ),
                  "STP",
                  []>;

def STZabs :  Group3<OpGrp3STZabs,
                  (outs ADDRabs:$dst), (ins ),
                  "STZ |$dst",
                  [(store 0, ADDRabs:$dst)]>;    

def STZdp :  Group3<OpGrp3STZdp,
                  (outs ADDRdp:$dst), (ins ),
                  "STZ <$dst",
                  [(store 0, ADDRdp:$dst)]>; 

def STZabsi :  Group3<OpGrp3STZabsi,
                  (outs ), (ins ADDRabs:$src1, IndexXRegs:$src2),
                  "STZ |$src1,$src2",
                  []>;    

def STZdpi :  Group3<OpGrp3STZdpi,
                  (outs ), (ins ADDRdp:$src1, IndexXRegs:$src2),
                  "STZ <$src,$src2",
                  []>;  

def TAX :  Group3<OpGrp3TAX,
                  (outs IndexXRegs:$dst), (ins AccRegs:$src),
                  "TAX",
                  [(set IndexXRegs:$dst, AccRegs:$src)]>; 

def TAY :  Group3<OpGrp3TAY,
                  (outs IndexYRegs:$dst), (ins AccRegs:$src),
                  "TAY",
                  [(set IndexYRegs:$dst, AccRegs:$src)]>; 

def TCD :  Group3<OpGrp3TCD,
                  (outs DirectPageRegs:$dst), (ins AccRegs:$src),
                  "TCB",
                  [(set DirectPageRegs:$dst, AccRegs:$src)]>; 

def TCS :  Group3<OpGrp3TCS,
                  (outs StackPointerRegs:$dst), (ins AccRegs:$src),
                  "TCS",
                  [(set StackPointerRegs:$dst, AccRegs:$src)]>; 

def TDC :  Group3<OpGrp3TDC,
                  (outs AccRegs:$dst), (ins DirectPageRegs:$src),
                  "TDC",
                  [(set AccRegs:$dst, DirectPageRegs:$src)]>; 

def TRBabs :  Group3<OpGrp3TRBabs,
                  (outs ), (ins ADDRabs:$src1, AccRegs:$src2),
                  "TRB |$src1",
                  []>; 

def TRBdp :  Group3<OpGrp3TRBdp,
                  (outs ), (ins ADDRdp:$src1, AccRegs:$src2),
                  "TRB <$src1",
                  []>; 

def TSBabs :  Group3<OpGrp3TSBabs,
                  (outs ), (ins ADDRabs:$src1, AccRegs:$src2),
                  "TSB |$src1",
                  []>; 

def TSBdp :  Group3<OpGrp3TSBdp,
                  (outs ), (ins ADDRdp:$src1, AccRegs:$src2),
                  "TSB <$src1",
                  []>; 

def TSC :  Group3<OpGrp3TSC,
                  (outs AccRegs:$dst), (ins StackPointerRegs:$src),
                  "TSC",
                  [(set AccRegs:$dst, StackPointerRegs:$src)]>; 

def TSX :  Group3<OpGrp3TSX,
                  (outs IndexXRegs:$dst), (ins StackPointerRegs:$src),
                  "TSX",
                  [(set IndexXRegs:$dst, StackPointerRegs:$src)]>; 

def TXA :  Group3<OpGrp3TXA,
                  (outs AccRegs:$dst), (ins IndexXRegs:$src),
                  "TXA",
                  [(set AccRegs:$dst, IndexXRegs:$src)]>; 

def TXS :  Group3<OpGrp3TXS,
                  (outs StackPointerRegs:$dst), (ins IndexXRegs:$src),
                  "TXS",
                  [(set StackPointerRegs:$dst, IndexXRegs:$src)]>; 

def TXY :  Group3<OpGrp3TXY,
                  (outs IndexYRegs:$dst), (ins IndexXRegs:$src),
                  "TXY",
                  [(set IndexYRegs:$dst, IndexXRegs:$src)]>; 

def TYA :  Group3<OpGrp3TYA,
                  (outs AccRegs:$dst), (ins IndexYRegs:$src),
                  "TYA",
                  [(set AccRegs:$dst, IndexYRegs:$src)]>; 

def TYX :  Group3<OpGrp3TYX,
                  (outs IndexXRegs:$dst), (ins IndexYRegs:$src),
                  "TYX",
                  [(set IndexXRegs:$dst, IndexYRegs:$src)]>; 

def WAI :  Group3<OpGrp3WAI,
                  (outs ), (ins ),
                  "WAI",
                  []>; 

def WDM :  Group3<OpGrp3WDM,
                  (outs ), (ins i8imm:$src),
                  "WDM $src",
                  []>; 

def XBA :  Group3<OpGrp3XBA,
                  (outs AccRegs:$dst), (ins AccRegs:$src),
                  "XBA",
                  []>; 

def XCE :  Group3<OpGrp3XCE,
                  (outs ), (ins ),
                  "XCE",
                  []>; 


//===----------------------------------------------------------------------===//
// Non-Instruction Patterns
//===----------------------------------------------------------------------===//

