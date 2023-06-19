// 16:1 mux, made out of two 8:1 muxes and a 2:1 mux
// out: single bit output
// in: 16 bit input signal
// sel: 4 bit select signal which picks which input should be the output
module mux16_1(out, in, sel);
	input logic [15:0] in;
	
	input logic [3:0] sel;
	
	output logic out;
	
	wire im0, im1;
	
	mux8_1 mux0(.out(im0), .in(in[7:0]), .sel(sel[2:0]));
	mux8_1 mux1(.out(im1), .in(in[15:8]), .sel(sel[2:0]));
	
	mux2_1 mux3(.out(out), .i0(im0), .i1(im1), .sel(sel[3]));
	

endmodule
