
`timescale 1ps/1ps

// 64 bit 4 to 1 mux module
// takes in 4 64 bit inputs and outputs a single 64 bit output
// build from 3 64 bit 2 to 1 mux modules
module mux64x4_1(in0, in1, in2, in3, out, sel);

	input logic [63:0] in0, in1, in2, in3;
	
	output logic [63:0] out;
	
	input logic [1:0] sel;
	
	wire [63:0] int1, int2;
	
	mux64x2_1 first(.sel(sel[0]), .i0(in0), .i1(in1), .out(int1));
	
	mux64x2_1 second(.sel(sel[0]), .i0(in2), .i1(in3), .out(int2));
	
	
	mux64x2_1 third(.sel(sel[1]), .i0(int1), .i1(int2), .out(out));

endmodule


module mux64x4_1_testbench();

	logic [63:0] in0, in1, in2, in3, out;
	
	logic [1:0] sel;
	
	mux64x4_1 dut(in0, in1, in2, in3, out, sel);
	
	
	initial begin
		
		in0 = 16'hF00D; 
		in1 = 16'hDADA; 
		in2 = 16'hFFFF; 
		in3 = 16'hDEAD; 
		sel = 2'b00;
		#500;
		
		sel = 2'b01; #500;
		
		sel = 2'b10; #500;
		
		sel = 2'b11; #500;
		
	end


endmodule
