	`timescale 1ps/1ps
// 2:4 decoder
// 2 bit select signal which selects the bit of the output
// en: enable signal which allows an output or not
// o: 4 bit output of the decoder
module decoder2_4 (sel, en, o);
	
	// two bit select signal
	input logic [1:0] sel;
	// one bit enable signal
	input logic en;
	// 4 bit output
	output logic [3:0] o;
	// intermediate logic variables to connect gates
	logic inv1, inv0;
	
	// Logic structure of the decoder
	not#(50) i1(inv1, sel[1]);
	not#(50) i0(inv0, sel[0]);
	// since inv1 and inv0 output o[3], the MSB of output is high when sel = 00
	// This is taken care of at the top level module
	and #(50) out3(o[3], en ,inv1, inv0);
	and #(50) out2(o[2], en, inv1, sel[0]);
	
	and #(50) out1(o[1], en, sel[1], inv0);
	and #(50) out0(o[0], en, sel[1], sel[0]);
	
endmodule 

// testbench for 2:4 decoder
module decoder2_4_testbench();
	
	logic [1:0] sel;
	
	logic en;
	
	logic [3:0] out;
	
	decoder2_4 dut(.sel(sel), .en(en), .o(out));
	
	initial begin
		sel = 2'b00; en = 1'b0; #50;
		sel = 2'b00; en = 1'b1; #50;
		sel = 2'b01; en = 1'b1; #50;
		sel = 2'b10; en = 1'b1; #50;
		sel = 2'b11; en = 1'b1; #50;
		sel = 2'b11; en = 1'b0; #50;
		sel = 2'b10; en = 1'b0; #50;
		sel = 2'b01; en = 1'b0; #50;
		sel = 2'b00; en = 1'b0; #50;
	end
	
endmodule
