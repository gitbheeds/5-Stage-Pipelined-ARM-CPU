//specific 64x2_1 mux
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

