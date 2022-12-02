//top level module for single cycle CPU
//makes all interconnections between different
//processing blocks
`timescale 1ps/1ps
module CPU_single(clk, rst);

	//clock input
	input logic clk, rst;
	
	//current PC value, currPC value to go through registers
	logic [63:0] currPC, currPC_reg;
	
	//current instruction
	logic [31:0] instruction;
 
	//ALU flags
	logic zero, carry_out, overflow, negative;
	
	// output flags
	//flag register
	//flag[3] carry out
	//flag[2] zero
	//flag[1] overflow
	//flag[0] negative
	logic [3:0] flags;
	
//-------------instruction variable assignment--------------// 
	
	//maximum opcode length
	logic [10:0] opcode;
	//assign opcode = instruction[31:21];
	
	//registers accessed in instructions
	logic [4:0] Rn, Rm, Rd;
	//assign Rn = instruction[9:5];
	//assign Rm = instruction[20:16];
	//assign Rd = instruction[4:0];
	
	//shift amount for R-type instructions
	logic [5:0] shamt;
	//assign shamt = instruction[15:10];
	
	//variable to hold offset amount for D type instructions
	logic [8:0] dAddr9;
	//assign dAddr9 = instruction[20:12];
	
	//hold 12 bit immediate from I-type instructions
	logic [11:0] ALU_Imm;
	//assign ALU_Imm = instruction[21:10];
	
	//conditional branch address for CB-type instructions
	logic [18:0] condAddr19;
	//assign condAddr19 = instruction[23:5];
	
	//branch address for B-type instructions
	logic [25:0] brAddr26;
	//assign brAddr26 = instruction[25:0];
	
	
//----------end instruction variable assignment------------//
	
//------------------control signals------------------------//
	// used instantly
	logic uncondBr;
	
	// Used before the ID/EX pipeline register
	logic Reg2Loc;
	
	// Used before the EX/MEM pipeline register
	logic ALU_Src, ALU_SH, Imm, shiftDirn, ALU_on, set_flags, branchReg, branch;
	logic[2:0] ALU_cntrl;
	
	// used before the MEM/WB pipeline register
	logic memToReg, memWrite, memRead;
	
	// Carried through all pipeline registers
	logic branchLink, RegWrite;
	
	// PC selection between pc + 4 and calcBranch
	logic PCSrc;
	
	// signal to turn on forwarding, is only used for R type and I type instructions
	// 2'b10 = I type
	// 2'b11 = R type
	logic [1:0] fwdEn;
	
//----------------end control signals----------------------//

//------------------ID/EX output signals-------------------//

	logic ALU_Src_EX, ALU_SH_EX, Imm_EX, shiftDirn_EX, ALU_on_EX, set_flags_EX, branchReg_EX, branch_EX;
	
	logic [2:0] ALU_cntrl_EX;
	
	logic memToReg_EX, memWrite_EX, memRead_EX;
	
	logic branchLink_EX, RegWrite_EX;
	
	logic [63:0] currPC_reg_EX, rd1_EX, rd2_EX;
	
	logic [4:0] targetReg_EX;
	
	logic [10:0] opcode_EX;
	
	logic [63:0] ext_out_EX;
	
	logic uncondBr_EX;
	
	logic [63:0] pc_plus4_EX;
	
	logic [5:0] shamt_EX;
	
	logic [63:0] branchSE_EX;
	
	logic [4:0] Rn_EX, Rm_EX;
	
	logic [1:0] fwdEn_EX;
	

//----------------end ID/EX output signals-----------------//

//------------------EX/MEM output signals------------------//

	logic memToReg_MEM, memWrite_MEM, memRead_MEM, branchLink_MEM, RegWrite_MEM;
	
	logic [4:0] targetReg_MEM;
	
	logic [63:0] toDataMem_MEM, ALU_B_MEM;
	
	logic [63:0] rd2_MEM;


//----------------end EX/MEM output signals----------------//


//------------------MEM/WB output signals------------------//

	logic memToReg_WB, RegWrite_WB; 
	
	logic [4:0] targetReg_WB; 
	
	logic [63:0] toDataMem_WB, memDataOut_WB;

//----------------End MEM/WB output signals----------------//

//--------------------Branch Extensions-------------------//
	// 64 bit variables to hold the 64 bit branch values
	logic [63:0] condAddr64, brAddr64, branchSE;
	
	// extends 19 bit condAddr19 to 64 bit condAddr64
	sign_extender #(19) condBranch(.in(condAddr19), .out(condAddr64));
	
	// extends 26 bit brAddr26 to 64 bit brAddr64
	sign_extender #(26) uncondBranch(.in(brAddr26), .out(brAddr64));
	
	mux64x2_1 branchType(.sel(uncondBr), .i0(condAddr64), .i1(brAddr64), .out(branchSE));
	
//------------------End Branch Extensions------------------//
	
	
//-----------------module connections----------------------//

	//write register
	logic[4:0] targetReg;

	//regfile ReadRegister2
	//output of Reg2Loc mux
	logic[4:0] readA, readB;

	//regfile dataout and writedata
	logic[63:0] rd1, rd2, wd;
	
	//sign extender output
	logic[63:0] SE9_out, SE64, tempSE;
	
	//immediate zero extender output
	logic[63:0] ZE12_out;
	
	//SE - ZE mux output
	logic[63:0] ext_out;
	
	//output of ALUsrc mux
	logic [63:0] srcOut;
	
	// output of linkData Mux, is the standard input to ALU_B without any forwarding
	logic [63:0] standardALU_B;
	
	//ALU inputs 
	logic[63:0] ALU_A, ALU_B;
	
	//ALU output
	logic[63:0] ALU_out;
	
	//shifter output
	logic[63:0] shift_out;
	
	//output of ALU_SH mux
	logic[63:0] toDataMem;
	
	//output of data memory
	logic[63:0] memDataOut;
	
	//memToRegMux output
	logic[63:0] memRegMuxOut;
	
	//for branch link
	logic[63:0] pc_plus4, pc_plus4_out;
	
	//calculated branch value to pass to PC
	logic[63:0] calcBranch;	

//---------------end module connections--------------------//

//------------Pipeline Control Units & Signals------------//

	// Flushes the IF/ID pipeline register
	logic IF_ID_flush;
	
	// used to control muxes for forwarding
	logic [1:0] FWDA, FWDB;

//--------------End Pipeline Control Signals--------------//		




//-------------------------Modules------------------------//
	
//program counter instantiation	
	programCounterFix pcf(.clk(clk), .rst, .currPC, .calcBranch, .pc_plus4, .PCSrc);
	
//instruction memory access
	instructmem insts (.address(currPC), .instruction, .clk(clk));
	
//CPU control unit
	CPU_control control (.rst, .opcode, .uncondBr, .branch, .Reg2Loc, .ALU_Src, .RegWrite, 
								.ALU_SH, .Imm, .memToReg, .memWrite, .shiftDirn, .ALU_on, .set_flags, 
								.branchReg, .branchLink, .memRead, .fwdEn);
								
//--------------------Pipeline Registers------------------//

	IF_ID_Reg IF_ID (.clk, .IF_ID_flush, .instruction, .currPC, .pc_plus4, .opcode, .Rn, 
						  .Rm, .Rd, .shamt, .dAddr9, .ALU_Imm, .condAddr19, 
						  .brAddr26, .currPC_out(currPC_reg), .pc_plus4_out);
						  
						  
	ID_EX_Reg ID_EX (.clk, .ALU_Src, .ALU_SH, .Imm, .shiftDirn, .ALU_on, .set_flags, .branchReg,
						  .branch, .ALU_cntrl, .memToReg, .memWrite, .memRead, .branchLink, .RegWrite,
						  .currPC_reg, .rd1, .rd2, .targetReg, .opcode, .ext_out, .uncondBr, .pc_plus4_out,
						  .shamt, .branchSE, .Rn, .Rm, .fwdEn,
						  
						  // ID/EX register outputs below (signals end in _EX)
						  .ALU_Src_EX, .ALU_SH_EX, .Imm_EX, .shiftDirn_EX, .ALU_on_EX, .set_flags_EX, .branchReg_EX,
						  .branch_EX, .ALU_cntrl_EX, .memToReg_EX, .memWrite_EX, .memRead_EX, .branchLink_EX, .RegWrite_EX,
						  .currPC_reg_EX, .rd1_EX, .rd2_EX, .targetReg_EX, .opcode_EX, .ext_out_EX, 
						  .uncondBr_EX, .pc_plus4_EX, .shamt_EX, .branchSE_EX, .Rn_EX, .Rm_EX, .fwdEn_EX);
						  
						  
	EX_MEM_Reg EX_MEM (.clk, .memToReg_EX, .memWrite_EX, .memRead_EX, .branchLink_EX, .RegWrite_EX,
							 .targetReg_EX, .toDataMem, .ALU_B, .rd2_EX,
							 
							 
							 // EX/MEM register outputs below (signals end in _MEM)
							 .memToReg_MEM, .memWrite_MEM, .memRead_MEM, .branchLink_MEM, .RegWrite_MEM,
							 .targetReg_MEM, .toDataMem_MEM, .ALU_B_MEM, .rd2_MEM);
							 
							 
	MEM_WB_Reg MEM_WB (.clk, .memToReg_MEM, .RegWrite_MEM, .targetReg_MEM, .toDataMem_MEM, .memDataOut,

							 // MEM/WB register outputs below (Signals end in _WB)
							 .memToReg_WB, .RegWrite_WB, .targetReg_WB, .toDataMem_WB, .memDataOut_WB);

//--------------------End Pipeline Registers---------------//

								
//flag setting
	
	//flag register
	//flag[3] carry out
	//flag[2] zero
	//flag[1] overflow
	//flag[0] negative
	flagRegister flagsflagsflags (.clk, .rst, .set_flags(set_flags_EX), .flagsALU({carry_out, zero, overflow, negative}), .flagsOut(flags));
									
									
//ALU control unit
	ALU_control_unit aloo_control (.clk, .opcode(opcode), .ALU_on(ALU_on), .ALU_cntrl(ALU_cntrl), .sign(SE9_out[63]));
//regfile instantiation
	
	//Reg2Loc mux goes here
	//i0 = Rd, i1 = Rm
	//out = readB
	reg2locMux regToLoc(Reg2Loc, Rm, Rd, readB);
	
	//branch link mux here
	//i0 = Rd
	//i1 = 5'd30 (link register)
	//out = targetReg
	reg2locMux branchLinky1(branchLink, 5'd30, Rd, targetReg);
	
	reg2locMux branchLinky2(branchLink, 5'd31, Rn, readA);
		
	regfile reggy(.ReadData1(rd1), .ReadData2(rd2), .WriteData(memRegMuxOut), 
					 .ReadRegister1(readA), .ReadRegister2(readB), .WriteRegister(targetReg_WB),
					 .RegWrite(RegWrite_WB), .clk(clk));
	
//Sign Extension of dAddr9

	parameter daddr9Size = 9;
	sign_extender #(daddr9Size) daddrExtender(dAddr9, SE9_out);
	
	mux64x2_1_2scomp flipOffset(.sel(SE9_out[63]), .i0(SE9_out), .i1(SE9_out), .out(tempSE));
	
	logic co_temp, of_temp;
	
	adder64_bit offsetAdd(.input1(tempSE), .input2(64'b0), .sub_control(SE9_out[63]), .out(SE64), .of_flag(of_temp), .co_flag(co_temp));

//Zero Extension of ALU_Imm

	parameter ALU_ImmSize = 12;
	
	zero_extender #(ALU_ImmSize) immExtender(ALU_Imm, ZE12_out);

	//Imm mux goes here
	//i0 = SE9_Out, i1 = ZE12_out
	//out = ext_out
	
	mux64x2_1 ImmMux(Imm, SE64, ZE12_out, ext_out); 


	
//ALU instantiation

	//ALU_Src mux goes here
	//i0 = rd2, i1 = ext_out
	//out = srcOut to linkDataB mux
	mux64x2_1 ALUSrcMux(ALU_Src_EX, rd2_EX, ext_out_EX, srcOut);

	//branch link, add pc+4 to x30
	//set ALU_B to zero for this
	
	mux64x2_1 linkDataB(.sel(branchLink_EX), .i0(srcOut), .i1(pc_plus4_EX), .out(standardALU_B));

	alu aloo(.A(ALU_A), .B(ALU_B), .cntrl(ALU_cntrl_EX), .result(ALU_out), .overflow, .negative, .zero, .carry_out);
	
//------------------BigBoy Forwarding-------------------//

	forwarding magicJohnson(.fwdEn_EX, .RegWrite_MEM, .RegWrite_WB, .targetReg_MEM, .targetReg_WB, 
						         .Rn_EX, .Rm_EX, .FWDA, .FWDB);
	
	// ALU input A
	// rd1_EX is standard without forwarding, memRegMuxOut is mem/wb forwarding, toDataMem_MEM is ex/mem forwarding
	mux64x4_1 forwardA(.in0(rd1_EX), .in1(memRegMuxOut), .in2(toDataMem_MEM), .in3(64'bX), .out(ALU_A), .sel(FWDA));
	
	
	mux64x4_1 forwardB(.in0(standardALU_B), .in1(memRegMuxOut), .in2(toDataMem_MEM), .in3(64'bX), .out(ALU_B), .sel(FWDB));
									

//----------------End BigBoy Forwarding-----------------//

//-----------------branch calculations------------------//

	branchCalcs calcifer(.branchSE_EX, .currPC_reg_EX, .resultALU(rd2_EX), 
					.uncondBr_EX, .branchReg_EX, .branch_EX, .zeroFlag(zero), .negFlag(flags[0]), .opcode(opcode_EX[10]), 
			   	.calcBranch, .PCSrc, .IF_ID_flush);

//---------------end branch calculations----------------//

	
//shifter instantiation
	
	shifter shift(rd1_EX, shiftDirn_EX, shamt_EX, shift_out);
	

//********Everything below is after EX/MEM pipeline register (pretty sure) ***********//	
//data memory instantiation

	//ALU_SH mux goes here
	//i0 = ALU_out, i1 = shift_out
	//out = toDataMem
	
	mux64x2_1 ALU_ShiftMux(ALU_SH_EX, ALU_out, shift_out, toDataMem);


	//DW transfer
	logic[3:0] xfer_size;
	
	assign xfer_size = 4'b1000;

	datamem mems(.address(toDataMem_MEM), .write_enable(memWrite_MEM), .read_enable(memRead_MEM), .write_data(rd2_MEM), .clk(clk), .xfer_size, .read_data(memDataOut));

	//MemToReg mux here
	//i0 = toDataMem, i1 = memDataOut
	//out = wd
	
	mux64x2_1 memToRegMux(memToReg_WB, toDataMem_WB, memDataOut_WB, memRegMuxOut);
	
	
	//branchLink mux here
	//for setting link addrs
	//i0 = memRegMuxOut
	//i1 = pc_plus4
	//out = wd
	//mux64x2_1 branchLinkMux(.sel(branchLink), .i0(memRegMuxOut), .i1(pc_plus4), .out(wd));


//-----------------------end Modules-----------------------//	
	
endmodule 

`timescale 1ps/1ps
module CPU_single_tb();
	
	logic clk, rst;
	
	parameter CLOCK_PERIOD = 20000;
	//parameter CLOCK_PERIOD = 100000;
	initial begin
		clk <= 0;
		// Forever toggle the clock
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	CPU_single dut(.clk, .rst);
	
	initial begin
	
		rst <= 1; @(posedge clk);
		rst <= 0; @(posedge clk);
		
		repeat(250) @(posedge clk);
		
		$stop;
	end
	

endmodule
