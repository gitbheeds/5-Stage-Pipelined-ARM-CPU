# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.

vlog "./zeroCheck.sv"
vlog "./zero_extender.sv"
vlog "./xor_64_bit.sv"
vlog "./sign_extender.sv"
vlog "./register64.sv"
vlog "./regfile.sv"
vlog "./programCounter.sv"
vlog "./or_64_bit.sv"
vlog "./mux64x32_1.sv"
vlog "./mux64x8_1.sv"
vlog "./mux64x4_1.sv"
vlog "./mux64x2_1_2scomp.sv"
vlog "./mux64x2_1.sv"
vlog "./mux32_1.sv"
vlog "./mux16_1.sv"
vlog "./mux8_1.sv"
vlog "./mux4_1.sv"
vlog "./mux2_1.sv"
vlog "./math.sv"
vlog "./instructmem.sv"
vlog "./fullAdder.sv"
vlog "./decoder5_32.sv"
vlog "./decoder3_8.sv"
vlog "./decoder2_4.sv"
vlog "./datamem.sv"
vlog "./CPU_single.sv"
vlog "./and_64_bit.sv"
vlog "./alustim.sv"
vlog "./ALU.sv"
vlog "./adder64_bit.sv"
vlog "./adder_4_pc.sv"
vlog "./D_FF.sv"
vlog "./reg2locMux.sv"
vlog "./ALU_control_unit.sv"
vlog "./CPU_control.sv"
vlog "./flagRegister.sv"
vlog "./IF_ID_Reg.sv"




# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work CPU_single_tb

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
