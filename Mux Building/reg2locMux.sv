// When sel = 0, Rd is passed
// WHen sel = 1, Rm is passed
`timescale 1ps/1ps
module reg2locMux(sel, Rm, Rd, out);

	input logic [4:0] Rm, Rd;
	
	input logic sel;
	
	output logic [4:0] out;

	genvar i;
	
	generate
		for (i = 0; i < 5; i++) begin : reg2loc
			mux2_1 tinyboi (.out(out[i]), .i0(Rd[i]), .i1(Rm[i]), .sel(sel));
		end
	
	endgenerate
	
endmodule

module reg2locMux_tb();

	logic [4:0] Rm, Rd, out;
	logic sel;
	
	reg2locMux dut(sel, Rm, Rd, out);
	
	initial begin
		// selects Rd
		Rm = 5'b11111; Rd = 5'b00001; sel = 0; #200;
		
		// selects Rm
		sel = 1; #200;
	end

endmodule

