//flag register to hold flags for use in S type insts and branching
module flagRegister (clk, set_flags, flagsALU, flagsOut);
	input logic clk; // instantiates clock
	input logic set_flags; // control to write new flags
	input logic [3:0] flagsALU; // flags from ALU
	output logic [3:0] flagsOut; // flags to hold for CPU ops
	
	assign rst = 1'b0; // sets reset to 0 for proper DFF functionality
	
	logic [3:0] flagData; // 4 bit value that goes into a register from the 2:1 mux
	
	
	// for loop counter variable
	genvar i;
	
	// generate block that pairs a 2:1 mux with every register to decide what data will be stored in each mux
	generate
		for(i = 0; i < 4; i++) begin : flagReg
			mux2_1 enables (.out(flagData[i]), .i0(flagsOut[i]), .i1(flagsALU[i]), .sel(set_flags));
			D_FF dffs (.clk, .reset(rst), .d(flagData[i]), .q(flagsOut[i]));
		end
	endgenerate
	
endmodule 