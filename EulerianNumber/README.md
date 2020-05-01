# Eulerian Number
In combinatorics, the Eulerian Number A(n, m), is the number of permutations of the numbers 1 to n in which exactly m elements are greater than previous element.

For example, there are 4 permutations of the number 1 to 3 in which exactly 1 element is greater than the previous elements.
Eulerian

Examples :



Input : n = 3, m = 1
Output : 4


Input : n = 4, m = 1
Output : 11

# FSMD
Basic Finite State Machine with Datapath (FSMD) example to find the number of permutations of the numbers 1 to n(up to 14) in which exactly m(up to 14) elements are greater than previous element.

## Install

These examples use [ModelSim&reg; and Quartus&reg; Prime from Intel FPGA](http://fpgasoftware.intel.com/?edition=lite), [GIT](https://git-scm.com/download/win), [Visual Studio Code](https://code.visualstudio.com/download), make sure they are installed locally on your computer before proceeding.

## Usage

1. Grab a copy of this repository to your computer's local folder (i.e. C:\projects):

    ```sh
    $ cd projects
    $ git clone https://github.com/Salem22/EulerianNumber.git
    ```
2. Use Visual Studio Code (VSC) to edit and view the design files:

    ```sh
    $ cd EulerianNumber
    $ code .
    ```
    Click on the toplevel.vhd file in the left pane to view its contents.
    
3. From the VSC View menu, choose Terminal, in the VCS Terminal, create a "work" library:

    ```sh
    $ vlib work
    ```
    
4. Compile all the design units:

    ```sh
    $ vcom *.vhd
    ```
    
5. Simulate your design. For example, if m = 1, n = 3 then y = 4:

    ```sh
    $ vsim work.tb
    ```
