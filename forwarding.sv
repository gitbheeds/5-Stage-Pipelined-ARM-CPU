//FWDA, FWDB codes
//00: no forwarding
//01: MEM/WB forwarding
//10: EX/MEM forwarding
//11: unused 

module forwarding (RegWrite_MEM, RegWrite_WB, targetReg_MEM, targetReg_WB, 
						 Rn_EX, Rm_EX, FWDA, FWDB);

	//Rd saved in EX/MEM pipeline register
	input logic [4:0] targetReg_MEM; 
	
	//is the register being written to?
	input logic RegWrite_MEM, RegWrite_WB;

	//Rd saved in MEM/WB pipeline register
	input logic [4:0] targetReg_WB;
	
	//operands for next instruction
	input logic [4:0] Rn_EX, Rm_EX;
	
	//mux control signals for Rn (A), Rm (B)
	output logic [1:0] FWDA, FWDB;
	
	
	always_comb begin
	
	//EX HAZARDS
		//Confirm that the inst is writing
		//Confirm that target reg is not X31(cannot write to X31)
		if((RegWrite_MEM) & (targetReg_MEM != 31)) begin
		
		//Confirm if target is used as Rn operand in next instruction (ID/EX)
			if(targetReg_MEM == Rn_EX)begin
				
				FWDA = 2'b10; //EX/MEM FWDING
				FWDB = 2'b00; //pass
			
			end
			
		//Confirm if target is used as Rm operand in next instruction (ID/EX)	
			else if(targetReg_MEM == Rn_EX) begin
			
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
		else if((RegWrite_WB) & (targetReg_WB!= 31)) begin
		
		//Confirm if target is used as Rn operand in next instruction (ID/EX)
			if(targetReg_WB == Rn_EX)begin
				
				FWDA = 2'b01; //MEM/WB FWDING
				FWDB = 2'b00; //pass
			
			end
			
		//Confirm if target is used as Rm operand in next instruction (ID/EX)	
			else if(targetReg_WB == Rm_EX) begin
			
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
	logic [4:0] targetReg_MEM; 
	
	//is the register being written to?
	logic RegWrite_MEM, RegWrite_WB;

	//Rd saved in MEM/WB pipeline register
	logic [4:0] targetReg_WB;
	
	//operands for next instruction
	logic [4:0] Rn_EX, Rm_EX;
	
	//mux control signals for Rn (A), Rm (B)
	logic [1:0] FWDA, FWDB;
	
	forwarding dut (.*);
	
	initial begin
	
		targetReg_MEM = 5'd22;
		targetReg_WB = 5'd16;
		RegWrite_MEM = 1'b1;
		RegWrite_WB = 1'b1;
		Rn_EX = 5'd0;
		Rm_EX = 5'd3;
		
		
		$display("testing EX/MEM cases \n");
		$display("No FWDING");
		#10;
		$write("FWDA output = %2b \n", FWDA);
		$write("FWDB output = %2b \n", FWDB);
		
		Rn_EX = 5'd22; 
		$display("EX/MEM FWD on A \n");
		#10; 
		$write("FWDA output = %2b \n", FWDA);
		$write("FWDB output = %2b \n", FWDB);
		
		Rn_EX = 5'd21;
		Rm_EX = 5'd22;
		$display("EX/MEM FWD on B \n");
		#10; 
		$write("FWDA output = %2b \n", FWDA);
		$write("FWDB output = %2b \n", FWDB);
		
		RegWrite_MEM = 1'b0;
		Rn_EX = 5'd12;
		Rm_EX = 5'd26;
		$display("disable write \n");
		#10; 
		$write("FWDA output = %2b \n", FWDA);
		$write("FWDB output = %2b \n", FWDB);
		
		RegWrite_MEM = 1'b1;
		targetReg_MEM = 5'd31;
		Rn_EX = 5'd12;
		Rm_EX = 5'd22;
		$display("Rd = X31 \n");
		#10; 
		$write("FWDA output = %2b \n", FWDA);
		$write("FWDB output = %2b \n", FWDB);
		
		
		$display("testing MEM/WB cases \n");
		targetReg_WB = 5'd16;
		Rn_EX = 5'd12;
		Rm_EX = 5'd22;
		$display("No FWDING \n");
		#10; 
		$write("FWDA output = %2b \n", FWDA);
		$write("FWDB output = %2b \n", FWDB);
		
		Rn_EX = 5'd16;
		Rm_EX = 5'd22;
		$display("MEM/WB FWD on A \n");
		#10; 
		$write("FWDA output = %2b \n", FWDA);
		$write("FWDB output = %2b \n", FWDB);
		
		Rn_EX = 5'd25;
		Rm_EX = 5'd16;
		$display("EX/MEM FWD on B \n");
		#10; 
		$write("FWDA output = %2b \n", FWDA);
		$write("FWDB output = %2b \n", FWDB);
		
		targetReg_WB = 5'd31; 
		$display("Rd = X31 \n");
		#10; 
		$write("FWDA output = %2b \n", FWDA);
		$write("FWDB output = %2b \n", FWDB);
		
		RegWrite_WB = 1'b0;
		$display("disable write \n");
		#10; 
		$write("FWDA output = %2b \n", FWDA);
		$write("FWDB output = %2b \n", FWDB);
	
	
	end
	
endmodule 