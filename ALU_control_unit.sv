module ALU_control_Unit (opcode, ALU_on, ALU_cntrl);

	input logic [10:0] opcode;
	
	input logic ALU_on;
	
	output logic [3:0] ALU_cntrl;
	
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
			else if (opcode[10:5] == 100101)begin
				
				ALU_cntrl = 3'b000;
				
			end
			
			//CBZ
			else if (cbOp == 8'b10110100) begin
			
				ALU_cntrl = 3'b100;
			
			end
			
			//unsupported inputs
			else ALU_cntrl = 3'bX;
		
		end
	
	
	
	end
	

endmodule 