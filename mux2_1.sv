	`timescale 1ps/1ps
// 2:1 mux
// out: output of the 2:1 mux
// i0: first input
// i1: second input
// sel: select bit, if low selects i0, if high selects i1
module mux2_1(out, i0, i1, sel);
	
	// instantiates all input variables
	input logic i0, i1, sel;
	// instantiates all output variables
	output logic out;
	// logic variables to connect between gates
	logic im1, im2, im3;
	// #(50) used to make 50 ps delay between gates
	and #(50) int1 (im1, i1, sel);
	not #(50) int2 (im2, sel);
	and #(50) int3 (im3, i0, im2);
	or  #(50) last (out, im1, im3);
	
endmodule
