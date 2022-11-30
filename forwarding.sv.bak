module forwarding (EX_MEM_Rd, MEM_WB_Rd, ID_EX_Rn, ID_EX_Rm, EX_MEM_FWD, MEM_WB_FWD);

	//Rd saved in EX/MEM pipeline register
	input logic [4:0] EX_MEM_Rd; 

	//Rd saved in MEM/WB pipeline register
	input logic [4:0] MEM_WB_Rd;
	
	//operands for next instruction
	input logic [4:0] ID_EX_Rn, ID_EX_Rm;
	
	//mux control signals 
	output logic EX_MEM_FWD, MEM_WB_FWD;

endmodule 