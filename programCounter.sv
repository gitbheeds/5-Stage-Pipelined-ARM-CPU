`timescale 1ps/1ps


module programCounter(clk, rst, condAddr19, brAddr26, uncondBr, currPC, pc_plus4, branchReg, Rd, flagZero, branch);

	input logic clk, rst, uncondBr, branchReg, flagZero, branch;
	
	input logic [18:0] condAddr19;
	
	input logic [25:0] brAddr26;
	
	input logic [63:0] Rd;
	
	logic [63:0] condAddr64;
	
	logic [63:0] brAddr64;
	
	logic brTaken;
	
	output logic[63:0] currPC;
	
	logic [63:0] nextPC;
	
	wire [63:0] branchSE, shiftedBranch;
	
	parameter condAddrSize = 19;
	parameter brAddrSize = 26;
	
	logic int4;
//	
	and #(50) zeroGate(brTaken, flagZero, branch);
//	
//	or #(50) branchTakenGate(brTaken, uncondBr, int4);
	
		
	//extend inputs to 64 bits
	sign_extender #(condAddrSize) condBranch(condAddr19, condAddr64);
	
	sign_extender #(brAddrSize) uncondBranch(brAddr26, brAddr64);
	

	//select input to use in branching operation
	mux64x2_1 branchType(uncondBr, condAddr64, brAddr64, branchSE);
	

	
	//multiply by 4
	shifter leftShift2(.value(branchSE), .direction(1'b0), .distance(6'd2), .result(shiftedBranch));
	
	
	wire [63:0] nextOut, currentOut, int1, int2, int3;
	
	
	logic of_flag, co_flag;
	
	adder_4_pc add4(currentOut, int1);
	
	adder64_bit branchAdd(currentOut, shiftedBranch, 1'b0, int2, of_flag, co_flag);
	
	//select whether to use PC + branch or PC + 4
	//mux64x2_1 selBranchOrPlus4(branch, int1, int2, int3);
	
	mux64x4_1 bigBranchSelect(.in0(int1), .in1(int2), .in2(int2), .in3(int2), .out(int3), .sel({uncondBr, brTaken}));
	

	
	mux64x2_1 selNextOut(branchReg, int3, Rd, nextPC);
	
	
	assign currentOut = currPC;

	// second output for link register during BL (Branch Link) command
	output logic [63:0] pc_plus4;
	assign pc_plus4 = int1;
	
	
	
	
	// generate block to handle DFFs that update nextPC
	genvar i;
	generate
	
		for (i = 0; i < 64; i++) begin : reginald
			D_FF duffy(.q(currPC[i]), .d(nextPC[i]), .reset(rst), .clk(clk));
		
		end
	
	endgenerate
	

	

	
endmodule


module programCounter_tb();
	
	logic clk, rst;

	logic [63:0] currPC, pc_plus4, Rd;
	
	logic [18:0] condAddr19;
	
	logic [25:0] brAddr26;
	
	logic uncondBr, branchReg, flagZero, branch;
	
	parameter CLOCK_PERIOD = 8000;
	initial begin
		clk <= 0;
		// Forever toggle the clock
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	programCounter dut(clk, rst, condAddr19, brAddr26, uncondBr, currPC, pc_plus4, branchReg, Rd, flagZero, branch);
	
//	input logic clk, rst, uncondBr, brTaken, branchReg;
//	
//	input logic [18:0] condAddr19;
//	
//	input logic [25:0] brAddr26;
//	
//	input logic [63:0] Rd;
	
	initial begin
	
		uncondBr <= 0; branchReg <= 0;
		condAddr19 <= 19'b0; brAddr26 = 26'b0; Rd <= 64'd12; flagZero <= 1'b0; branch <= 1'b0; @(posedge clk);
		
		rst <= 1; @(posedge clk);
		rst <= 0; @(posedge clk);
		
		uncondBr <= 0; branchReg <= 0;
		condAddr19 <= 19'b0; brAddr26 = 26'b0; Rd <= 64'd12; flagZero <= 1'b0; branch <= 1'b0; @(posedge clk);
		
		repeat(20) @(posedge clk);
		
		uncondBr <= 0; branchReg <= 0; 
		condAddr19 <= 19'd19; brAddr26 <= 26'b0; Rd <= 64'd12; flagZero <= 1'b1; branch <= 1; @(posedge clk);
		
		uncondBr <= 0; branchReg <= 0; 
		condAddr19 <= 19'd19; brAddr26 <= 26'b0; Rd <= 64'd12; flagZero <= 1'b1; branch <= 0; @(posedge clk);
		
		uncondBr <= 1; branchReg <= 0; 
		condAddr19 <= 19'd19; brAddr26 <= 26'd50; Rd <= 64'd12; flagZero <= 1'b0; branch <= 1; @(posedge clk);
		
		repeat(2) @(posedge clk);
	
		$stop;
	end


endmodule
