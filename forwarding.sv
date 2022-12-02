//FWDA, FWDB codes
//00: no forwarding
//01: MEM/WB forwarding
//10: EX/MEM forwarding
//11: unused 

module forwarding (fwdEN, RegWrite_MEM, RegWrite_WB, targetReg_MEM, targetReg_WB, 
						 Rn_EX, Rm_EX, FWDA, FWDB);
					 
	//enable fwding
	input logic fwdEN;
	
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
	
		//EX hazard case 1
		if((RegWrite_MEM) && (targetReg_MEM != 5'd31) && (targetReg_MEM == Rn_EX)) FWDA = 2'b10; //EX FWDING on Rn
		
		else FWDA = 2'b00; //pass
		
		//EX hazard case 2
		if((RegWrite_MEM) && (targetReg_MEM != 5'd31) && (targetReg_MEM == Rm_EX)) FWDB = 2'b10; //EX FWDING on Rn
		
		else FWDB = 2'b00; //pass
		
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