//===- WDC65816Section.h - WDC65816-specific section representation -*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file declares the NVPTXSection class.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_WDC65816SECTION_H
#define LLVM_WDC65816SECTION_H

#include "llvm/IR/GlobalVariable.h"
#include "llvm/MC/MCSection.h"
#include <vector>

namespace llvm {
    /// WDC65816Section - Represents a section in OMF
    ///
    class WDC65816Section : public MCSection {
        virtual void anchor();
    public:
        WDC65816Section(SectionVariant V, SectionKind K) : MCSection(V, K) {}
        virtual ~WDC65816Section() {}
        
        /// Override this as NVPTX has its own way of printing switching
        /// to a section.
        virtual void PrintSwitchToSection(const MCAsmInfo &MAI,
                                          raw_ostream &OS,
                                          const MCExpr *Subsection) const {}
        
        /// Base address of PTX sections is zero.
        virtual bool isBaseAddressKnownZero() const { return true; }
        virtual bool UseCodeAlign() const { return false; }
        virtual bool isVirtualSection() const { return false; }
        virtual std::string getLabelBeginName() const { return ""; }
        virtual std::string getLabelEndName() const { return ""; }
    };
    
} // end namespace llvm

#endif
