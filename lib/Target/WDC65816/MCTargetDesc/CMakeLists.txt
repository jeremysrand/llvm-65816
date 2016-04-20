add_llvm_library(LLVMWDC65816Desc
  WDC65816MCTargetDesc.cpp
  WDC65816MCAsmInfo.cpp
  WDC65816TargetStreamer.cpp
  )

add_dependencies(LLVMWDC65816Desc WDC65816CommonTableGen)
