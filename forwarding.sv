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
			
		//no dependencies, no forwarding
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
			if(MEM_WB_Rd == ID_EX_Rn)begin
				
				FWDA = 2'b01; //MEM/WB FWDING
				FWDB = 2'b00; //pass
			
			end
			
		//Confirm if target is used as Rm operand in next instruction (ID/EX)	
			else if(MEM_WB_Rd == ID_EX_Rm) begin
			
				FWDA = 2'b00; //pass
				FWDB = 2'b01; //MEM/WB FWDING
				
			end
			
		//no dependencies, no forwarding
			else begin
				
				FWDA = 2'b00; //pass
				FWDB = 2'b00; //pass
			
			end
			
		end	
	//no hazards, no forwarding
		else begin
			
			FWDA = 2'b00; //pass
			FWDB = 2'b00; //pass
		
		end
		
	end

endmodule 

module fwd_tb();

	//Rd saved in EX/MEM pipeline register
	logic [4:0] EX_MEM_Rd; 
	
	//is the register being written to?
	logic EX_MEM_regWrite, MEM_WB_regWrite;

	//Rd saved in MEM/WB pipeline register
	logic [4:0] MEM_WB_Rd;
	
	//operands for next instruction
	logic [4:0] ID_EX_Rn, ID_EX_Rm;
	
	//mux control signals for Rn (A), Rm (B)
	logic [1:0] FWDA, FWDB;
	
	forwarding dut (.*);
	
	initial begin
	
		EX_MEM_Rd = 5'd22;
		MEM_WB_Rd = 5'd16;
		EX_MEM_regWrite = 1'b1;
		MEM_WB_regWrite = 1'b1;
		ID_EX_Rn = 5'd0;
		ID_EX_Rm = 5'd3;
		
		
		$display("testing EX/MEM cases \n");
		$display("No FWDING");
		#10;
		$write("FWDA output = %2b \n", FWDA);
		$write("FWDB output = %2b \n", FWDB);
		
		ID_EX_Rn = 5'd22; 
		$display("EX/MEM FWD on A \n");
		#10; 
		$write("FWDA output = %2b \n", FWDA);
		$write("FWDB output = %2b \n", FWDB);
		
		ID_EX_Rn = 5'd21;
		ID_EX_Rm = 5'd22;
		$display("EX/MEM FWD on B \n");
		#10; 
		$write("FWDA output = %2b \n", FWDA);
		$write("FWDB output = %2b \n", FWDB);
		
		EX_MEM_regWrite = 1'b0;
		ID_EX_Rn = 5'd12;
		ID_EX_Rm = 5'd26;
		$display("disable write \n");
		#10; 
		$write("FWDA output = %2b \n", FWDA);
		$write("FWDB output = %2b \n", FWDB);
		
		EX_MEM_regWrite = 1'b1;
		EX_MEM_Rd = 5'd31;
		ID_EX_Rn = 5'd12;
		ID_EX_Rm = 5'd22;
		$display("Rd = X31 \n");
		#10; 
		$write("FWDA output = %2b \n", FWDA);
		$write("FWDB output = %2b \n", FWDB);
		
		
		$display("testing MEM/WB cases \n");
		MEM_WB_Rd = 5'd16;
		ID_EX_Rn = 5'd12;
		ID_EX_Rm = 5'd22;
		$display("No FWDING \n");
		#10; 
		$write("FWDA output = %2b \n", FWDA);
		$write("FWDB output = %2b \n", FWDB);
		
		ID_EX_Rn = 5'd16;
		ID_EX_Rm = 5'd22;
		$display("MEM/WB FWD on A \n");
		#10; 
		$write("FWDA output = %2b \n", FWDA);
		$write("FWDB output = %2b \n", FWDB);
		
		ID_EX_Rn = 5'd25;
		ID_EX_Rm = 5'd16;
		$display("EX/MEM FWD on B \n");
		#10; 
		$write("FWDA output = %2b \n", FWDA);
		$write("FWDB output = %2b \n", FWDB);
		
		MEM_WB_Rd = 5'd31; 
		$display("Rd = X31 \n");
		#10; 
		$write("FWDA output = %2b \n", FWDA);
		$write("FWDB output = %2b \n", FWDB);
		
		MEM_WB_regWrite = 1'b0;
		$display("disable write \n");
		#10; 
		$write("FWDA output = %2b \n", FWDA);
		$write("FWDB output = %2b \n", FWDB);
	
	
	end
	
endmodule 