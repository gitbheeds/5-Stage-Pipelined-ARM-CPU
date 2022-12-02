//FWDA, FWDB codes
//00: no forwarding
//01: MEM/WB forwarding
//10: EX/MEM forwarding
//11: unused 

module forwarding (fwdEn_EX, RegWrite_MEM, RegWrite_WB, targetReg_MEM, targetReg_WB, 
						 Rn_EX, Rm_EX, FWDA, FWDB);
					 
	//enable fwding
	//10: i-type insts (no need to check Rm)
	//11: r-type inst (need to check Rn and Rm)
	input logic[1:0] fwdEn_EX;
	
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
		// we are going to forward
		if(fwdEn_EX[1] == 1'b1) begin
			//first check if MEM/WB fwding is true
			if((RegWrite_WB) && (targetReg_WB != 5'd31) && (targetReg_WB == Rn_EX)) begin
				//determine if MEM/WB fwding needs to be disabled
				if ((RegWrite_MEM) && (targetReg_MEM != 5'd31) && (targetReg_MEM == Rn_EX)) begin
					FWDA = 2'b10; // EX/MEM FWDA
				end
				//MEM/WB required
				else begin
					FWDA = 2'b01; // MEM/WB FWDA
				end
			end
			//if MEM/WB fwding is not required, check for EX/MEM fwding
			else begin
				
				if ((RegWrite_MEM) && (targetReg_MEM != 5'd31) && (targetReg_MEM == Rn_EX)) begin
					FWDA = 2'b10; // EX/MEM FWDA
				end
				
				else FWDA = 2'b00; // PASS
			end
			
			//check hazards at Rm only for
			//R-type insts
			if(fwdEn_EX[0] == 1'b1) begin 
				
				//first check if MEM/WB fwding is needed
				if((RegWrite_WB) && (targetReg_WB != 5'd31) && (targetReg_WB == Rm_EX)) begin
					//determine if MEM/WB needs to be disabled
					if((RegWrite_MEM) && (targetReg_MEM != 5'd31) && (targetReg_MEM == Rm_EX)) begin
						FWDB = 2'b10; //EX/MEM FWDB
					end
					//MEM/WB required
					else begin
						FWDB = 2'b01; //MEM/WB FWDB
					end
				end
				//if MEM/WB fwding is not required, check for EX/MEM fwding
				else begin
					if((RegWrite_MEM) && (targetReg_MEM != 5'd31) && (targetReg_MEM == Rm_EX)) begin
						FWDB = 2'b10; //EX/MEM FWDB
					end
					else FWDB = 2'b00; //PASS
				end		
			end
			else begin
				FWDB = 2'b00; //pass for I type insts
			end
		
		end
		//if fwdEn is disabled, fwding unit is not needed
		else begin
		
			FWDA = 2'b00;
			FWDB = 2'b00;
		
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
	
	logic [1:0] fwdEn_EX;
	
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