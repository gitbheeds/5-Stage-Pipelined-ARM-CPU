

module regfile (ReadData1, ReadData2, WriteData, 
					 ReadRegister1, ReadRegister2, WriteRegister,
					 RegWrite, clk);
					 

		output logic [63:0] ReadData1, ReadData2;
		
		input logic [4:0] ReadRegister1, ReadRegister2, WriteRegister;
		
		input logic [63:0] WriteData; 
		
		input logic clk, RegWrite; //RegWrite: enables the decoder. When RegWrite is low, register address inputs will not enable writing 
											//to that register. When RegWrite is high, data from WriteData can be written to a register
		
		
		logic [31:0][63:0] regOut; //holds data from registers
		
		assign regOut[31] = 64'b0;
		
		logic [31:0] write_en; //output of decoder, enables writing for a specific register
		
		
		decoder5_32 writeEnable (RegWrite, WriteRegister, write_en);

		
		genvar i;
		
		generate
		
			for(i = 0; i < 31; i++) begin : outputGen
			
				register64 reggy(clk, write_en[31 - i], WriteData, regOut[i][63:0]);
			
			end
		
		endgenerate
		
		mux64x32_1 read1 (ReadRegister1, regOut, ReadData1);
	
		mux64x32_1 read2 (ReadRegister2, regOut, ReadData2);
		
endmodule 