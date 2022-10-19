

//single 64bit register construction

module register64 (clk, write_en, WriteData, dataOut);
	input logic clk;
	input logic write_en;
	input logic [63:0] WriteData;
	output logic [63:0] dataOut;

	logic rst;
	assign rst = 1'b0;
	
	logic [63:0] regData;
	
	
	genvar i;
	
	generate
	
		for(i = 0; i < 64; i++) begin : regAssembly
			mux2_1 enables (.out(regData[i]), .i0(dataOut[i]), .i1(WriteData[i]), .sel(write_en));
			D_FF dffs (.clk, .reset(rst), .d(regData[i]), .q(dataOut[i]));
		
		end
	
	endgenerate
	
endmodule 


