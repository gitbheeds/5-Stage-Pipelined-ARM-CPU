	`timescale 1ps/1ps
// 3:8 decoder
// en: single bit enable signal
// sel: 3 bit select signal
// o: 8 bit output
module decoder3_8 (en, sel, o);

	// instantiates enable signal, which is received from the 2:4 decoder
	input logic en;
	// instantiates 3 bit select signal
	input logic [2:0] sel;
	// instantiates 8 bit output
	output logic [7:0] o;
	// intermediate logic variables to connect gates
	logic  inv2, inv1, inv0;
	
	// 3:8 decoder built from logic gates
	not#(50) i2(inv2, sel[2]);
	not#(50) i1(inv1, sel[1]);
	not#(50) i0(inv0, sel[0]);
		
	and #(50) g7(o[7], sel[2], sel[1], sel[0], en);
	and #(50) g6(o[6], sel[2], sel[1], inv0, en);
	
	and #(50) g5(o[5], sel[2], inv1, sel[0], en);
	and #(50) g4(o[4], sel[2], inv1, inv0, en);
	
	and #(50) g3(o[3], inv2, sel[1], sel[0], en);
	and #(50) g2(o[2], inv2, sel[1], inv0, en);
	
	and #(50) g1(o[1], inv2, inv1, sel[0], en);
	and #(50) g0(o[0], inv2, inv1, inv0, en);
	
	

endmodule

// testbench for the 3:8 decoder
module decoder3_8_testbench();

	logic en; 
	logic [2:0] sel;
	
	logic [7:0] out;
	
	decoder3_8 dut(.en(en), .sel(sel), .o(out));
	
	initial begin
		sel = 3'b000; en = 1'b0; #50;
		sel = 3'b010; en = 1'b0; #50;
		sel = 3'b000; en = 1'b1; #50;
		sel = 3'b001; en = 1'b1; #50;
		sel = 3'b010; en = 1'b1; #50;
		sel = 3'b011; en = 1'b1; #50;
		sel = 3'b100; en = 1'b1; #50;
		sel = 3'b101; en = 1'b1; #50;
		sel = 3'b110; en = 1'b1; #50;
		sel = 3'b111; en = 1'b1; #50;
		sel = 3'b000; en = 1'b1; #50;
	end

endmodule
