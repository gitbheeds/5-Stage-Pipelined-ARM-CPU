//top level module for single cycle CPU
//makes all interconnections between different
//processing blocks
`timescale 1ps/1ps
module CPU_single(clk, rst);

	//clock input
	input logic clk, rst;
	
	//current PC value, next PC value
	logic [63:0] currPC, nextPC;
	
	//current instruction
	logic [31:0] instruction;
 
	//ALU flags
	logic zero, carry_out, overflow, negative;
	
	//displayed flags
	logic flagZero, flagCarry, flagOF, flagNeg;
	
	
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
			branchReg, branchLink, branch, memRead;
	
	logic[2:0] ALU_cntrl;
//----------------end control signals----------------------//
	
	
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
	logic[63:0] pc_plus4;
	
	logic [3:0] flags;

//---------------end module connections--------------------//		

//-------------------------Modules------------------------//
	
//program counter instantiation
	programCounter pc (.clk(~clk), .rst, .condAddr19, .brAddr26, .uncondBr, .branchReg, .currPC, .pc_plus4, .Rd(rd2), .flagZero(flags[2]), .branch, .flagNeg(flags[0]), .opcode(opcode[10]));
	
	
//instruction memory access
	instructmem insts (.address(currPC), .instruction, .clk(~clk));
	
//CPU control unit
	CPU_control control (.rst, .opcode, .uncondBr, .branch, .Reg2Loc, .ALU_Src, .RegWrite, 
								.ALU_SH, .Imm, .memToReg, .memWrite, .shiftDirn, .ALU_on, .set_flags, 
								.branchReg, .branchLink, .memRead);
								
								
//flag setting
	
	//flag register
	//flag[3] carry out
	//flag[2] zero
	//flag[1] overflow
	//flag[0] negative
	flagRegister flagsflagsflags (.clk, .rst, .set_flags, .flagsALU({carry_out, zero, overflow, negative}), .flagsOut(flags));
									
									
//ALU control unit
	ALU_control_unit aloo_control (.clk, .opcode, .ALU_on, .ALU_cntrl, .sign(SE9_out[63]));
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
	
	reg2locMux branchLinky2(branchLink, 5'd30, Rn, readA);
		
	regfile reggy(.ReadData1(rd1), .ReadData2(rd2), .WriteData(wd), 
					 .ReadRegister1(readA), .ReadRegister2(readB), .WriteRegister(targetReg),
					 .RegWrite, .clk(~clk));
	
//Sign Extension of dAddr9

	parameter daddr9Size = 9;
	sign_extender #(daddr9Size) daddrExtender(dAddr9, SE9_out);
	
	mux64x2_1_2scomp flipOffset(.sel(SE9_out[63]), .i0(SE9_out), .i1(SE9_out), .out(tempSE));
	
	logic co_temp, of_temp;
	
	adder64_bit offsetAdd(.input1(tempSE), .input2(0), .sub_control(SE9_out[63]), .out(SE64), .of_flag(of_temp), .co_flag(co_temp));

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
	mux64x2_1 ALUSrcMux(ALU_Src, rd2, ext_out, srcOut);

	//branch link, add pc+4 to x30
	//set ALU_B to zero for this
	
	mux64x2_1 linkDataB(.sel(branchLink), .i0(srcOut), .i1(pc_plus4), .out(ALU_B));

	alu aloo(.A(rd1), .B(ALU_B), .cntrl(ALU_cntrl), .result(ALU_out), .overflow, .negative, .zero, .carry_out);
	
//shifter instantiation
	
	shifter shift(rd1, shiftDirn, shamt, shift_out);
	
	
//data memory instantiation

	//ALU_SH mux goes here
	//i0 = ALU_out, i1 = shift_out
	//out = toDataMem
	
	mux64x2_1 ALU_ShiftMux(ALU_SH, ALU_out, shift_out, toDataMem);


	//DW transfer
	logic[3:0] xfer_size;
	
	assign xfer_size = 4'b1000;

	datamem mems(.address(toDataMem), .write_enable(memWrite), .read_enable(memRead), .write_data(rd2), .clk(clk), .xfer_size, .read_data(memDataOut));

	//MemToReg mux here
	//i0 = toDataMem, i1 = memDataOut
	//out = wd
	
	mux64x2_1 memToRegMux(memToReg, toDataMem, memDataOut, memRegMuxOut);
	
	
	//branchLink mux here
	//for setting link addrs
	//i0 = memRegMuxOut
	//i1 = pc_plus4
	//out = wd
	mux64x2_1 branchLinkMux(.sel(branchLink), .i0(memRegMuxOut), .i1(pc_plus4), .out(wd));


//-----------------------end Modules-----------------------//	
	
endmodule 

`timescale 1ps/1ps
module CPU_single_tb();
	
	logic clk, rst;
	
	parameter CLOCK_PERIOD = 100000;
	initial begin
		clk <= 0;
		// Forever toggle the clock
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	CPU_single dut(.clk, .rst);
	
	initial begin
	
		rst <= 1; @(posedge clk);
		rst <= 0; @(posedge clk);
		
		repeat(1000) @(posedge clk);
		
		$stop;
	end
	

endmodule
