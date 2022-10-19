	`timescale 10ps/1ps

module decoder3_8 (en, sel, o);

	
	input logic en;
	input logic [2:0] sel;
	output logic [7:0] o;
	
	logic  inv2, inv1, inv0;
	
	not#(5) i2(inv2, sel[2]);
	not#(5) i1(inv1, sel[1]);
	not#(5) i0(inv0, sel[0]);
		
	and #(5) g1(o[7], en, inv2, inv1, inv0);
	and #(5) g2(o[6], en, inv2, inv1, sel[0]);
	
	and #(5) g3(o[5], en, inv2, sel[1], inv0);
	and #(5) g4(o[4], en, inv2, sel[1], sel[0]);
	
	and #(5) g5(o[3], en, sel[2], inv1, inv0);
	and #(5) g6(o[2], en, sel[2], inv1, sel[0]);
	
	and #(5) g7(o[1], en, sel[2], sel[1], inv0);
	and #(5) g8(o[0], en, sel[2], sel[1], sel[0]);
	
	

endmodule 