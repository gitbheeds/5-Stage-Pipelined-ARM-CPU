
// single 64bit register construction
// clk: clock for the DFF that holds each bit
// write_en: single bit enable signal from the decoder that allows data to be written into a register
// WriteData: 64 bit data that will be written into the enabled register
// dataOut: 64 bit output from the register
module register64 (clk, write_en, WriteData, dataOut);
	input logic clk; // instantiates clock
	input logic write_en; // instantiates the write enable signal
	input logic [63:0] WriteData; // 64 bit variable to hold the incoming write data
	output logic [63:0] dataOut; // 64 bit variable to hold the register value and output it

	logic rst; // reset for the DFF that comprise the 64 bit register
	assign rst = 1'b0; // sets reset to 0 for proper DFF functionality
	
	logic [63:0] regData; // 64 bit value that goes into a register from the 2:1 mux
	// if write_en is low, the regData will equal the previous regData
	// if write_en is high, the regData will equal writeData
	
	// for loop counter variable
	genvar i;
	
	// generate block that pairs a 2:1 mux with every register to decide what data will be stored in each mux
	generate
		for(i = 0; i < 64; i++) begin : regAssembly
			mux2_1 enables (.out(regData[i]), .i0(dataOut[i]), .i1(WriteData[i]), .sel(write_en));
			D_FF dffs (.clk, .reset(rst), .d(regData[i]), .q(dataOut[i]));
		end
	endgenerate
	
endmodule 


