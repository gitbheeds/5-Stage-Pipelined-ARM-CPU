
`timescale 1ps/1ps
// 64 bit 8 to 1 mux that takes in 8 seperate 64 bit inputs and outputs a 64 bit output
// sel: 3 bit signal to select which input to output
// Built from two 64 bit 4 to 1 mux modules and one 64 bit 2 to 1 mux module
module mux64x8_1(in0, in1, in2, in3, in4, in5, in6, in7, out, sel);

	input logic [63:0] in0, in1, in2, in3, in4, in5, in6, in7;
	
	input logic [2:0] sel;
	
	output logic [63:0] out;
	
	wire [63:0] int1, int2; 
	
	mux64x4_1 first(in0, in1, in2, in3, int1, sel[1:0]);
	
	mux64x4_1 second(in4, in5, in6, in7, int2, sel[1:0]);
	
	mux64x2_1 third(sel[2], int1, int2, out);


endmodule


module mux64x8_1_testbench();

	logic [63:0] in0, in1, in2, in3, in4, in5, in6, in7, out;
	
	logic [2:0] sel;
	
	
	mux64x8_1 dut(in0, in1, in2, in3, in4, in5, in6, in7, out, sel);
	
	
	initial begin
		
		in0 = 0; in1 = 1; in2 = 2; in3 = 3; in4 = 4; in5 = 5; in6 = 6; in7 = 7; sel = 3'b00; #500;
		
		sel = 3'b001; #500;
		
		sel = 3'b010; #500;
		
		sel = 3'b011; #500;
		
		sel = 3'b100; #500;
		
		sel = 3'b101; #500;
		
		sel = 3'b110; #500;
		
		sel = 3'b111; #500;
	
	end


endmodule

