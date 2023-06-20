# 5 Stage Pipelined ARM CPU
### Originally designed for EE469 in Fall 2023 by Shaunak Bhide and Gerin George at the University of Washington Seattle

Please open CPU_pipeline.sv for the full implementation of the pipelined CPU.

## Overview: 

This repository contains a 5 stage pipelined ARM CPU. This CPU has a "branch taken" prediction. It also has a forwarding unit capable of handling write-use hazards with EX/MEM forwarding or MEM/WB forwarding. Load-use hazards are not solved with this forwarding unit, and will require stalls in the compiler to run correctly. Almost every component, excluding the CPU control unit, forwarding unit, and branch calculator, were built at the gate level. The three exceptions were built using RTL. The CPU was tested only in simulation, but was written in Intel's Quartus Prime environment, configured to program an Altera DE1-SoC FPGA. It was not realized on the FPGA due to a lack of peripherals, making it hard to check for operation. The simulation used benchmark instruction sets, found under the Benchmarks folder. These benchmarks, in tandem with the instruction and data memory provided to us, are tested in the CPU_pipeline_tb module.  

### ALU Building
This folder contains all the components of our 64 bit ALU. It supports PASS, ADD, SUB, AND, OR, and XOR operations.

### Benchmarks
This folder contains ARM instructions that are loaded into instruction memory to test our CPU. 
- `test01_AddiB`: Tests ADDI instructions and unconditional branches
- `test02_AddsSubs`: Tests ADDS and SUBS instructions, verifying ALU ability to perform arithmetic and set flags
- `test03_CbzB`: Tests conditional branching when zero, verifying that flag register is working
- `test04_LdurStur`: Tests both load and store instructions, verifying memory reads and writes work
- `test05_Blt`: Tests conditional branching when less than
- `test06_BlBr`: Tests branching with links and branching to registers
- `test11_Sort`: Challenges the CPU's ability to handle dependencies by sorting values
- `test12_Fibonacci`: Runs a recursive Fibonacci function

### DE1_SoC project config
This folder contains project config files for Quartus to use. None of these need to adjusted. 

### Decoder Building
This folder contains all the submodules needed to build a 1:32 decoder. The smallest decoders are made at the gate level, and hierarchy was exploited to build the larger decoders. 

### IFID components
This folder contains modules needed to complete instruction fetching and decoding. 
- `CPU_control.sv`: Generates all control signals based on the opcode of the instruction. 
- `adder_4_pc.sv`: Simple 64 bit adder that adds 4 to the previous value for standard instruction fetching. 
- `branchCalcs.sv`: Calculates branch addresses, determines what the next program count will be. 
- `programCounter.sv`: Relic
- `programCounterFix.sv`: Working program counter, with support for BR, BL, B, CBZ, B.cond branches. 

### Lab 1 Timescale Fixed
Relic folder

### Lab 5-Cache Memory Analysis
While interesting, this folder contains nothing relevant to the CPU. This was a class assignment to analyze a cache. 

### Mux Building
This folder contains all the submodules needed to build a 64x32:1 multiplexor. Smaller stages of this 64 bit mux also find use within the design.

### Pipeline Registers and Regfile
This folder contains the four pipeline registers needed for this design, and the 64x32 register file. Also present are the flag register and the forwarding unit.

### Sign-Zero Extenders
This folder contains a parameterized sign extender and a parameterized zero extender. These are used at various locations in the CPU, for extending 12 bit immediates for ADDI/SUBI instructions, and extending 9 bit offset addresses for LDUR/STUR instructions. 



