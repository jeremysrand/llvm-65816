What is LLVM?
============
LLVM is an open source suite of compiler tools.  LLVM itself takes source code
in an intermediate format and turns it into assembly (or object files) for a
particular architecture.  There are other projects which build on top of that.
Clang takes C/C++/Objective C code in and spits out the intermediate format.
Put those together and you get a C compiler which can target many architectures.


What is LLVM-65816?
=================
This is my project to add 65816 support in LLVM.  If this is successful, it
will be able to convert LLVM intermediate representation into 65816 assembly.
Ideally, this assembly would be in a format which Merlin 32 could then assemble
into object files and ultimately executables.  If we have this, we would have a
modern C compiler which can be used to build Apple //GS executables.


What is the status?
===============
The LLVM documentation recommends that new targets use the Sparc target as a
guide and that is what I have done.  Mostly, I have created 65816 versions of
each of the files for the Sparc target.  I have disabled large blocks of the
Sparc code that I copied and marked them up with “WDC_TODO” comments.  I have
spent a fair bit of time to describe the registers (actually didn’t take long
to describe the registers because we don’t have many) and the instruction set.
That is in reasonable shape but there is definitely work there too.

Right now, you can get the code and compile it.  You will be left with a clang
binary that appears to have 65816 support.  If you try to compile any C code
with it targeting the 65816 though, the compiler will crash today.  But, as of
yesterday, I couldn’t even get a build so that is some progress.


What is next?
===========
My initial goal is to get the compiler to produce assembly for this C code:

    int answerToTheUltimateQuestion(void)
    {
        return 42; // The answer
    }

Once that is working, then I will try to get more working until it is a usable
compiler.  There are _lots_ of issues and problems waiting for me (us?).


How to build the project?
=========================
Here are the steps to checkout the code and build it:

    $ cd some/good/place/to/put/this
    $ git clone https://github.com/jeremysrand/llvm-65816.git
    $ mkdir build
    $ cd build
    $ cmake -DCMAKE_BUILD_TYPE:STRING=Debug -G "Unix Makefiles" ../llvm-65816
    $ make

That works for me on my Mac.  Note, you probably need to download cmake.


How to help?
============
There is _lots_ of work to be done here before this becomes a useful tool.
But, now that it builds and I have dozens of WDC_TODO’s sprinkled around the
code, it is maybe a reasonable time to open this up to anyone else who wants to
contribute.


Below is the text from the LLVM README:


Low Level Virtual Machine (LLVM)
================================

This directory and its subdirectories contain source code for the Low Level
Virtual Machine, a toolkit for the construction of highly optimized compilers,
optimizers, and runtime environments.

LLVM is open source software. You may freely distribute it under the terms of
the license agreement found in LICENSE.txt.

Please see the documentation provided in docs/ for further
assistance with LLVM, and in particular docs/GettingStarted.rst for getting
started with LLVM and docs/README.txt for an overview of LLVM's
documentation setup.

If you're writing a package for LLVM, see docs/Packaging.rst for our
suggestions.

