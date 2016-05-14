//
//  WDC65816TargetAsmStreamer.h
//  llvm
//
//  Created by Jeremy Rand on 2016-04-11.
//  Copyright © 2016 Jeremy Rand. All rights reserved.
//

#ifndef WDC65816TargetStreamer_h
#define WDC65816TargetStreamer_h


#include "llvm/MC/MCStreamer.h"


namespace llvm {
    
    
    class WDC65816TargetStreamer : public MCTargetStreamer {
        virtual void anchor();
        
    public:
        virtual void EmitCaseDirective(void) = 0;
        virtual void EmitKeepDirective(StringRef filename) = 0;
        virtual void EmitSegStartDirective(StringRef filename) = 0;
        virtual void EmitSegEndDirective(void) = 0;
        
        virtual void EmitFunctionEntryLabel(StringRef function) = 0;
        virtual void EmitInstruction(StringRef instruction) = 0;
    };
    
    class WDC65816TargetAsmStreamer : public WDC65816TargetStreamer {
        formatted_raw_ostream &OS;
        StringRef indent;
        int indentlen;
        
        StringRef &trimFilename(StringRef &filename);
        
    public:
        WDC65816TargetAsmStreamer(formatted_raw_ostream &OS) : OS(OS), indent("           "), indentlen(11) {}
        virtual ~WDC65816TargetAsmStreamer();
        
        virtual void EmitCaseDirective(void);
        virtual void EmitKeepDirective(StringRef filename);
        virtual void EmitSegStartDirective(StringRef filename);
        virtual void EmitSegEndDirective(void);
        
        virtual void EmitFunctionEntryLabel(StringRef function);
        virtual void EmitInstruction(StringRef instruction);
    };
}

#endif /* WDC65816TargetStreamer_h */
