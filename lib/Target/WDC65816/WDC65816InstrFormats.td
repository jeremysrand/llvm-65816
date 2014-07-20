//===- WDCInstrFormats.td - WDC 65816 Instruction Formats ----*- tablegen -*-===//
// 
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
// 
//===----------------------------------------------------------------------===//

class InstWDC<dag outs, dag ins, string asmstr, list<dag> pattern> : Instruction {
  field bits<8> Inst;

  let Namespace = "WDC";
  
  dag OutOperandList = outs;
  dag InOperandList = ins;
  let AsmString   = asmstr;
  let Pattern = pattern;
}

//===----------------------------------------------------------------------===//
// Group #1 instructions in the WDC 65816
//===----------------------------------------------------------------------===//

class OpGrp1<bits<3> val> {
  bits<3> Value = val;
}

def OpGrp1ADC     : OpGrp1<3>;
def OpGrp1AND     : OpGrp1<1>;
def OpGrp1CMP     : OpGrp1<6>;
def OpGrp1EOR     : OpGrp1<2>;
def OpGrp1LDA     : OpGrp1<5>;
def OpGrp1ORA     : OpGrp1<0>;
def OpGrp1SBC     : OpGrp1<7>;
def OpGrp1STA     : OpGrp1<4>;


class AddrModeGrp1<bits<5> val> {
  bits<5> Value = val;
}

def AddrModeGrp1Imm               : AddrModeGrp1<9>;
def AddrModeGrp1DP                : AddrModeGrp1<5>;
def AddrModeGrp1Abs               : AddrModeGrp1<13>;
def AddrModeGrp1DPIdxX            : AddrModeGrp1<21>;
def AddrModeGrp1AbsIdxX           : AddrModeGrp1<29>;
def AddrModeGrp1AbsIdxY           : AddrModeGrp1<25>;
def AddrModeGrp1DPIdxIndirX       : AddrModeGrp1<1>;
def AddrModeGrp1DPIndirIdxY       : AddrModeGrp1<17>;
def AddrModeGrp1DPIndir           : AddrModeGrp1<18>;
def AddrModeGrp1DPIndirLongIdxY   : AddrModeGrp1<23>;
def AddrModeGrp1DPIndirLong       : AddrModeGrp1<7>;
def AddrModeGrp1AbsLong           : AddrModeGrp1<15>;
def AddrModeGrp1AbsLongIdxX       : AddrModeGrp1<31>;
def AddrModeGrp1StackRel          : AddrModeGrp1<3>;
def AddrModeGrp1StackRelIndirIdxY : AddrModeGrp1<19>;


// Group 1 instructions
class Group1<OpGrp1 opVal, AddrModeGrp1 addrModeVal, dag outs, dag ins, string asmstr, list<dag> pattern>
   : InstWDC<outs, ins, asmstr, pattern> {
    OpGrp1 op = opVal;
    AddrModeGrp1 addrMode = addrModeVal;
   
    let Inst{7-5} = op.Value;
    let Inst{4-0}  = addrMode.Value;
}

//===----------------------------------------------------------------------===//
// Group #2 instructions in the WDC 65816
//===----------------------------------------------------------------------===//


class OpGrp2<bits<3> val> {
  bits<3> Value = val;
}

def OpGrp2ASL     : OpGrp2<0>;
def OpGrp2DEC     : OpGrp2<6>;
def OpGrp2INC     : OpGrp2<7>;
def OpGrp2LSR     : OpGrp2<2>;
def OpGrp2ROL     : OpGrp2<1>;
def OpGrp2ROR     : OpGrp2<3>;
def OpGrp2STXY    : OpGrp2<4>;
def OpGrp2LDXY    : OpGrp2<5>;


class AddrModeGrp2<bits<3> val> {
  bits<3> Value = val;
}

def AddrModeGrp2Acc               : AddrModeGrp2<2>;
def AddrModeGrp2DP                : AddrModeGrp2<1>;
def AddrModeGrp2Abs               : AddrModeGrp2<3>;
def AddrModeGrp2DPIdx             : AddrModeGrp2<5>;
def AddrModeGrp2AbsIdx            : AddrModeGrp2<7>;
def AddrModeGrp2Imm               : AddrModeGrp2<0>;

// Group 2 instructions
class Group2<OpGrp2 opVal, AddrModeGrp2 addrModeVal, dag outs, dag ins, string asmstr, list<dag> pattern>
   : InstWDC<outs, ins, asmstr, pattern> {
    OpGrp2 op = opVal;
    AddrModeGrp2 addrMode = addrModeVal;
   
    let Inst{7-5} = op.Value;
    let Inst{4-2} = addrMode.Value;
    let Inst{1-0} = 2;
}


// Group 2 Y instructions
class Group2_Y<OpGrp2 opVal, AddrModeGrp2 addrModeVal, dag outs, dag ins, string asmstr, list<dag> pattern>
   : Group2<opVal, addrModeVal, outs, ins, asmstr, pattern> {
    OpGrp2 op = opVal;
    AddrModeGrp2 addrMode = addrModeVal;
   
    let Inst{7-5} = op.Value;
    let Inst{4-2} = addrMode.Value;
    let Inst{1-0} = 0;
}



//===----------------------------------------------------------------------===//
// Group #3 instructions in the WDC 65816
//===----------------------------------------------------------------------===//

class OpGrp3<bits<8> val> {
    bits<8> Value = val;
}


def OpGrp3BCC       : OpGrp3<0x90>;
def OpGrp3BCS       : OpGrp3<0xB0>;
def OpGrp3BEQ       : OpGrp3<0xF0>;
def OpGrp3BITImm    : OpGrp3<0x89>;
def OpGrp3BITAbs    : OpGrp3<0x2C>;
def OpGrp3BITDp     : OpGrp3<0x24>;
def OpGrp3BITAbsi   : OpGrp3<0x3C>;
def OpGrp3BITDpi    : OpGrp3<0x34>;
def OpGrp3BMI       : OpGrp3<0x30>;
def OpGrp3BNE       : OpGrp3<0xD0>;
def OpGrp3BPL       : OpGrp3<0x10>;
def OpGrp3BRA       : OpGrp3<0x80>;
def OpGrp3BRK       : OpGrp3<0x00>;
def OpGrp3BRL       : OpGrp3<0x82>;
def OpGrp3BVC       : OpGrp3<0x50>;
def OpGrp3BVS       : OpGrp3<0x70>;
def OpGrp3CLC       : OpGrp3<0x18>;
def OpGrp3CLD       : OpGrp3<0xD8>;
def OpGrp3CLI       : OpGrp3<0x58>;
def OpGrp3CLV       : OpGrp3<0xB8>;
def OpGrp3COP       : OpGrp3<0x02>;
def OpGrp3CPXimm    : OpGrp3<0xE0>;
def OpGrp3CPXabs    : OpGrp3<0xEC>;
def OpGrp3CPXdp     : OpGrp3<0xE4>;
def OpGrp3CPYimm    : OpGrp3<0xC0>;
def OpGrp3CPYabs    : OpGrp3<0xCC>;
def OpGrp3CPYdp     : OpGrp3<0xC4>;
def OpGrp3DEX       : OpGrp3<0xCA>;
def OpGrp3DEY       : OpGrp3<0x88>;
def OpGrp3INX       : OpGrp3<0xE8>;
def OpGrp3INY       : OpGrp3<0xC8>;
def OpGrp3JMPabs    : OpGrp3<0x4C>;
def OpGrp3JMPindir  : OpGrp3<0x6C>;
def OpGrp3JMPindiri : OpGrp3<0x7C>;
def OpGrp3JMLabs    : OpGrp3<0x5C>;
def OpGrp3JMLindir  : OpGrp3<0xDC>;
def OpGrp3JSL       : OpGrp3<0x22>;
def OpGrp3JSRabs    : OpGrp3<0x20>;
def OpGrp3JSRindiri : OpGrp3<0xFC>;
def OpGrp3MVN       : OpGrp3<0x54>;
def OpGrp3MVP       : OpGrp3<0x44>;
def OpGrp3NOP       : OpGrp3<0xEA>;
def OpGrp3PEA       : OpGrp3<0xF4>;
def OpGrp3PEI       : OpGrp3<0xD4>;
def OpGrp3PER       : OpGrp3<0x62>;
def OpGrp3PHA       : OpGrp3<0x48>;
def OpGrp3PHB       : OpGrp3<0x8B>;
def OpGrp3PHD       : OpGrp3<0x0B>;
def OpGrp3PHK       : OpGrp3<0x4B>;
def OpGrp3PHP       : OpGrp3<0x08>;
def OpGrp3PHX       : OpGrp3<0xDA>;
def OpGrp3PHY       : OpGrp3<0x5A>;
def OpGrp3PLA       : OpGrp3<0x68>;
def OpGrp3PLB       : OpGrp3<0xAB>;
def OpGrp3PLD       : OpGrp3<0x2B>;
def OpGrp3PLP       : OpGrp3<0x28>;
def OpGrp3PLX       : OpGrp3<0xFA>;
def OpGrp3PLY       : OpGrp3<0x7A>;
def OpGrp3REP       : OpGrp3<0xC2>;
def OpGrp3RTI       : OpGrp3<0x40>;
def OpGrp3RTL       : OpGrp3<0x6B>;
def OpGrp3RTS       : OpGrp3<0x60>;
def OpGrp3SEC       : OpGrp3<0x38>;
def OpGrp3SED       : OpGrp3<0xF8>;
def OpGrp3SEI       : OpGrp3<0x78>;
def OpGrp3SEP       : OpGrp3<0xE2>;
def OpGrp3STP       : OpGrp3<0xDB>;
def OpGrp3STZabs    : OpGrp3<0x9C>;
def OpGrp3STZdp     : OpGrp3<0x64>;
def OpGrp3STZabsi   : OpGrp3<0x9E>;
def OpGrp3STZdpi    : OpGrp3<0x74>;
def OpGrp3TAX       : OpGrp3<0xAA>;
def OpGrp3TAY       : OpGrp3<0xA8>;
def OpGrp3TCD       : OpGrp3<0x5B>;
def OpGrp3TCS       : OpGrp3<0x1B>;
def OpGrp3TDC       : OpGrp3<0x7B>;
def OpGrp3TRBabs    : OpGrp3<0x1C>;
def OpGrp3TRBdp     : OpGrp3<0x14>;
def OpGrp3TSBabs    : OpGrp3<0x0C>;
def OpGrp3TSBdp     : OpGrp3<0x04>;
def OpGrp3TSC       : OpGrp3<0x3B>;
def OpGrp3TSX       : OpGrp3<0xBA>;
def OpGrp3TXA       : OpGrp3<0x8A>;
def OpGrp3TXS       : OpGrp3<0x9A>;
def OpGrp3TXY       : OpGrp3<0x9B>;
def OpGrp3TYA       : OpGrp3<0x98>;
def OpGrp3TYX       : OpGrp3<0xB8>;
def OpGrp3WAI       : OpGrp3<0xCB>;
def OpGrp3WDM       : OpGrp3<0xCB>;
def OpGrp3XBA       : OpGrp3<0xEB>;
def OpGrp3XCE       : OpGrp3<0xFB>;


class Group3<OpGrp3 opVal, dag outs, dag ins, string asmstr, list<dag> pattern>
   : InstWDC<outs, ins, asmstr, pattern> {
    OpGrp3 op = opVal;
   
    let Inst = op.Value;
}
