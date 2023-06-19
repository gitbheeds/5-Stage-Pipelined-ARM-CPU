
// top level module regFile
// ReadData1: 64 bit output from the multiplexors that represent the value stored at a register
// ReadData2: 64 bit output from the multiplexors that represent the value stored at a register
// WriteData: 64 bit value that can be written to a register
// ReadRegister1: Select the register whose values are output on ReadData1
// ReadRegister2: Selects the register whose values are output on ReadData2
// WriteRegister: Selects the target register of the write, will write to any register besides register 31
// RegWriter: Enable signal that enables the decoder and allows writing to a register
// clk: Clock for the registers
module regfile (ReadData1, ReadData2, WriteData, 
					 ReadRegister1, ReadRegister2, WriteRegister,
					 RegWrite, clk);
					 

		output logic [63:0] ReadData1, ReadData2; //64 bit outputs of what the value stored at a register is
		
		input logic [4:0] ReadRegister1, ReadRegister2, WriteRegister; // 5 bit values to select registers
		
		input logic [63:0] WriteData; // 64 bit value that can be written to a register
		
		input logic clk, RegWrite; //RegWrite: enables the decoder. When RegWrite is low, register address inputs will not enable writing 
											//to that register. When RegWrite is high, data from WriteData can be written to a register
		
		
		logic [31:0][63:0] regOut; //holds data from registers
		
		assign regOut[31] = 64'b0; // Sets register 31 to be 0
		
		logic [31:0] write_en; //output of decoder, enables writing for a specific register
				
		// instantiation of the 5:32 decoder that outputs write_en, which selects the specific register
		// to write to
		decoder5_32 writeEnable (RegWrite, WriteRegister, write_en);

		// for loop counter variable
		genvar i;
		
		// generate block that writes to every register besides regOutp[31]
		generate
		
			for(i = 0; i < 31; i++) begin : outputGen
			
				register64 reggy(clk, write_en[i], WriteData, regOut[i][63:0]);
			
			end
		
		endgenerate
		
		// Uses ReadRegister1 value and regOut to put the value of selected register in ReadData1
		mux64x32_1 read1 (ReadRegister1, regOut, ReadData1);
		
		// Uses ReadRegister2 value and regOut to put the value of selected register in ReadData2
		mux64x32_1 read2 (ReadRegister2, regOut, ReadData2);
		
endmodule 