module mux64x2_1 (out, i0, i1, sel);

	input logic [63:0] i0, i1;
	
	input logic sel;
	
	output logic [63:0] out;
	
	genvar i;
	
	generate
	
		for(i = 63; i == 0; i--) begin : bigMux
		
			mux2_1 mux64_2 (.out(out[i]), .i0(i0[i]), .i1(i1[i]), .sel);
		
		end
	
	endgenerate

endmodule 
