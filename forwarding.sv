//FWDA, FWDB codes
//00: no forwarding
//01: MEM/WB forwarding
//10: EX/MEM forwarding
//11: unused 

module forwarding (EX_MEM_regWrite, MEM_WB_regWrite, EX_MEM_Rd, MEM_WB_Rd, 
						 ID_EX_Rn, ID_EX_Rm, FWDA, FWDB);

	//Rd saved in EX/MEM pipeline register
	input logic [4:0] EX_MEM_Rd; 
	
	//is the register being written to?
	input logic EX_MEM_regWrite, MEM_WB_regWrite;

	//Rd saved in MEM/WB pipeline register
	input logic [4:0] MEM_WB_Rd;
	
	//operands for next instruction
	input logic [4:0] ID_EX_Rn, ID_EX_Rm;
	
	//mux control signals for Rn (A), Rm (B)
	output logic [1:0] FWDA, FWDB;
	
	
	always_comb begin
	
	//EX HAZARDS
		//Confirm that the inst is writing
		//Confirm that target reg is not X31(cannot write to X31)
		if((EX_MEM_regWrite) & (EX_MEM_Rd != 31)) begin
		
		//Confirm if target is used as Rn operand in next instruction (ID/EX)
			if(EX_MEM_Rd == ID_EX_Rn)begin
				
				FWDA = 2'b10; //EX/MEM FWDING
				FWDB = 2'b00; //pass
			
			end
			
		//Confirm if target is used as Rm operand in next instruction (ID/EX)	
			else if(EX_MEM_Rd == ID_EX_Rm) begin
			
				FWDA = 2'b00; //pass
				FWDB = 2'b10; //EX/MEM FWDING
				
			end
			
		//No dependencies, no forwarding
			else begin
				
				FWDA = 2'b00; //pass
				FWDB = 2'b00; //pass
			
			end
		end
	//MEM HAZARDS
		//Confirm that the inst is writing
		//Confirm that target reg is not X31(cannot write to X31)
		else if((MEM_WB_regWrite) & (MEM_WB_Rd != 31)) begin
		
		//Confirm if target is used as Rn operand in next instruction (ID/EX)
			if(EX_MEM_Rd == ID_EX_Rn)begin
				
				FWDA = 2'b01; //MEM/WB FWDING
				FWDB = 2'b00; //pass
			
			end
			
		//Confirm if target is used as Rm operand in next instruction (ID/EX)	
			else if(EX_MEM_Rd == ID_EX_Rm) begin
			
				FWDA = 2'b00; //pass
				FWDB = 2'b01; //MEM/WB FWDING
				
			end
			
		//No dependencies, no forwarding
			else begin
				
				FWDA = 2'b00; //pass
				FWDB = 2'b00; //pass
			
			end
			
		end	
	//No hazards, no forwarding
		else begin
			
			FWDA = 2'b00; //pass
			FWDB = 2'b00; //pass
		
		end
		
	end

endmodule 