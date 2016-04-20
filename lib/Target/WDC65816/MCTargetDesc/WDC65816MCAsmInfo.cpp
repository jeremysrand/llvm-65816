//===-- WDC65816MCAsmInfo.cpp - WDC65816 asm properties -------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the declarations of the WDC65816MCAsmInfo properties.
//
//===----------------------------------------------------------------------===//

#include "WDC65816MCAsmInfo.h"
#include "llvm/ADT/Triple.h"

using namespace llvm;

void WDC65816MCAsmInfo::anchor() { }

WDC65816MCAsmInfo::WDC65816MCAsmInfo(StringRef TT) {
    IsLittleEndian = true;
    Triple TheTriple(TT);
    
    PointerSize = CalleeSaveStackSlotSize = 4;
    
    // Disable the ".file <filename>" parameter
    HasSingleParameterDotFile = false;
    
#if 0 // WDC_TODO - Do I need any of this?
    Data16bitsDirective = "\t.half\t";
    Data32bitsDirective = "\t.word\t";
    // .xword is only supported by V9.
    Data64bitsDirective = (isV9) ? "\t.xword\t" : 0;
    ZeroDirective = "\t.skip\t";
    CommentString = "!";
    HasLEB128 = true;
    SupportsDebugInformation = true;
    
    ExceptionsType = ExceptionHandling::DwarfCFI;
    
    SunStyleELFSectionSwitchSyntax = true;
    UsesELFSectionDirectiveForBSS = true;
    
    PrivateGlobalPrefix = ".L";
#endif
}


