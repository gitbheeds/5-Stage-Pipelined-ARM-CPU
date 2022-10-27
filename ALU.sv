`timescale 1ps/1ps


//ALU testing 
//supports pass, add, and subtract as of 10/26

//TODO: AND, OR, XOR op support
//rigorous testing
module ALU (A, B, cntrl, result, overflow, negative, zero, carry_out);

	//64 bit inputs
	input logic [63:0] A, B;
	
	//3 bit ALU control signals
	input logic [2:0] cntrl;
	
	//64 bit result output
	output logic [63:0] result; 
	
	//output flags for ALU op results
	output logic overflow, negative, zero, carry_out;
	
	//holds all the things to shove into ALU control mux
	logic [7:0][63:0] ALU_inputs;
	
	
	
	//wire to determine whether to send B or ~B to the ALU
	wire [63:0] B_adj;
	
	//wire to send output of 64 bit adder to ALU op selector
	wire [63:0] FAtoALU;
	
	//wires to send output of bitwise AND, OR, XOR to ALU op selector
	wire [63:0] ANDtoALU, ORtoALU, XORtoALU;
	
		//populate ALU_inputs
	
	//cntrl 001 not supported
	assign ALU_inputs [1] = 64'bX;
	
	//pass output of adder to both add and subtract lines of ALU op selector
	assign ALU_inputs [2] = FAtoALU; //cntrl = 010
	assign ALU_inputs [3] = FAtoALU; //cntrl = 011
	
	//pass output of bitwise AND to ALU op selector
	assign ALU_inputs [4] = ANDtoALU; //cntrl = 100
	
	//pass output of bitwise OR to ALU op selector
	assign ALU_inputs [5] = ORtoALU; //cntrl = 101
	
	//pass output of bitwise XOR to ALU op selector
	assign ALU_inputs [6] = XORtoALU; //cntrl = 110
	
	//cntrl = 111 not supported
	assign ALU_inputs [7] = 64'bX;
	
	
	
	//set B into two's comp stage 1 if needed (invert bits)
	mux64x2_1 twos(.sel(cntrl[0]), .i0(B), .i1(B), .out(B_adj));
	
	//adder
	//when sub control = 1, sets B into two's comp stage 2 (add 1)
	//sets overflow and carry_out flags
	adder64_bit add_sub(.input1(A), .input2(B_adj), .sub_control(cntrl[0]), .out(FAtoALU), .of_flag(overflow), .co_flag(carry_out));
	
	//bitwise AND
	and_64_bit AND(.A, .B, .out(ANDtoALU));
	
	//bitwise OR
	or_64_bit OR(.A, .B, .out(ORtoALU));
	
	//bitwise XOR
	xor_64_bit XOR(.A, .B, .out(XORtoALU));
	
	//set negative flag, 3 input AND 
	//only if interpreted as two's comp. Two's comp only used in sub ops
	//sub op: 011
	//twos comp used -> MSB of result is sign
	//negative = result[63] & cntrl[1] & cntrl[0]
	and #(50) neg_flag(negative, result[63], cntrl[1], cntrl[0]);
	
	
	
	//set zero flag
	zeroCheck flag(.check(result), .z_flag(zero));
	
	
	
	//pass B to ALU op selector for pass line
	assign ALU_inputs [0] = B; //cntrl = 000
	
	

	
	
	//ALU op selector
	mux64x8_1 ALU_opSel(.in(ALU_inputs), .out(result), .ctrl(cntrl));

endmodule

module ALUmini ();

	parameter delay = 100000;

	logic		[63:0]	A, B;
	logic		[2:0]		cntrl;
	logic		[63:0]	result;
	logic					negative, zero, overflow, carry_out ;

	parameter ALU_PASS_B=3'b000, ALU_ADD=3'b010, ALU_SUBTRACT=3'b011, ALU_AND=3'b100, ALU_OR=3'b101, ALU_XOR=3'b110;
	

	ALU dut (.A, .B, .cntrl, .result, .negative, .zero, .overflow, .carry_out);
	
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
		
		A = 64'b1; B = 1;
		cntrl = ALU_ADD; #(delay); //R = xx, overflow = 1, carry_out = 1, all other flags 0
	end
	
	
	

	
endmodule 
