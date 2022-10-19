
module decoder5_32(RegWrite, addr, outbus);
	input logic [4:0] addr; //register address to write to
	output logic [31:0] outbus; //holds write_en bit 
	
	input logic RegWrite;
	
	logic [3:0] en;
	
	decoder2_4 s1d0 (.en(RegWrite), .sel(addr[4:3]), .o(en[3:0])); //stage 1 2:4 decoder. Provides enables for stage 2 decoders
	
	decoder3_8 s2d3 (.en(en[3]), .sel(addr[2:0]), .o(outbus[31:24])); //stage 2 1st 3:8 decoder. write_en access for registers 31:24
	
	decoder3_8 s2d2 (.en(en[2]), .sel(addr[2:0]), .o(outbus[23:16])); //stage 2 2nd 3:8 decoder. write_en access for registers 23:16
	
	decoder3_8 s2d1 (.en(en[1]), .sel(addr[2:0]), .o(outbus[15:8]));  //stage 2 3rd 3:8 decoder. write_en access for registers 15:8
	
	decoder3_8 s2d0 (.en(en[0]), .sel(addr[2:0]), .o(outbus[7:0]));   //stage 2 4th 3:8 decoder. write_en access for registers 7:0



endmodule 