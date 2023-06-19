`timescale 1ps/1ps

// Simple ALU design.
// Supports PASS, ADD, SUB, AND, OR, XOR operations
// A, B: 64 bit ALU inputs
// Flags:
// negative: whether the result output is negative if interpreted as 2's comp.
// zero: whether the result output was a 64-bit zero.
// overflow: on an add or subtract, whether the computation overflowed if the inputs are interpreted as 2's comp.
// carry_out: on an add or subtract, whether the computation produced a carry-out.

// cntrl			Operation						Notes:
// 000:			result = B						value of overflow and carry_out unimportant
// 010:			result = A + B
// 011:			result = A - B
// 100:			result = bitwise A & B			value of overflow and carry_out unimportant
// 101:			result = bitwise A | B			value of overflow and carry_out unimportant
// 110:			result = bitwise A XOR B		value of overflow and carry_out unimportant
module alu (A, B, cntrl, result, overflow, negative, zero, carry_out);

//define inputs and outputs

	//64 bit inputs
	input logic [63:0] A, B;
	
	//3 bit ALU control signals
	input logic [2:0] cntrl;
	
	//64 bit result output
	output logic [63:0] result; 
	
	//output flags for ALU op results
	output logic overflow, negative, zero, carry_out;
	
	
	
//define wires for interconnects	
	
	//wire to determine whether to send B or ~B to the ALU
	wire [63:0] B_adj;
	
	//wire to send output of 64 bit adder to ALU op selector
	wire [63:0] FAtoALU;
	
	//wires to send output of bitwise AND, OR, XOR to ALU op selector
	wire [63:0] ANDtoALU, ORtoALU, XORtoALU;
	

	
//adder + subtractor	

	//set B into two's comp stage 1 if needed (invert bits)
	mux64x2_1_2scomp twos(.sel(cntrl[0]), .i0(B), .i1(B), .out(B_adj));
	

	//when sub control = 1, sets B into two's comp stage 2 (add 1)
	//sets overflow and carry_out flags
	adder64_bit add_sub(.input1(A), .input2(B_adj), .sub_control(cntrl[0]), .out(FAtoALU), .of_flag(overflow), .co_flag(carry_out));
	
	
	
//logic operations

	//bitwise AND
	and_64_bit AND(.A, .B, .out(ANDtoALU));
	
	//bitwise OR
	or_64_bit OR(.A, .B, .out(ORtoALU));
	
	//bitwise XOR
	xor_64_bit XOR(.A, .B, .out(XORtoALU));
	
	
	
//set negative, zero flags
	
	//set negative flag
	//negative = result[63]
	assign negative = result[63];
	
	//set zero flag
	zeroCheck flag(.check(result), .z_flag(zero));
	
	
	
	//ALU op selector
	mux64x8_1 ALU_opSel(.in0(B), .in1(64'bX), .in2(FAtoALU), .in3(FAtoALU), .in4(ANDtoALU),  
							.in5(ORtoALU), .in6(XORtoALU), .in7(64'bX), .out(result), .sel(cntrl));

endmodule

module ALUmini ();

	parameter delay = 100000;

	logic		[63:0]	A, B;
	logic		[2:0]		cntrl;
	logic		[63:0]	result;
	logic					negative, zero, overflow, carry_out;

	parameter ALU_PASS_B=3'b000, ALU_ADD=3'b010, ALU_SUBTRACT=3'b011, ALU_AND=3'b100, ALU_OR=3'b101, ALU_XOR=3'b110;
	

	alu dut (.A, .B, .cntrl, .result, .negative, .zero, .overflow, .carry_out);
	
	initial begin
	
		cntrl = ALU_PASS_B;
		A = 7000; B = 1888; #(delay);
		
		cntrl = ALU_ADD; #(delay); //R = 8888, zero = 0; carry_out = 0; overflow = 0; negative = 0;

		B = 6999; 
		cntrl = ALU_SUBTRACT; #(delay); //R = 1, all flags 0
		
		A = 6999;
		#(delay); //R = 0, zero = 1, all other flags 0
		
		A = 0; B = 124;
		#(delay); //R = -124, negative = 1, all other flags 0
		
		A = 64'hFFFFFFFFFFFFFFFF; B = 1;
		cntrl = ALU_ADD; #(delay); //R = 16'hFFFFFFFFFFFFFFFF, overflow = 1, carry_out = 1, all other flags 0
		
		A = 0; B = 0; 
		cntrl = ALU_AND; #(delay); //R = 0, zero = 0, all other flags X
		
		A = 64'hFFFFFFFFFFFFFFFF; B = 64'hFFFFFFFFFFFFFFF0;
		#(delay); //R = 16'hFFFFFFFFFFFFFFF0, zero = 0, all other flags X
		
		cntrl = ALU_XOR; #(delay); //R = 16'h0000000000000001, zero = 0, all other flags X
		
		cntrl = ALU_OR; #(delay); //R = 16'hFFFFFFFFFFFFFFFF, zero = 0, all other flags X
		
		cntrl = 3'b001; #(delay); //all X
		
		cntrl = 3'b111; #(delay); //all X
		
	end
	
	
	

	
endmodule 
