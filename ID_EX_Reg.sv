`timescale 1ps/1ps
module ID_EX_Reg (clk, ALU_Src, ALU_SH, Imm, shiftDirn, ALU_on, set_flags, branchReg, 
						branch, ALU_cntrl, memToReg, memWrite, memRead, branchLink, RegWrite, 
						currPC_reg, rd1, rd2, targetReg, opcode, ext_out, uncondBr, pc_plus4_out, shamt,
						
						ALU_Src_EX, ALU_SH_EX, Imm_EX, shiftDirn_EX, ALU_on_EX, set_flags_EX,
						branchReg_EX, branch_EX, ALU_cntrl_EX, memToReg_EX, memWrite_EX, memRead_EX,
						branchLink_EX, RegWrite_EX, currPC_reg_EX, rd1_EX, rd2_EX, targetReg_EX,
						opcode_EX, ext_out_EX, uncondBr_EX, pc_plus4_EX, shamt_EX);
						
	input logic clk;
	input logic ALU_Src, ALU_SH, Imm, shiftDirn, ALU_on, set_flags, branchReg, branch;
	input logic [2:0] ALU_cntrl; // 3 bit signal
	input logic memToReg, memWrite, memRead, branchLink, RegWrite; // 13 1 bit signals
	
	// currPC_reg is the passed along currPC value
	// rd1 is readData 1 from the regfile
	// rd2 is readData 2 from the regFile
	// ext_out is SE or ZE output
	input logic [63:0] currPC_reg, rd1, rd2, ext_out; // 4 64 bit signals
	
	// 11 bit opcode
	input logic [10:0] opcode;
	
	// targetReg is the destination for the write data
	input logic [4:0] targetReg; // 5 bit signal
	
	input logic uncondBr;
	
	input logic [63:0] pc_plus4_out;
	
	input logic [5:0] shamt;
	
	// total input bits: 
	// 13 + 3 + (64 * 4) + 5 + 11 + 1 + 64 + 6 = 359 bits
	
	
	// output logic instantiations:
	output logic ALU_Src_EX, ALU_SH_EX, Imm_EX, shiftDirn_EX, ALU_on_EX, set_flags_EX,
					 branchReg_EX, branch_EX, memToReg_EX, memWrite_EX, memRead_EX, branchLink_EX,
					 RegWrite_EX;
					 
	output logic [2:0] ALU_cntrl_EX;
	
	output logic [63:0] currPC_reg_EX, rd1_EX, rd2_EX, ext_out_EX;
	
	output logic [4:0] targetReg_EX;
	
	output logic [10:0] opcode_EX;
	
	output logic uncondBr_EX;
	
	output logic [63:0] pc_plus4_EX;
	
	output logic [5:0] shamt_EX;
	
	logic [358:0] registerIn, registerOut;
	
	
	assign registerIn [4:0] = targetReg;
	assign registerIn [7:5] = ALU_cntrl;
	assign registerIn [71:8] = currPC_reg;
	assign registerIn [135:72] = rd1;
	assign registerIn [199:136] = rd2;
	assign registerIn [263:200] = ext_out;
	assign registerIn [264] = ALU_Src;
	assign registerIn [265] = ALU_SH;
	assign registerIn [266] = Imm;
	assign registerIn [267] = shiftDirn;
	assign registerIn [268] = ALU_on;
	assign registerIn [269] = set_flags;
	assign registerIn [270] = branchReg;
	assign registerIn [271] = branch;
	assign registerIn [272] = memToReg;
	assign registerIn [273] = memWrite;
	assign registerIn [274] = memRead;
	assign registerIn [275] = branchLink;
	assign registerIn [276] = RegWrite;
	assign registerIn [287:277] = opcode;
	assign registerIn [288] = uncondBr;
	assign registerIn [352:289] = pc_plus4_out;
	assign registerIn [358:353] = shamt;
	
	logic not_clk;
	not #(50) (not_clk, clk);
	
	genvar i;
	generate
		for(i = 0; i < 359; i++) begin : ID_EX
			D_FF dffs (.clk(not_clk), .reset(1'b0), .d(registerIn[i]), .q(registerOut[i]));
		end
	endgenerate

	assign targetReg_EX = registerOut[4:0];
	assign ALU_cntrl_EX = registerOut[7:5];
	assign currPC_reg_EX = registerOut[71:8];
	assign rd1_EX = registerOut[135:72];
	assign rd2_EX = registerOut[199:136];
	assign ext_out_EX = registerOut[263:200];
	assign ALU_Src_EX = registerOut[264];
	assign ALU_SH_EX = registerOut[265];
	assign Imm_EX = registerOut[266];
	assign shiftDirn_EX = registerOut[267];
	assign ALU_on_EX = registerOut[268];
	assign set_flags_EX = registerOut[269];
	assign branchReg_EX = registerOut[270];
	assign branch_EX = registerOut[271];
	assign memToReg_EX = registerOut[272];
	assign memWrite_EX = registerOut[273];
	assign memRead_EX = registerOut[274];
	assign branchLink_EX = registerOut[275];
	assign RegWrite_EX = registerOut[276];
	assign opcode_EX = registerOut[287:277];
	assign uncondBr_EX = registerOut[288];
	assign pc_plus4_EX = registerOut[352:289];
	assign shamt_EX = registerOut[358:353];

endmodule

`timescale 1ps/1ps
module ID_EX_Reg_tb();
	
	logic clk, ALU_Src, ALU_SH, Imm, shiftDirn, ALU_on, set_flags, branchReg, 
			branch, memToReg, memWrite, memRead, branchLink, RegWrite;
	
	logic [2:0] ALU_cntrl;
	
	logic [63:0] currPC_reg, rd1, rd2, ext_out;
	
	logic [10:0] opcode;
	
	logic [4:0] targetReg;
	
	logic uncondBr;
	
	logic [63:0] pc_plus4_out;
	
	logic [5:0] shamt;
	
	// output control signals for next stage
	logic ALU_Src_EX, ALU_SH_EX, Imm_EX, shiftDirn_EX, ALU_on_EX, set_flags_EX,
			branchReg_EX, branch_EX, memToReg_EX, memWrite_EX, memRead_EX,
			branchLink_EX, RegWrite_EX; 
	
	logic [2:0] ALU_cntrl_EX;
	
	// output PC values, register values, and SE/ZE values for next stage in pipeline
	logic [63:0] currPC_reg_EX, rd1_EX, rd2_EX, ext_out_EX;
	
	// output targetReg for write
	logic [4:0] targetReg_EX;
	
	// output opcode for next stage of pipeline
	logic [10:0] opcode_EX;
	
	logic uncondBr_EX;
	
	logic [63:0] pc_plus4_EX;
	
	logic [5:0] shamt_EX;

	parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		// Forever toggle the clock
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	ID_EX_Reg dut(clk, ALU_Src, ALU_SH, Imm, shiftDirn, ALU_on, set_flags, branchReg, 
					  branch, ALU_cntrl, memToReg, memWrite, memRead, branchLink, RegWrite, currPC_reg, 
					  rd1, rd2, targetReg, opcode, ext_out, uncondBr, pc_plus4_out, shamt,
					  
					  ALU_Src_EX, ALU_SH_EX, Imm_EX, shiftDirn_EX, ALU_on_EX, set_flags_EX,
					  branchReg_EX, branch_EX, ALU_cntrl_EX, memToReg_EX, memWrite_EX, memRead_EX,
					  branchLink_EX, RegWrite_EX, currPC_reg_EX, 
					  rd1_EX, rd2_EX, targetReg_EX, opcode_EX, ext_out_EX, uncondBr_EX, pc_plus4_EX,
					  shamt_EX);
					  
	initial begin
		
		ALU_Src <= 1'b1; ALU_SH <= 1'b1; Imm <= 1'b1; shiftDirn <= 1'b0; ALU_on <= 1; set_flags <= 1;
		branchReg <= 1'b0; branch <= 1'b0; ALU_cntrl = 3'b011; memToReg <= 1'b1; memWrite <= 1'b0;
		memRead <= 1'b0; branchLink <= 1'b0; RegWrite <= 1'b0; currPC_reg = 64'd200; rd1 <= 64'd20;
		rd2 <= 64'd40; targetReg <= 5'd20; opcode <= 11'd20; ext_out <= 64'd300; uncondBr <= 1; 
		pc_plus4_out <= 64'd204; shamt = 6'd10; @(posedge clk);
		
		repeat(1) @(posedge clk);
		
		$stop;
		
	 
	end


endmodule
