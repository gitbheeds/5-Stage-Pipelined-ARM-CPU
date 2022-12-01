
`timescale 1ps/1ps
//lives in EX stage, needed to calculate
//how to branch

module branchCalcs (branchSE_EX, currPC_reg_EX, resultALU, 
						  uncondBr_EX, branchReg_EX, branch_EX, zeroFlag, negFlag, opcode, 
						  calcBranch, PCSrc);

//------------------fields------------------//

	//Sign extended branch to take (determined in ID stage)
	input logic [63:0] branchSE_EX;
	
	//Value of a register to use for BR insts
	input logic [63:0] resultALU;
	
	//Current value of PC to use for calculating PC + Branch
	input logic [63:0] currPC_reg_EX;
	
	//Mux control signals for determining which branch to take
	input logic uncondBr_EX, branchReg_EX, branch_EX, zeroFlag, negFlag, opcode;
	
	//PCSrc control signal is calculated in here and passed to PC
	//to determine branching vs pc + 4
	output logic PCSrc;
	
	//Calculated PC + Branch to pass to PC
	output logic [63:0] calcBranch;

//------------------fields------------------//	
	
	
	
//----------------calcBranch----------------//	

	//output of shifter
	logic [63:0] brShifted;
	
	//output of PC + brShifted adder
	logic [63:0] pcBranch;
	
	//unused flags from 64bit adder
	logic unused1, unused2;
	
	
	//shifter, multiplies by 4
	shifter leftShift2(.value(branchSE_EX), .direction(1'b0), .distance(6'd2), .result(brShifted));
	
	//add shifted value to currPC_reg_EX
	adder64_bit branchAdd(currPC_reg_EX, brShifted, 1'b0, pcBranch, unused1, unused2);
	
	//output of branchReg mux, selects between 
	//pcBranch and resultALU as the output
	//output calcBranch
	mux64x2_1 branchRegMux(.sel(branchReg_EX), .i0(pcBranch), .i1(resultALU), .out(calcBranch));
	
//----------------calcBranch----------------//


//-------------------PCSrc------------------//	

	//determines if CBZ is true
	logic CBZ;
	
	//needed to determine if B.LT is true
	//differentiates it from if CBZ is true
	logic notOp;
	
	//determines if B.LT is true
	logic B_LT;
	
	//determines if a conditional branch is taken
	logic condSelected;
	
	
	
	//~op needed for confirming B.LT
	not #(50) notOpGate(notOp, opcode);

	//AND gate for CBZ	
	and #(50) CBZcheck(CBZ, zeroFlag, branch_EX, opcode);
	
	//AND gate for B.LT
	and #(50) BLTcheck(B_LT, negFlag, branch_EX, notOp);

	//conditional branch selection
	or #(50) cndBrSel(condSelected, CBZ, B_LT);
	
	//check for unconditional branch as the last step
	//output PCSrc
	or #(50) PCSrcCheck(PCSrc, condSelected, uncondBr_EX);



//-------------------PCSrc------------------//		
	

endmodule
