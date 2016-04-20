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
        // Add pure virtual functions here to the base class...
    };
    
    class WDC65816TargetAsmStreamer : public WDC65816TargetStreamer {
        formatted_raw_ostream &OS;
    public:
        WDC65816TargetAsmStreamer(formatted_raw_ostream &OS) : OS(OS) {}
        virtual ~WDC65816TargetAsmStreamer();
    };
}

#endif /* WDC65816TargetStreamer_h */
