	`timescale 10ps/1ps

module decoder2_4 (sel, en, o);
	

	input logic [1:0] sel;
	
	input logic en;
	
	output logic [3:0] o;
	
	logic inv1, inv0;
	
	not#(5) i1(inv1, sel[1]);
	not#(5) i0(inv0, sel[0]);
	
	and #(5) out3(o[3], en ,inv1, inv0);
	and #(5) out2(o[2], en, inv1, sel[0]);
	
	and #(5) out1(o[1], en, sel[1], inv0);
	and #(5) out0(o[0], en, sel[1], sel[0]);
	
endmodule 