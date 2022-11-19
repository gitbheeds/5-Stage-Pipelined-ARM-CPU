//top level module for single cycle CPU
//makes all interconnections between different
//processing blocks

module CPU_single();

	//clock input
	logic clk;
	
	//current PC value, next PC value
	logic [63:0] currPC, nextPC;
	
	//current instruction
	logic [31:0] instruction;
 
	//ALU flags
	logic zero, carry_out, overflow, negative;
	
//-------------instruction variable assignment--------------// 
	
	//maximum opcode length
	logic [10:0] opcode;
	assign opcode = instruction[31:21];
	
	//registers accessed in instructions
	logic [4:0] Rn, Rm, Rd;
	assign Rn = instruction[9:5];
	assign Rm = instruction[20:16];
	assign Rd = instruction[4:0];
	
	//shift amount for R-type instructions
	logic [5:0] shamt;
	assign shamt = instruction[15:10];
	
	//variable to hold offset amount for D type instructions
	logic [8:0] dAddr9;
	assign dAddr9 = instruction[20:12];
	
	//hold 12 bit immediate from I-type instructions
	logic [11:0] ALU_Imm;
	assign ALU_Imm = instruction[21:10];
	
	//conditional branch address for CB-type instructions
	logic [18:0] condAddr19;
	assign condAddr19 = instruction[23:5];
	
	//branch address for B-type instructions
	logic [25:0] brAddr26;
	assign brAddr26 = instruction[25:0];
	
	
//----------end instruction variable assignment------------//
	
//------------------control signals------------------------//
	logic uncondBr, brTaken, Reg2Loc, ALU_Src, RegWrite,
			ALU_SH, Imm, memToReg, memWrite, shiftDirn, ALU_on, set_flags,
			branchReg, branchLink, compZero;
			
			
			//
	
	logic[2:0] ALU_cntrl;
//----------------end control signals----------------------//
	
	
//-----------------module connections----------------------//

	//regfile ReadRegister2
	//output of Reg2Loc mux
	logic[63:0] readB;

	//regfile dataout and writedata
	logic[63:0] rd1, rd2, wd;
	
	//sign extender output
	logic[63:0] SE9_out;
	
	//immediate zero extender output
	logic[63:0] ZE12_out;
	
	//SE - ZE mux output
	logic[63:0] ext_out;
	
	//ALU_B input (output of ALU_Src mux)
	logic[63:0] ALU_B;
	
	//ALU output
	logic[63:0] ALU_out;
	
	//shifter output
	logic[63:0] shift_out;
	
	//output of ALU_SH mux
	logic[63:0] toDataMem;
	
	//output of data memory
	logic[63:0] memDataOut;
	
	//output of MemToReg mux
	logic[63:0] memtoReg;
	
	//for branch link
	logic[63:0] pc_plus4;

//---------------end module connections--------------------//		

//-------------------------Modules------------------------//
	
//program counter instantiation
	programCounter pc (.currPC, .condAddr19, .brAddr26, .uncondBr, .brTaken, .branchReg, .nextPC, .pc_plus4);
	
//instruction memory access
	instructmem insts (.address(currPC), .instruction, .clk);
	
//CPU control unit
	
//ALU control unit
	
//regfile instantiation
	
	//Reg2Loc mux goes here
	//i0 = Rd, i1 = Rm
	//out = readB
	reg2locMux regToLoc(Reg2Loc, Rm, Rd, readB);
	
	
	regfile reggy(.ReadData1(rd1), .ReadData2(rd2), .WriteData(wd), 
					 .ReadRegister1(Rn), .ReadRegister2(readB), .WriteRegister(Rd),
					 .RegWrite, .clk);
	
//Sign Extension of dAddr9

	parameter daddr9Size = 9;
	sign_extender #(daddr9Size) daddrExtender(dAddr9, SE9_out);

//Zero Extension of ALU_Imm

	parameter ALU_ImmSize = 12;
	
	zero_extender #(ALU_ImmSize) immExtender(ALU_Imm, ZE12_out);

	//Imm mux goes here
	//i0 = SE9_Out, i1 = ZE12_out
	//out = ext_out
	
	mux64x2_1 ImmMux(Imm, SE9_out, ZE12_out, ext_out); 
	
	
//ALU instantiation

	//ALU_Src mux goes here
	//i0 = rd2, i1 = ext_out
	//out = ALU_B
	mux64x2_1 ALUSrcMux(ALU_Src, rd2, ext_out, ALU_B);
	
	//zeroComp mux goes here
	

	alu aloo(.A(rd1), .B(ALU_B), .cntrl(ALU_cntrl), .result(ALU_out), .overflow, .negative, .zero, .carry_out);
	
//shifter instantiation
	
	shifter shift(Rn, shiftDirn, shamt, shift_out);
	
	
//data memory instantiation

	//ALU_SH mux goes here
	//i0 = ALU_out, i1 = shift_out
	//out = toDataMem
	
	mux64x2_1 ALU_ShiftMux(ALU_SH, ALU_out, shift_out, toDataMem);
	
	//no idea what to do with xfer size, may be dependent on LDUR/STUR vs LDURB/STURB
	logic[3:0] xfer_size;

	datamem mems(.address(toDataMem), .write_enable(memWrite), .read_enable(1'b1), .write_data(rd2), .clk, .xfer_size, .read_data(memDataOut));

	//MemToReg mux here
	//i0 = toDataMem, i1 = memDataOut
	//out = wd
	
	mux64x2_1 memToRegMux(memToReg, toDataMem, memDataOut, wd);
	
	
	//branchLink mux here
	//for setting link addrs
	//i0 = wd (change name)
	//i1 = pc_plus4
	//out = wd
	//BL instruction

//-----------------------end Modules-----------------------//	
	
endmodule 