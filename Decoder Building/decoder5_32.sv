	`timescale 1ps/1ps
// 5:32 decoder, which uses one 2:4 decoder to select one of the 3:8 decoders to enable
// the 2:4 decoder is enabled by RegWrite, which enables an output from the entire 5:32 decoder
module decoder5_32(RegWrite, addr, outbus);
	input logic [4:0] addr; //register address to write to
	output logic [31:0] outbus; //holds write_en bit 
	
	input logic RegWrite; // RegWrite input from the top level
	
	logic [3:0] en; // 4 bit enable signal that is outputted from the 2:4 decoder
	
	decoder2_4 s1d0 (.en(RegWrite), .sel(addr[4:3]), .o(en[3:0])); //stage 1 2:4 decoder. Provides enables for stage 2 decoders
	
	decoder3_8 s2d3 (.en(en[3]), .sel(addr[2:0]), .o(outbus[31:24])); //stage 2 1st 3:8 decoder. write_en access for registers 0:7
	
	decoder3_8 s2d2 (.en(en[2]), .sel(addr[2:0]), .o(outbus[23:16])); //stage 2 2nd 3:8 decoder. write_en access for registers 8:15
	
	decoder3_8 s2d1 (.en(en[1]), .sel(addr[2:0]), .o(outbus[15:8]));  //stage 2 3rd 3:8 decoder. write_en access for registers 16:23
	
	decoder3_8 s2d0 (.en(en[0]), .sel(addr[2:0]), .o(outbus[7:0]));   //stage 2 4th 3:8 decoder. write_en access for registers 24:31



endmodule 

// testbench for the 5:32 decoder
module decoder5_32_testbench();

	logic RegWrite;
	
	logic [4:0] addr;
	
	logic [31:0] out;
	
	decoder5_32 dut(.RegWrite(RegWrite), .addr(addr), .outbus(out));
	
	int i;
	
	initial begin
		 // selects register 4 to write to while RegWrite is 0
		RegWrite = 1'b1; #50; // selects register 8 to write to while RegWrite is high
		
		for (i = 0; i < 32; i++) begin
			addr = i; #500;
		end
	end

endmodule
