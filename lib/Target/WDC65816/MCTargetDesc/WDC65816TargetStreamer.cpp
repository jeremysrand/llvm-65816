//
//  WDC65816TargetAsmStreamer.cpp
//  llvm
//
//  Created by Jeremy Rand on 2016-04-11.
//  Copyright © 2016 Jeremy Rand. All rights reserved.
//

#include "WDC65816.h"
#include "WDC65816TargetStreamer.h"
#include "llvm/Support/FormattedStream.h"


using namespace llvm;


// pin vtable to this file
void WDC65816TargetStreamer::anchor() {}


WDC65816TargetAsmStreamer::~WDC65816TargetAsmStreamer()
{

}


StringRef &WDC65816TargetAsmStreamer::trimFilename(StringRef &filename)
{
    size_t lastSlash = filename.find_last_of('/');
    if (lastSlash != StringRef::npos) {
        filename = filename.drop_front(lastSlash + 1);
    }
    
    size_t lastPeriod = filename.find_last_of('.');
    if (lastPeriod != StringRef::npos) {
        filename = filename.substr(0, lastPeriod);
    }
    
    return filename;
}


void WDC65816TargetAsmStreamer::EmitCaseDirective(void)
{
    OS << indent;
    OS << "case on";
    OS << '\n';
}


void WDC65816TargetAsmStreamer::EmitKeepDirective(StringRef filename)
{
    OS << indent;
    OS << "keep ";
    OS << trimFilename(filename);
    OS << '\n';
}


void WDC65816TargetAsmStreamer::EmitSegStartDirective(StringRef filename)
{
    OS << trimFilename(filename);
    OS << "seg start";
    OS << '\n';
}


void WDC65816TargetAsmStreamer::EmitSegEndDirective(void)
{
    OS << indent;
    OS << "end";
    OS << '\n';
}
