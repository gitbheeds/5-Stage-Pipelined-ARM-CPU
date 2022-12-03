`timescale 1ps/1ps

module adder_4_pc(in, out);
	
	input logic [63:0] in; // 10 bit pc count value
	
	output logic [63:0] out; // 10 bit pc output with + 4 added
	
	logic [63:0] four;

	assign four = 64'd4;
	
	wire [63:0] c_out;
	
	
	
	genvar i;
	generate
		fullAdder fA(.a(in[0]), .b(four[0]), .cin(1'b0), .sum(out[0]), .cout(c_out[0]));
		for (i = 1; i < 64; i++) begin : pcIncrementAdder
			fullAdder fA(.a(in[i]), .b(four[i]), .cin(c_out[i-1]), .sum(out[i]), .cout(c_out[i]));
		end
	
	endgenerate

endmodule


module adder_4_pc_tb();

	logic [63:0] pc_input, pc_output;
	
	adder_4_pc dut(pc_input, pc_output);
	
	initial begin
		
		pc_input = 10'b0; #400;
		pc_input = 10'd4; #400;
		pc_input = 10'd100; #400;
		pc_input = 10'd240; #400;
	end

endmodule
