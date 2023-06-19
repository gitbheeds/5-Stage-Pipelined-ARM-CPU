
// Processor control unit
// takes in 11 bit opcode and uses different slices of it for different operations
// ALU_on is high for operations that require the ALU
// set_flags is on for operations that require flags
// branchReg is for the BR operation and controls a mux that sets PC to the value of a register
// branchLink is a control for a mux that sends PC+4 to the link register R[30]
// compZero is a control for a mux that inputs 0 to the ALU for the CBZ command
module CPU_control(rst, opcode, uncondBr, branch, Reg2Loc, ALU_Src, RegWrite, 
						 ALU_SH, Imm, memToReg, memWrite, shiftDirn, ALU_on, set_flags, 
						 branchReg, branchLink, memRead, fwdEn);
						 
	input logic [10:0] opcode;
	
	input logic rst;
	
	output logic uncondBr, branch, Reg2Loc, ALU_Src, RegWrite, ALU_SH, Imm, memToReg, memWrite, shiftDirn;
	
	output logic branchReg, branchLink;
	
	output logic memRead;
	
	output logic ALU_on, set_flags;
	
	output logic [1:0] fwdEn;
	
	
	// Opcode slices
	logic [5:0] bOp;
	assign bOp = opcode[10:5];
	
	logic [10:0] dOp;
	assign dOp = opcode[10:0];
	
	logic [10:0] rOp;
	assign rOp = opcode[10:0];
	
	logic [7:0] cbOp;
	assign cbOp = opcode[10:3];
	
	logic [9:0] iOp;
	assign iOp = opcode[10:1];
	
	
	always_comb begin
	
	if(!rst) begin
	
			// unconditional branch
		if (bOp == 6'b000101) begin
			uncondBr = 1'b1;
			branch = 1'b0;
			branchReg = 1'b0;
			branchLink = 1'b0;
			memRead = 1'b0;
			
			
			Reg2Loc = 1'bX;
			ALU_Src = 1'bX;
			RegWrite = 1'b0;
			ALU_SH = 1'bX;
			Imm = 1'bX;
			memToReg = 1'bX;
			memWrite = 1'b0;
			shiftDirn = 1'bX;
			
			ALU_on = 1'b0;
			set_flags = 1'b0;
			fwdEn = 2'b00;
			
			
		end
		// conditional branch
		else if (cbOp == 8'b01010100)begin
			uncondBr = 1'b0;
			branch = 1'b1;
			branchReg = 1'b0;
			branchLink = 1'b0;
			memRead = 1'b0;
			
			Reg2Loc = 1'b0;
			ALU_Src = 1'b0;
			RegWrite = 1'b0;
			ALU_SH = 1'b0;
			Imm = 1'b0;
			memToReg = 1'bX;
			memWrite = 1'b0;
			shiftDirn = 1'bX;
			
			ALU_on = 1'b1;
			set_flags = 1'b0;
			fwdEn = 2'b00;
			
		
		end
		
		// branch with link
		else if (bOp == 6'b100101) begin
			uncondBr = 1'b1;
			branch = 1'b1;
			branchReg = 1'b0;
			branchLink = 1'b1;
			memRead = 1'b0;
			
			Reg2Loc = 1'b0;
			ALU_Src = 1'b0;
			RegWrite = 1'b1;
			ALU_SH = 1'b0;
			Imm = 1'bX;
			memToReg = 1'b0;
			memWrite = 1'b0;
			shiftDirn = 1'bX;
			
			ALU_on = 1'b1;
			set_flags = 1'b0;
			fwdEn = 2'b00;
			
			
		end
		
		// branch to register
		else if (rOp == 11'b11010110000) begin
			uncondBr = 1'b1;
			branch = 1'b0;
			branchReg = 1'b1;
			branchLink = 1'b0;
			memRead = 1'b0;
			
			Reg2Loc = 1'b0;
			ALU_Src = 1'b0;
			RegWrite = 1'b0;
			ALU_SH = 1'b0;
			Imm = 1'b0;
			memToReg = 1'b0;
			memWrite = 1'b0;
			shiftDirn = 1'bX;
			
			ALU_on = 1'b1;
			set_flags = 1'b0;
			fwdEn = 2'b00;
			
		end
		
		// CBZ
		else if (cbOp == 8'b10110100) begin
			uncondBr = 1'b0;
			branch = 1'b1;
			branchReg = 1'b0;
			branchLink = 1'b0;
			memRead = 1'b0;
			
			
			Reg2Loc = 1'b0;
			ALU_Src = 1'b0;
			RegWrite = 1'b0;
			ALU_SH = 1'b0;
			Imm = 1'bX;
			memToReg = 1'b0;
			memWrite = 1'b0;
			shiftDirn = 1'bX;
			
			ALU_on = 1'b1;
			set_flags = 1'b1;
			fwdEn = 2'b11;
			
		end
		
		// ADDI
		else if (iOp == 10'b1001000100) begin
			uncondBr = 1'b0;
			branch = 1'b0;
			branchReg = 1'b0;
			branchLink = 1'b0;
			memRead = 1'b0;
			
			Reg2Loc = 1'bX;
			ALU_Src = 1'b1;
			RegWrite = 1'b1;
			ALU_SH = 1'b0;
			Imm = 1'b1;
			memToReg = 1'b0;
			memWrite = 1'b0;
			shiftDirn = 1'b0;
			
			ALU_on = 1'b1;
			set_flags = 1'b0;
			fwdEn = 2'b10;
			
		end
		
		// ADDS (ADD, set flags)
		else if (rOp == 11'b10101011000) begin
			uncondBr = 1'b0;
			branch = 1'b0;
			branchReg = 1'b0;
			branchLink = 1'b0;
			memRead = 1'b0;
			
			Reg2Loc = 1'b1;
			ALU_Src = 1'b0;
			RegWrite = 1'b1;
			ALU_SH = 1'b0;
			Imm = 1'bX;
			memToReg = 1'b0;
			memWrite = 1'b0;
			shiftDirn = 1'bX;
			
			ALU_on = 1'b1;
			set_flags = 1'b1;
			fwdEn = 2'b11;
			
		end
		
		// LDUR
		else if (dOp == 11'b11111000010) begin
			uncondBr = 1'b0;
			branch = 1'b0;
			branchReg = 1'b0;
			branchLink = 1'b0;
			memRead = 1'b1;
			
			Reg2Loc = 1'bX;
			ALU_Src = 1'b1;
			RegWrite = 1'b1;
			ALU_SH = 1'b0;
			Imm = 1'b0;
			memToReg = 1'b1;
			memWrite = 1'b0;
			shiftDirn = 1'bX;
			
			ALU_on = 1'b1;
			set_flags = 1'b0;
			fwdEn = 2'b10;
			
		end
		
		// STUR
		else if (dOp == 11'b11111000000) begin
			uncondBr = 1'b0;
			branch = 1'b0;
			branchReg = 1'b0;
			branchLink = 1'b0;
			memRead = 1'b0;
			
			Reg2Loc = 1'b0;
			ALU_Src = 1'b1;
			RegWrite = 1'b0;
			ALU_SH = 1'b0;
			Imm = 1'b0;
			memToReg = 1'bX;
			memWrite = 1'b1;
			shiftDirn = 1'bX;
			
			ALU_on = 1'b1;
			set_flags = 1'b0;
			fwdEn = 2'b01;
			
		end
		
		// SUBS (SUB, set flags)
		else if (rOp == 11'b11101011000) begin
			uncondBr = 1'b0;
			branch = 1'b0;
			branchReg = 1'b0;
			branchLink = 1'b0;
			memRead = 1'b0;
			
			Reg2Loc = 1'b1;
			ALU_Src = 1'b0;
			RegWrite = 1'b1;
			ALU_SH = 1'b0;
			Imm = 1'bX;
			memToReg = 1'b0;
			memWrite = 1'b0;
			shiftDirn = 1'bX;
			
			ALU_on = 1'b1;
			set_flags = 1'b1;
			fwdEn = 2'b11;
			
	
		end
		
		// nothing happens 
		else begin
			// 
			uncondBr = 1'b0;
			branch = 1'b0;
			branchReg = 1'b0;
			branchLink = 1'b0;
			memRead = 1'bX;
			
			Reg2Loc = 1'b0;
			ALU_Src = 1'bX;
			RegWrite = 1'bX;
			ALU_SH = 1'bX;
			Imm = 1'bX;
			memToReg = 1'bX;
			memWrite = 1'bX;
			shiftDirn = 1'bX;
			
			ALU_on = 1'bX;
			set_flags = 1'b0;
			fwdEn = 2'b00;
			
		end
		
	end
	
	//reset condition
	else begin
		uncondBr = 1'b0;
		branch = 1'b0;
		branchReg = 1'b0;
		branchLink = 1'b0;
		memRead = 1'b0;
		
		Reg2Loc = 1'b0;
		ALU_Src = 1'b0;
		RegWrite = 1'b0;
		ALU_SH = 1'b0;
		Imm = 1'b0;
		memToReg = 1'b0;
		memWrite = 1'b0;
		shiftDirn = 1'b0;
		
		ALU_on = 1'b0;
		set_flags = 1'b0;
		fwdEn = 2'b00;
		
	end
	
	
	end

						 
endmodule



module CPU_control_tb();
	logic rst;

	logic [10:0] opcode;
	
	logic uncondBr, branch, Reg2Loc, ALU_Src, RegWrite, ALU_SH, Imm, memToReg, memWrite, shiftDirn;
	
	logic branchReg, branchLink;
	
	logic memRead;
	
	logic ALU_on, set_flags;
	
	logic [1:0] fwdEn;
	
	
	CPU_control dut(opcode, uncondBr, branch, Reg2Loc, ALU_Src, RegWrite, 
						 ALU_SH, Imm, memToReg, memWrite, shiftDirn, ALU_on, set_flags, 
						 branchReg, branchLink, memRead, fwdEn);
						 
	initial begin
	
		rst = 1'b1; #10;
		rst = 1'b0; #10;
		
		// unconditional branch test
		opcode = 11'b00010111001; #10;
		
		// conditional branch test
		opcode = 11'b01010100110; #10;
		
		// branch with link test
		opcode = 11'b10010111001; #10;
		
		// branch to register test
		opcode = 11'b11010110000; #10;
		
		// CBZ test
		opcode = 11'b10110100011; #10;
		
		// ADDI test
		opcode = 11'b10010001000; #10;
	
		// ADDS (ADD, set flags) test
		opcode = 11'b10101011000; #10;
		
		// LDUR test
		opcode = 11'b11111000010; #10;
		
		// STUR test
		opcode = 11'b11111000000; #10;
		
		// SUBS (SUB, set flags) test
		opcode = 11'b11101011000; #10;
		
		
		// else case test, should be all Z's
		opcode = 11'b11111111111; #10;
	end
	

endmodule
