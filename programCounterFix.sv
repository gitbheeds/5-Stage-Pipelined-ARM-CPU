//updated PC module
//only contains PC + 4
//and a mux to select between 
//PC + 4 and PC + Branch

module programCounterFix(clk, rst, currPC, calcBranch, pc_plus4, PCSrc);

	//clocking and resets
	input logic clk, rst;

	//mux control signal
	input logic PCSrc;
	
	//calculated branch address from branchCalc module
	input logic [63:0] calcBranch;
	
	//output current PC and PC + 4(for use with BL inst)
	output logic [63:0] currPC, pc_plus4;
	
	//internal next PC
	logic [63:0] nextPC;
	
	//internal adder output
	logic [63:0] addOut;
	
	//internal current 
	logic [63:0] curr;

	//store current output to calculate next output
	assign curr = currPC;
	
	//calculate next PC + 4 based on current output
	adder_4_pc adding(.in(curr), .out(addOut));
	
	//pass PC + 4 out of the module for BL
	assign pc_plus4 = addOut;
	
	//next PC is PC + 4 or PC + Branch
	mux64x2_1 PCSel(.sel(PCSrc), .i0(addOut), .i1(calcBranch), .out(nextPC));
	
	// generate block to handle DFFs that update nextPC
	genvar i;
	generate
	
		for (i = 0; i < 64; i++) begin : reginald
			D_FF duffy(.q(currPC[i]), .d(nextPC[i]), .reset(rst), .clk(clk));
		
		end
	
	endgenerate
	
endmodule 

`timescale 1ps/1ps
module PCF_tb();

	//clocking and resets
	logic clk, rst;

	//mux control signal
	logic PCSrc;
	
	//calculated branch address from branchCalc module
	logic [63:0] calcBranch;
	
	//output current PC and PC + 4(for use with BL inst)
	logic [63:0] currPC, pc_plus4;

	programCounterFix dut(.*);
	
	parameter CLOCK_PERIOD = 8000;
	initial begin
		clk <= 0;
		// Forever toggle the clock
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
		
		
		PCSrc <= 0;
		calcBranch <= 300;
		rst <= 1; @(posedge clk);
		rst <= 0; @(posedge clk);
		
		repeat(40) @(posedge clk);
		
		PCSrc <= 1; @(posedge clk);
		PCSrc <= 0; @(posedge clk);
		
		repeat(10) @(posedge clk);
		
	
	$stop;
	end

endmodule 