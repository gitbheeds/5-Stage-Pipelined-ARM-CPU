`timescale 1ps/1ps
module MEM_WB_Reg(clk, memToReg_MEM, RegWrite_MEM, targetReg_MEM, toDataMem_MEM, memDataOut,

						
						memToReg_WB, RegWrite_WB, targetReg_WB, toDataMem_WB, memDataOut_WB);
	
	input logic clk;
	
	input logic memToReg_MEM, RegWrite_MEM;
	
	input logic [4:0] targetReg_MEM;
	
	input logic [63:0] toDataMem_MEM, memDataOut;
	
	// 2 + 5 + 64 + 64 = 135 bits
	
	
	output logic memToReg_WB, RegWrite_WB;
	
	output logic [4:0] targetReg_WB;
	
	output logic [63:0] toDataMem_WB, memDataOut_WB;
	
	
	logic [134:0] registerIn, registerOut;
	
	assign registerIn[63:0] = toDataMem_MEM;
	assign registerIn[127:64] = memDataOut;
	assign registerIn[132:128] = targetReg_MEM;
	assign registerIn[133] = memToReg_MEM;
	assign registerIn[134] = RegWrite_MEM;
	
	
	logic not_clk;
	not #(50) (not_clk, clk);
	
	genvar i;
	generate
		for(i = 0; i < 135; i++) begin : Felina
			D_FF dffs (.clk(not_clk), .reset(1'b0), .d(registerIn[i]), .q(registerOut[i]));
		end
	endgenerate

	
	assign toDataMem_WB = registerOut[63:0];
	assign memDataOut_WB = registerOut[127:64];
	assign targetReg_WB = registerOut[132:128];
	assign memToReg_WB = registerOut[133];
	assign RegWrite_WB = registerOut[134];
	
endmodule

`timescale 1ps/1ps
module MEM_WB_Reg_tb();

	logic clk;
	
	// input logic signals
	logic memToReg_MEM, RegWrite_MEM;
	
	logic [4:0] targetReg_MEM;
	
	logic [63:0] toDataMem_MEM;
	
	logic [63:0] memDataOut;
	
	// output logic signals
	logic memToReg_WB, RegWrite_WB;
	
	logic [4:0] targetReg_WB;
	
	logic [63:0] toDataMem_WB;
	
	logic [63:0] memDataOut_WB;
	
	parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		// Forever toggle the clock
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	MEM_WB_Reg dut(.clk, .memToReg_MEM, .RegWrite_MEM, .targetReg_MEM, .toDataMem_MEM, .memDataOut,
	
						
						.memToReg_WB, .RegWrite_WB, .targetReg_WB, .toDataMem_WB, .memDataOut_WB);
						
	initial begin
		memToReg_MEM <= 1'b1; RegWrite_MEM <= 1'b1; targetReg_MEM <= 5'd15;
		toDataMem_MEM <= 64'd42069; memDataOut <= 64'd69420; @(posedge clk);
		
		repeat(2) @(posedge clk);
		
		$stop;
	end
	
endmodule
