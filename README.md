This project includes a calculator program, and two text manipulation programs (upper and lower). The calculator program performs basic mathematical operations, while the upper and lower programs convert text to uppercase and lowercase, respectively. The project builds a static library for the calculator functions and a shared library for the text conversion functions.

**Makefile Targets**

all - Builds the calculator, upper, and lower programs.

list - Lists the available programs to build.

calculator - Compiles the calculator program and links it with the static library.

upper - Compiles the upper program and links it with the shared library.

lower - Compiles the lower program and links it with the shared library.

install - Installs the calculator, upper, and lower programs, and their respective header files, into the system directories.

clean - Cleans the object files, static library, shared library, and executable programs.

clean-all - Performs the clean target and additionally removes installed files.


**Building the Project**

To build the project, navigate to the root directory and run:

    make all

Listing Available Programs

    make list

Installing the Programs

    sudo make install

Cleaning the Build

    make clean

To clean all including installed files, run:

    make clean all


**Running  programs**

    ./calculator
    ./upper
    ./lower