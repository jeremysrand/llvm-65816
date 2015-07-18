set(LLVM_TARGET_DEFINITIONS WDC65816.td)

tablegen(LLVM WDC65816GenRegisterInfo.inc -gen-register-info)
tablegen(LLVM WDC65816GenInstrInfo.inc -gen-instr-info)
tablegen(LLVM WDC65816GenAsmWriter.inc -gen-asm-writer)
tablegen(LLVM WDC65816GenDAGISel.inc -gen-dag-isel)
tablegen(LLVM WDC65816GenSubtargetInfo.inc -gen-subtarget)
tablegen(LLVM WDC65816GenCallingConv.inc -gen-callingconv)
add_public_tablegen_target(WDC65816CommonTableGen)

add_llvm_target(WDC65816CodeGen
  WDC65816AsmPrinter.cpp
  WDC65816InstrInfo.cpp
  WDC65816ISelDAGToDAG.cpp
  WDC65816ISelLowering.cpp
  WDC65816FrameLowering.cpp
  WDC65816MachineFunctionInfo.cpp
  WDC65816RegisterInfo.cpp
  WDC65816TargetMachine.cpp
  WDC65816SelectionDAGInfo.cpp
)

add_dependencies(LLVMWDC65816CodeGen WDC65816CommonTableGen intrinsics_gen)

add_subdirectory(TargetInfo)
add_subdirectory(MCTargetDesc)
