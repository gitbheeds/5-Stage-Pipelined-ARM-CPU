
//constructs a 32x1 mux from two 16:1 muxes, and a 2:1 mux
// addr: 5 bit address that selects which register to consider
// in: 32 bit input to represent all registers
// out: output which represents the relevant bit of the register
module mux32_1 (addr, in, out);

	
	//5bit addr line
	input logic [4:0] addr;
	
	//32 possible inputs
	input logic [31:0] in;
	
	
	//One 1bit output
	output logic out;
	
	wire im0, im1;
	
	
	mux16_1 mux0(.out(im0), .in(in[15:0]), .sel(addr[3:0]));
	mux16_1 mux1(.out(im1), .in(in[31:16]), .sel(addr[3:0]));
	
	mux2_1 mux2(.out(out), .i0(im0), .i1(im1), .sel(addr[4]));
	

endmodule 