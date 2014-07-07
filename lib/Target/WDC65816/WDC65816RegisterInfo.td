//===- WDC65816RegisterInfo.td - WDC65816 Register defs ----------*- tablegen -*-===//
// 
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
// 
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
//  Declarations that describe the WDC65816 register file 
//===----------------------------------------------------------------------===//

let Namespace = "WDC" in {
  def A : Register<"A">;
  def X : Register<"X">;
  def Y : Register<"Y">;
  def P : Register<"P">;
  def S : Register<"S">;
  def D : Register<"D">;
  def K : Register<"K">;
  def B : Register<"B">;
  def PC : Register<"PC">;
}

def IntRegs : RegisterClass<"WDC", [i16], 8,
                         (add A, X, Y)>;
                         
def AccRegs : RegisterClass<"WDC", [i16], 8,
                         (add A)>;
                         
def IndexRegs : RegisterClass<"WDC", [i16], 8,
                         (add X, Y)>;
                         
def IndexXRegs : RegisterClass<"WDC", [i16], 8,
                         (add X)>;
                         
def IndexYRegs : RegisterClass<"WDC", [i16], 8,
                         (add Y)>;
                         
def DataBankRegs : RegisterClass<"WDC", [i8], 8,
                         (add B)>;
                         
def DirectPageRegs : RegisterClass<"WDC", [i16], 8,
                         (add D)>;
                         
def StackPointerRegs : RegisterClass<"WDC", [i16], 8,
                         (add S)>;
                         
def ProcessorStatusRegs : RegisterClass<"WDC", [i8], 8,
                         (add P)>;
                         
def ProgramBankRegs : RegisterClass<"WDC", [i8], 8,
                         (add K)>;
