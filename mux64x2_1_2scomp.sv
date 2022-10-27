//specific 64x2_1 mux
//in1 = ~in1
`timescale 1ps/1ps
module mux64x2_1_2scomp (sel, i0, i1, out);

	//64 bit inputs
	input logic [63:0] i0, i1;
	
	//select line
	input logic sel;
	
	//inverted i1 wire
	wire [63:0] not_i1;
	
	//64 bit output
	output logic [63:0] out;
	
	
	genvar i;
	
	generate
	
		for(i = 0; i < 64; i++) begin : muxy
		
			not #(50) (not_i1[i], i1[i]);
			
			mux2_1 miniboi (.out(out[i]), .i0(i0[i]), .i1(not_i1[i]), .sel);
		
		end
	
	endgenerate

endmodule 


module mux64x2_1_testbench();

	logic [63:0] i0, i1, out;
	
	logic sel;
	
	mux64x2_1 dut(sel, i0, i1, out);
	
	
	initial begin
		i0 = 1; i1 = 2; sel = 0; #300;
		
		sel = 1; #300;
	end


endmodule
