
module adder64_bit(input1, input2, sub_control, out);

	parameter N = 64;
	
	// when carry in is 0, add operation is done
	// when carry in is 1, sub operation is done
	// sub operation is done with a mux that feeds ~input2 as input2
	input sub_control;
	
	input [N-1:0] input1, input2;
	
	output [N-1:0] out;
	
	wire carry_out;
	
	wire [N-1:0] c;
	
	genvar i;
	
	generate 
		for(i = 0; i < N; i++) begin : generate_64_bit_adder
		
			if(i == 0) begin
				fullAdder fA(.a(input1[0]), .b(input2[0]), .cin(sub_control), .sum(out[0]), .cout(c[0]));
			end
			else begin
				fullAdder fA(.a(input1[i]), .b(input2[i]), .cin(c[i-1]), .sum(out[i]), .cout(c[i]));
			end
			
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
		in1 = 256; in2 = 100; sub_control = 0; #10;
		
		in1 = 20; in2 = -5; sub_control = 1; #10;
		
		in1 = -20; in2 = -20; sub_control = 0; #10;
		
		in1 = 10; in2 = -5; sub_control = 0; #10;
	end
	



endmodule
