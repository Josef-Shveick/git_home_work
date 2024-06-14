**Overview**

This project demonstrates a basic setup for building a main executable (main) from multiple source files (main.c, src1.c, src2.c, src3.c) using Makefiles.

**Project Structure**

main.c: Main program source file.

src1.c, src2.c, src3.c: Additional source files.

make1.mk, make2.mk, make3.mk: Makefiles to build src1.o, src2.o, src3.o respectively.

Makefile: Main Makefile orchestrating the build process.


**Building the Project**

Choose Compilation Method:

Option 1: Using Included Makefiles

    USE_INCLUDE=1 make all

Option 2: Using External Makefiles with make -f

    make all

Clean Build:

To clean up generated object files and executables:

    make clean

