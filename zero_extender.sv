// zero_extender module that will extend 12 bit immediate values to 64 bits
// imm12: the 12 bit immediate value required for a I type instruction
// dataOut: The 64 bit zero extended data output that will be sent to the ALU
module zero_extender(imm12, dataOut);

	input logic [11:0] imm12;
	output logic [63:0] dataOut;
	
	reg [63:0] large_boy; // 64 bit internal register
	
	
	assign large_boy[11:0] = imm12; // assigns the first 12 bits to the 12 bits of imm 12
	
	assign large_boy[63:12] = 0; // assigns the last 52 bits to 0
	
	assign dataOut = large_boy; // assigns the output to the 64 bit register large_boy
	


endmodule

module zero_extender_tb();

	logic [11:0] imm12;
	logic [63:0] dataOut;
	
	zero_extender dut(imm12, dataOut);
	
	initial begin
		
		imm12 = 12'hABC; #10;
		
		imm12 = 12'hBBB; #10;
		
		imm12 = 12'h321; #10;
	
	end


endmodule
