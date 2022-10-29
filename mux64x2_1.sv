//specific 64x2_1 mux
// 64 bit two to 1 mux module
// takes in two 64 bit inputs and outputs a 64 bit output
// Uses generate and a 2 to 1 mux module to make the 64 bit output.
`timescale 1ps/1ps
module mux64x2_1 (sel, i0, i1, out);

	//64 bit inputs
	input logic [63:0] i0, i1;
	
	//select line
	input logic sel;
	
	
	//64 bit output
	output logic [63:0] out;
	
	
	genvar i;
	
	generate
	
		for(i = 0; i < 64; i++) begin : muxy
		
			
			mux2_1 miniboi (.out(out[i]), .i0(i0[i]), .i1(i1[i]), .sel(sel));
		
		end
	
	endgenerate

endmodule 

module mux64x2_1_testbench();

	logic [63:0] in0, in1, out;
	
	logic sel;
	
	mux64x2_1 dut(.sel(sel), .i0(in0), .i1(in1), .out(out));
	
	
	initial begin
		
		in0 = 64'hAAAAAAAAAAAAAAAA; 
		in1 = 64'h000000000FFFFFFF; 
		sel = 1'b0;
		#500;
		
		sel = 1'b1; #500;

		
	end


endmodule
