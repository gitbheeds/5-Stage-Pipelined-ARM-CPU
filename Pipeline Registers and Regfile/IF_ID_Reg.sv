// IF/ID pipeline register
// Essentially 96 bits, since it takes in a 32 bit instruction signal and a 64 bit pc_plus4 value
`timescale 1ps/1ps
module IF_ID_Reg(clk, IF_ID_flush, instruction, currPC, pc_plus4, opcode, Rn, Rm, Rd, shamt, 
					  dAddr9, ALU_Imm, condAddr19, brAddr26, currPC_out, pc_plus4_out);
	input logic clk, IF_ID_flush; // 2 bits
	input logic [31:0] instruction; // 32 bits
	input logic [63:0] currPC; // 64 bits
	input logic [63:0] pc_plus4;
	output logic [10:0] opcode;
	output logic [4:0] Rn, Rm, Rd;
	output logic [5:0] shamt;
	output logic [8:0] dAddr9;
	output logic [11:0] ALU_Imm;
	output logic [18:0] condAddr19;
	output logic [25:0] brAddr26;
	output logic [63:0] currPC_out;
	output logic [63:0] pc_plus4_out;
	
	logic [159:0] registerIn, registerOut;
	
	assign registerIn [31:0] = instruction;
	assign registerIn [95:32] = currPC;
	assign registerIn [159:96] = pc_plus4;
	
	// uses an ~clk signal to ensure reading from pipeline register on the negative edge of the main clock
	logic not_clk;
	not #(50) (not_clk, clk);
	
	genvar i;
	generate
		for(i = 0; i < 160; i++) begin : IF_ID
			D_FF dffs (.clk(not_clk), .reset(1'b0), .d(registerIn[i]), .q(registerOut[i]));
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
	
	assign currPC_out = registerOut[95:32];
	
	assign pc_plus4_out = registerOut[159:96];


endmodule

`timescale 1ps/1ps
module IF_ID_Reg_tb();
	
	// inputs
	logic clk, IF_ID_flush;
	logic [31:0] instruction;
	logic [63:0] currPC;
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
	logic [63:0] currPC_out;
	logic [63:0] pc_plus4_out;
	
	parameter CLOCK_PERIOD = 1000;
	initial begin
		clk <= 0;
		// Forever toggle the clock
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	IF_ID_Reg dut(.clk, .IF_ID_flush, .instruction, .currPC, .pc_plus4, .opcode, 
					  .Rn, .Rm, .Rd, .shamt, .dAddr9, .ALU_Imm, 
					  .condAddr19, .brAddr26, .currPC_out, .pc_plus4_out);
					  
	initial begin
	
		
		// LDUR X7, [X4,#5]
		IF_ID_flush <= 0; instruction <= 32'b11111000010000000101000010000111; currPC <= 64'd200; 
		pc_plus4 <= 64'd204; @(posedge clk);
		
		// LDUR X6, [X2, #5]
		IF_ID_flush <= 0; instruction <= 32'b11111000010000000101000001000110; currPC <= 64'd204;
		pc_plus4 <= 64'd208; @(posedge clk);
		
		IF_ID_flush <= 1; @(posedge clk);
		repeat(1) @(posedge clk);
		$stop;
	end

endmodule

