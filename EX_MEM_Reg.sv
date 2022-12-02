// EX_MEM pipeline register implementation
`timescale 1ps/1ps
module EX_MEM_Reg(clk, memToReg_EX, memWrite_EX, memRead_EX, branchLink_EX, RegWrite_EX,
						targetReg_EX, toDataMem, ALU_B,
						
						
						memToReg_MEM, memWrite_MEM, memRead_MEM, branchLink_MEM, RegWrite_MEM,
						targetReg_MEM, toDataMem_MEM, ALU_B_MEM);

	input logic clk;
	
	input logic memToReg_EX, memWrite_EX, memRead_EX, branchLink_EX, RegWrite_EX;
	
	input logic [4:0] targetReg_EX;
	
	input logic [63:0] toDataMem, ALU_B;
	
	// 5 + 5 + (64 * 2) = 138 bits
	
	output logic memToReg_MEM, memWrite_MEM, memRead_MEM, branchLink_MEM, RegWrite_MEM;
	
	output logic [4:0] targetReg_MEM;
	
	output logic [63:0] toDataMem_MEM, ALU_B_MEM;
	
	logic [137:0] registerIn, registerOut;
	
	// assigns register inputs to the input signals
	assign registerIn[63:0] = toDataMem;
	assign registerIn[127:64] = ALU_B;
	assign registerIn[132:128] = targetReg_EX;
	assign registerIn[133] = memToReg_EX;
	assign registerIn[134] = memWrite_EX;
	assign registerIn[135] = memRead_EX;
	assign registerIn[136] = branchLink_EX;
	assign registerIn[137] = RegWrite_EX;
	
	// uses an ~clk signal to ensure reading from pipeline register on the negative edge of the main clock
	logic not_clk;
	not #(50) (not_clk, clk);
	
	genvar i;
	generate
		for(i = 0; i < 138; i++) begin : ginerva
			D_FF dffs (.clk(not_clk), .reset(1'b0), .d(registerIn[i]), .q(registerOut[i]));
		end
	endgenerate
	
	// assigns output signals to the register output
	assign toDataMem_MEM = registerOut[63:0];
	assign ALU_B_MEM = registerOut[127:64];
	assign targetReg_MEM = registerOut[132:128];
	assign memToReg_MEM = registerOut[133];
	assign memWrite_MEM = registerOut[134];
	assign memRead_MEM = registerOut[135];
	assign branchLink_MEM = registerOut[136];
	assign RegWrite_MEM = registerOut[137];


endmodule

module EX_MEM_Reg_tb();

	logic clk;
	// input logics 
	logic memToReg_EX, memWrite_EX, memRead_EX, branchLink_EX, RegWrite_EX;
	
	logic [4:0] targetReg_EX;
	
	logic [63:0] toDataMem, ALU_B;
	
	// output logics
	logic memToReg_MEM, memWrite_MEM, memRead_MEM, branchLink_MEM, RegWrite_MEM;
	
	logic [4:0] targetReg_MEM;
	
	logic [63:0] toDataMem_MEM, ALU_B_MEM;
	
	parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		// Forever toggle the clock
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	EX_MEM_Reg dut(.clk, .memToReg_EX, .memWrite_EX, .memRead_EX, .branchLink_EX, .RegWrite_EX,
						.targetReg_EX, .toDataMem, .ALU_B,
						
						.memToReg_MEM, .memWrite_MEM, .memRead_MEM, .branchLink_MEM, .RegWrite_MEM,
						.targetReg_MEM, .toDataMem_MEM, .ALU_B_MEM);
	
	initial begin
		memToReg_EX <= 1'b1; memWrite_EX <= 1'b1; memRead_EX <= 1'b0; branchLink_EX <= 1'b0;
		RegWrite_EX <= 1'b1; targetReg_EX <= 5'd20; toDataMem <= 64'd420; ALU_B <= 64'd69; @(posedge clk);
		
		repeat(2) @(posedge clk);
		
		$stop;
	end
	

endmodule