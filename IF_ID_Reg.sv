// IF/ID pipeline register
// Essentially 96 bits, since it takes in a 32 bit instruction signal and a 64 bit pc_plus4 value
`timescale 1ps/1ps
module IF_ID_Reg(clk, IF_ID_flush, instruction, pc_plus4, opcode, Rn, Rm, Rd, shamt, dAddr9, ALU_Imm, condAddr19, brAddr26, pc_plus4_out);
	input logic clk, IF_ID_flush; // 2 bits
	input logic [31:0] instruction; // 32 bits
	input logic [63:0] pc_plus4; // 64 bits
	output logic [10:0] opcode;
	output logic [4:0] Rn, Rm, Rd;
	output logic [5:0] shamt;
	output logic [8:0] dAddr9;
	output logic [11:0] ALU_Imm;
	output logic [18:0] condAddr19;
	output logic [25:0] brAddr26;
	output logic [63:0] pc_plus4_out;
	
	logic [95:0] registerIn, registerOut;
	
	assign registerIn [31:0] = instruction;
	assign registerIn [95:32] = pc_plus4;
	
	genvar i;
	generate
		for(i = 0; i < 96; i++) begin : IF_ID
			D_FF dffs (.clk, .reset(IF_ID_flush), .d(registerIn[i]), .q(registerOut[i]));
		end
	endgenerate
	
	assign opcode = registerOut[31:21];
	assign Rn = registerOut[9:5];
	assign Rm = registerOut[20:16];
	assign Rd = registerOut[4:0];
	
	assign shamt = registerOut[15:10];
	
	assign dAddr9 = registerOut[20:12];
	
	assign ALU_Imm = registerOut[21:10];
	
	assign condAddr19 = registerOut[23:5];
	
	assign brAddr26 = registerOut[25:0];
	
	assign pc_plus4_out = registerOut[95:32];


endmodule

`timescale 1ps/1ps
module IF_ID_Reg_tb();
	
	// inputs
	logic clk, IF_ID_flush;
	logic [31:0] instruction;
	logic [63:0] pc_plus4;
	
	// outputs
	logic [10:0] opcode;
	logic [4:0] Rn; 
	logic [4:0] Rm; 
	logic [4:0] Rd; 
	logic [5:0] shamt; 
	logic [8:0] dAddr9; 
	logic [11:0] ALU_Imm;
	logic [18:0] condAddr19;
	logic [25:0] brAddr26;
	logic [63:0] pc_plus4_out;
	
	parameter CLOCK_PERIOD = 1000;
	initial begin
		clk <= 0;
		// Forever toggle the clock
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	IF_ID_Reg dut(.clk, .IF_ID_flush, .instruction, .pc_plus4, .opcode, 
					  .Rn, .Rm, .Rd, .shamt, .dAddr9, .ALU_Imm, 
					  .condAddr19, .brAddr26, .pc_plus4_out);
					  
	initial begin
	
		
		// LDUR X7, [X4,#5]
		IF_ID_flush <= 0; instruction <= 32'b11111000010000000101000010000111; pc_plus4 <= 64'd200; @(posedge clk);
		repeat(1) @(posedge clk);
		
		IF_ID_flush <= 1; @(posedge clk);
		repeat(1) @(posedge clk);
		$stop;
	end

endmodule

