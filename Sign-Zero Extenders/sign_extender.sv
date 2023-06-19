//sign extender
//based on extension parameter
//extends a given input to 64 bits while preserving the sign

module sign_extender #(parameter sizeIn = 9) (in, out);

	input logic [sizeIn - 1:0] in;
	
	output logic [63:0] out;
	
	integer i;
	
	
	
	always_comb begin
	
		out[sizeIn - 1:0] = in[sizeIn - 1:-0];
	
		for(i = sizeIn; i < 64; i++) begin
		
			out[i] = in[sizeIn-1];
		
		end
	
	end


endmodule 

module se_tb();

//	parameter size = 9;
//	parameter size = 19;
	parameter size = 26;

	logic [size - 1:0] in;
	
	logic [63:0] out;
	
	sign_extender #(size) dut (.in, .out);
	
	initial begin //comment out unused pairs
	
//		in = 9'b100000000; #20;
//		
//		in = 9'b001010101; #20;
	
//		in = 19'b1100101010010010100; #20;
//		
//		in = 19'b0111111111111111111; #20;

		in = 26'b11000100100100101010101011; #20;
		
		in = 26'b00111111111111111111111111; #20;
	
	
	end

endmodule 