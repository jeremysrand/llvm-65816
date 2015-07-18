include_directories( ${CMAKE_CURRENT_BINARY_DIR}/.. ${CMAKE_CURRENT_SOURCE_DIR}/.. )

add_llvm_library(LLVMWDC65816Info
  WDC65816TargetInfo.cpp
)

add_dependencies(LLVMWDC65816Info WDC65816CommonTableGen)
