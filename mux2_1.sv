	`timescale 1ps/1ps

module mux2_1(out, i0, i1, sel);
	
	
	input logic i0, i1, sel;
	output logic out;
	
	logic im1, im2, im3;
	
	and #(50) int1 (im1, i1, sel);
	not #(50) int2 (im2, sel);
	and #(50) int3 (im3, i0, im2);
	or  #(50) last (out, im1, im3);
	
endmodule
