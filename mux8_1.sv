// 8:1 mux made out of two 4:1 muxes and a 2:1 mux
// out: single bit output
// in: 8 bit input signal
// sel: Selects which input signal to consider as output
module mux8_1(out, in, sel);

	input logic [7:0] in;
	input logic [2:0] sel;
	
	output logic out;
	
	wire im0, im1;
	
	mux4_1 mux0(.out(im0), .in(in[3:0]), .sel(sel[1:0]));
	mux4_1 mux1(.out(im1), .in(in[7:4]), .sel(sel[1:0]));
	
	mux2_1 mux3(.out(out), .i0(im0), .i1(im1), .sel(sel[2]));

endmodule
