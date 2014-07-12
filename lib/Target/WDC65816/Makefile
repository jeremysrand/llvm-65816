##===- lib/Target/WDC65816/Makefile ----------------------------*- Makefile -*-===##
#
#                     The LLVM Compiler Infrastructure
#
# This file is distributed under the University of Illinois Open Source
# License. See LICENSE.TXT for details.
#
##===----------------------------------------------------------------------===##

LEVEL = ../../..
LIBRARYNAME = LLVMWDC65816CodeGen
TARGET = WDC65816

# Make sure that tblgen is run, first thing.
BUILT_SOURCES = WDC65816GenRegisterInfo.inc WDC65816GenInstrInfo.inc \
		WDC65816GenAsmWriter.inc WDC65816GenDAGISel.inc \
		WDC65816GenSubtargetInfo.inc WDC65816GenCallingConv.inc \
		WDC65816GenCodeEmitter.inc

# DIRS = InstPrinter Disassembler AsmParser TargetInfo MCTargetDesc

include $(LEVEL)/Makefile.common

