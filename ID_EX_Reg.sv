module ID_EX_Reg (clk, ALU_Src, ALU_SH, Imm, shiftDirn, ALU_on, set_flags, branchReg, 
						branch, ALU_cntrl, memToReg, memWrite, memRead, branchLink, RegWrite, 
						currPC_reg, rd1, rd2, targetReg, opcode, ext_out,
						
						ALU_Src_EX, ALU_SH_EX, Imm_EX, shiftDirn_EX, ALU_on_EX, set_flags_EX,
						branchReg_EX, branch_EX, ALU_cntrl_EX, memToReg_EX, memWrite_EX, memRead_EX,
						branchLink_EX, RegWrite_EX, currPC_reg_EX, rd1_EX, rd2_EX, targetReg_EX,
						opcode_EX, ext_out_EX);
						
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
	
	// total input bits: 
	// 13 + 3 + (64 * 4) + 5 = 277 bits
	
	
	// output logic instantiations:
	output logic ALU_Src_EX, ALU_SH_EX, Imm_EX, shiftDirn_EX, ALU_on_EX, set_flags_EX,
					 branchReg_EX, branch_EX, memToReg_EX, memWrite_EX, memRead_EX, branchLink_EX,
					 RegWrite_EX;
					 
	output logic [2:0] ALU_cntrl_EX;
	
	output logic [63:0] currPC_reg_EX, rd1_EX, rd2_EX, ext_out_EX;
	
	output logic [4:0] targetReg_EX;
	
	output logic [10:0] opcode_EX;
	
	logic [287:0] registerIn, registerOut;
	
	
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
	
	
	genvar i;
	generate
		for(i = 0; i < 277; i++) begin : ID_EX
			D_FF dffs (.clk, .reset(1'b0), .d(registerIn[i]), .q(registerOut[i]));
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

endmodule

	