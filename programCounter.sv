`timescale 1ps/1ps


module programCounter(currPC, condAddr19, brAddr26, uncondBr, brTaken, nextPC, sub_control);

	input logic uncondBr, brTaken, sub_control;
	
	input logic [18:0] condAddr19;
	
	input logic [25:0] brAddr26;
	
	logic [63:0] condAddr64;
	
	logic [63:0] brAddr64;
	
	wire [63:0] branchSE, shiftedBranch;
	
	parameter condAddrSize = 19;
	parameter brAddrSize = 26;

	sign_extender #(condAddrSize) condBranch(condAddr19, condAddr64);
	
	sign_extender #(brAddrSize) uncondBranch(brAddr26, brAddr64);
	

	
	mux64x2_1 branchType(uncondBr, condAddr64, brAddr64, branchSE);
	
	
	shifter leftShift2(.value(branchSE), .direction(1'b0), .distance(6'd2), .result(shiftedBranch));
	
	
	wire [63:0] currentOut, nextOut, int1, int2;
	
	logic of_flag, co_flag;
	
	adder_4_pc add4(currentOut, int1);
	
	adder64_bit branchAdd(currentOut, shiftedBranch, sub_control, int2, of_flag, co_flag);
	
	
	mux64x2_1 selPCNext(brTaken, int1, int2, nextOut);
	
	input logic [63:0] currPC;
	
	assign currentOut = currPC;
	
	output logic [63:0] nextPC;
	
	assign nextPC = nextOut;

	
endmodule


module programCounter_tb();

	logic [63:0] currPC, nextPC;
	
	logic [18:0] condAddr19;
	
	logic [25:0] brAddr26;
	
	logic uncondBr, brTaken, sub_control;
	
	programCounter dut(currPC, condAddr19, brAddr26, uncondBr, brTaken, nextPC, sub_control);
	
	initial begin
	
		currPC = 64'h00000000000000FF; condAddr19 = 19'b0; brAddr26 = 26'b0; uncondBr = 1'b1; brTaken = 1'b0; 
		sub_control = 1'b0; #800;
		
		currPC = 64'h000000000000000F; condAddr19 = 19'd30; brAddr26 = 26'b0; uncondBr = 1'b0; brTaken = 1'b1; 
		sub_control = 1'b0; #800;
		
		currPC = 64'h0000000000000000; condAddr19 = 19'd30; brAddr26 = 26'd2; uncondBr = 1'b1; brTaken = 1'b1;
	   sub_control = 1'b0; #800;
		
		currPC = 64'd200; condAddr19 = -1; brAddr26 = -5; uncondBr = 1'b0; brTaken = 1'b1; 
		sub_control = 1'b1; #6500;
	
	end


endmodule
