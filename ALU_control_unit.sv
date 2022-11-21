module ALU_control_unit (opcode, ALU_on, ALU_cntrl);

	input logic [10:0] opcode;
	
	input logic ALU_on;
	
	output logic [2:0] ALU_cntrl;
	
	//D-type insts 11b
	logic[10:0] dOp;
	assign dOp = opcode;
	
	//R-type insts 11b
	logic[10:0] rOp;
	assign rOp = opcode;
	
	//CB-type insts 8b
	logic [7:0] cbOp;
	assign cbOp = opcode[10:3];
	
	//I-type insts 10b
	logic[9:0] iOp;
	assign iOp = opcode[10:1];
	
	
	always_comb begin
	
		//check if ALU is needed
		if(!ALU_on) begin
			
			//ALU not necessary
			ALU_cntrl = 3'bX;
		
		end
		
		//ALU required
		else begin
			
			//ADDI + ADDS
			if(iOp == 10'b1001000100 || rOp == 11'b10101011000) begin
				
				ALU_cntrl = 3'b010;
			
			end
			
		
			//STUR + LDUR
			else if(dOp == 11'b11111000000 || dOp == 11'b11111000010) begin
			
				ALU_cntrl = 3'b010;
			
			end
			
			//SUBS
			else if(rOp == 11'b11101011000) begin
			
				ALU_cntrl = 3'b011;
			
			end
			
			//BL
			else if (opcode[10:5] == 6'b100101)begin
				
				ALU_cntrl = 3'b000;
				
			end
			
			//CBZ
			else if (cbOp == 8'b10110100) begin
			
				ALU_cntrl = 3'b000;
			
			end
			
			//B.LT
			else if (cbOp == 8'b01010100) begin
				
				ALU_cntrl = 3'b000;
				
			end
			
			//unsupported inputs
			else ALU_cntrl = 3'bX;
		
		end
	
	
	
	end
	

endmodule 


module alu_control_unit_tb();

	logic[10:0] opcode;
	
	logic ALU_on;
	
	logic [2:0] ALU_cntrl;
	
	ALU_control_unit dut(.*);
	
	initial begin
		
		//ALU required
		ALU_on = 1'b1; #10;
		
		// unconditional branch test (unsupported)
		opcode = 11'b00010111001; #10;
		
		// conditional branch test (unsupported)
		opcode = 11'b01010100110; #10;
		
		// branch with link test
		opcode = 11'b10010111001; #10;
		
		// branch to register test (unsupported)
		opcode = 11'b11010110000; #10;
		
		// CBZ test
		opcode = 11'b10110100011; #10;
		
		// ADDI test
		opcode = 11'b10010001000; #10;
	
		// ADDS (ADD, set flags) test
		opcode = 11'b10101011000; #10;
		
		//ALU not needed
		ALU_on = 1'b0;
		
	//----no output----//
		// LDUR test
		opcode = 11'b11111000010; #10;
		
		// STUR test
		opcode = 11'b11111000000; #10;
		
	//----outputs accepted----//
	
		ALU_on = 1'b1;
		
		// LDUR test
		opcode = 11'b11111000010; #10;
		
		// STUR test
		opcode = 11'b11111000000; #10; 
		
		// SUBS (SUB, set flags) test
		opcode = 11'b11101011000; #10;
		
		
		// else case test, should be all X's
		opcode = 11'b11111111111; #10;
	
	end

endmodule 