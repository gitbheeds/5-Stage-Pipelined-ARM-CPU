# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.

vlog "./alustim.sv"
vlog "./alu.sv"
vlog "./mux2_1.sv"
vlog "./mux4_1.sv"
vlog "./mux8_1.sv"
vlog "./mux64x8_1.sv"
vlog "./mux64x4_1.sv"
vlog "./mux64x2_1.sv"
vlog "./mux64x2_1_2scomp.sv"
vlog "./fullAdder.sv"
vlog "./adder64_bit.sv"
vlog "./zeroCheck.sv"
vlog "./and_64_bit.sv"
vlog "./or_64_bit.sv"
vlog "./xor_64_bit.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work alustim

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do alu_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
