`timescale 1ps/1ps

//  opcode is necessary to distinguish between CBZ and B.LT conditions
// opcode[10] = 1 is for CBZ, and opcode[10] = 0 is for B.LT
module programCounter(clk, rst, condAddr19, brAddr26, uncondBr, currPC, pc_plus4, 
							 branchReg, Rd, flagZero, branch, flagNeg, opcode);

	input logic clk, rst, uncondBr, branchReg, flagZero, branch, flagNeg;
	
	// opcode: looking specifically at the MSB of the opcode
	input logic opcode;
	
	input logic [18:0] condAddr19;
	
	input logic [25:0] brAddr26;
	
	//data at register for branch to register inst
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
	
	logic notOp;
	not #(50) notOpGate(notOp, opcode);
	

	// AND gate for CBZ	
	and #(50) zeroGate(brTaken, flagZero, branch, opcode);
	
	//	 AND gate for B.LT
	and #(50) negFlagGate(int4, flagNeg, branch, notOp);
	
		
	//extend inputs to 64 bits
	sign_extender #(condAddrSize) condBranch(condAddr19, condAddr64);
	
	sign_extender #(brAddrSize) uncondBranch(brAddr26, brAddr64);
	

	//select input to use in branching operation
	mux64x2_1 branchType(uncondBr, condAddr64, brAddr64, branchSE);
	

	
	//multiply by 4
	shifter leftShift2(.value(branchSE), .direction(1'b0), .distance(6'd2), .result(shiftedBranch));
	
	
	logic [63:0] nextOut, currentOut, int1, int2, int3, pcReg;
	
	
	logic of_flag, co_flag;
	
	adder_4_pc add4(currentOut, int1);
	
	adder64_bit branchAdd(currentOut, shiftedBranch, 1'b0, int2, of_flag, co_flag);
	
	
	//select whether to use PC + branch or PC + 4	
	mux64x8_1 bigBranchSelect(.in0(int1), .in1(int2), .in2(int2), .in3(int2), .in4(int2), .in5(64'b0), 
									  .in6(int2), .in7(int2), .out(int3), .sel({int4, uncondBr, brTaken}));

	
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

// testbench for above module
module programCounter_tb();
	
	logic clk, rst;

	logic [63:0] currPC, pc_plus4, Rd;
	
	logic [18:0] condAddr19;
	
	logic [25:0] brAddr26;
	
	logic uncondBr, branchReg, flagZero, branch;
	
	logic flagNeg, opcode;
	
	parameter CLOCK_PERIOD = 8000;
	initial begin
		clk <= 0;
		// Forever toggle the clock
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	programCounter dut(clk, rst, condAddr19, brAddr26, uncondBr, currPC, pc_plus4, 
							 branchReg, Rd, flagZero, branch, flagNeg, opcode);
	
	initial begin
	
		uncondBr <= 1'b0; branchReg <= 1'b0;
		condAddr19 <= 19'b0; brAddr26 = 26'b0; Rd <= 64'd12; flagZero <= 1'b0; branch <= 1'b0;
	   flagNeg <= 1'b0; opcode = 1'b0;	@(posedge clk);
		
		rst <= 1; @(posedge clk);
		rst <= 0; @(posedge clk);
		
		uncondBr <= 1'b0; branchReg <= 1'b0;
		condAddr19 <= 19'b0; brAddr26 = 26'b0; Rd <= 64'd12; flagZero <= 1'b0; branch <= 1'b0;
		flagNeg <= 1'b0; opcode = 1'b0; @(posedge clk);
		
		repeat(20) @(posedge clk);
		
		uncondBr <= 1'b0; branchReg <= 1'b0; 
		condAddr19 <= 19'd19; brAddr26 <= 26'b0; Rd <= 64'd12; flagZero <= 1'b1; branch <= 1'b1; 
		flagNeg <= 1'b0; opcode = 1'b0; @(posedge clk);
		
		uncondBr <= 1'b0; branchReg <= 1'b0; 
		condAddr19 <= 19'd19; brAddr26 <= 26'b0; Rd <= 64'd12; flagZero <= 1'b1; branch <= 1'b1; 
		flagNeg <= 1'b0; opcode = 1'b1; @(posedge clk);
		
		uncondBr <= 1'b0; branchReg <= 1'b0; 
		condAddr19 <= 19'd19; brAddr26 <= 26'd50; Rd <= 64'd12; flagZero <= 1'b0; branch <= 1'b1; 
		flagNeg <= 1'b0; opcode = 1'b0; @(posedge clk);
		
		repeat(2) @(posedge clk);
		
		uncondBr <= 1'b0; branchReg <= 1'b0;
		condAddr19 <= 19'd5; brAddr26 <= 16'd20; Rd <= 64'd10; flagZero <= 1'b0; branch <= 1'b1;
		flagNeg <= 1'b1; opcode = 1'b0; @(posedge clk);
		
		uncondBr <= 1'b0; branchReg <= 1'b0;
		condAddr19 <= 19'd5; brAddr26 <= 16'd20; Rd <= 64'd10; flagZero <= 1'b1; branch <= 1'b1;
		flagNeg <= 1'b0; opcode = 1'b1; @(posedge clk);
	
		$stop;
	end


endmodule
