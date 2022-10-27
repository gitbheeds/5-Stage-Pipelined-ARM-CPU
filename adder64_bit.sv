
`timescale 1ps/1ps

//note that this module as a standalone cannot perform subtraction.
//Input from the ALU is required to flip the bits of input 2
//This same input (sub_control) is used as the carry in for the LSB
//Two's complement for subtraction requires input2 = ~input2 + 1'b1
module adder64_bit(input1, input2, sub_control, out, of_flag, co_flag);

	parameter N = 64;
	
	// when carry in is 0, add operation is done
	// when carry in is 1, sub operation is done
	
	input logic sub_control;
	
	input logic [N-1:0] input1, input2;
	
	output logic [N-1:0] out;
	
	//flag to check if the result has overflowed
	output logic of_flag;
	
	//flag to determine a carry out 
	output logic co_flag;
	
	wire carry_out;
	
	
	//carry out flag
	assign co_flag = carry_out;
	
	wire [N-1:0] c;
	
	//overflow is defined as: MSB carryout xor MSB carry in
	xor #(50) overflow(of_flag, carry_out, c[N-2]);
	
	logic [63:0] delayOut;
	
	genvar i;
	
	generate 
		for(i = 0; i < N; i++) begin : generate_64_bit_adder
		
			if(i == 0) begin
				fullAdder fA(.a(input1[0]), .b(input2[0]), .cin(sub_control), .sum(delayOut[0]), .cout(c[0]));
			end
			else begin
				fullAdder fA(.a(input1[i]), .b(input2[i]), .cin(c[i-1]), .sum(delayOut[i]), .cout(c[i]));
			end
			
			buf #(6000) (out[i], delayOut[i]);
			
		end
		
		assign carry_out = c[N-1];
		
	endgenerate


endmodule


module adder64_bit_testbench();
	
	parameter N = 64;
	

	logic [N-1:0] in1, in2, out;
	
	logic sub_control;
	
	adder64_bit dut(in1, in2, sub_control, out);
	
	
	initial begin
		
		// addition test
		in1 = 256; in2 = 100; sub_control = 0; #60;
		
		in1 = 20; in2 = -5; sub_control = 1; #60;
		
		in1 = -20; in2 = -20; sub_control = 0; #60;
		
		in1 = 10; in2 = -5; sub_control = 0; #60;
	end
	



endmodule
