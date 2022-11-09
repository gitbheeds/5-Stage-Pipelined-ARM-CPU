

// creates a 64 bit input 32x1 mux from a 1 bit input 32x1 mux (bit slice)
// addr: 5 bit address of the register
// in: The 64 bit inputs from each of the 32 registers
// out: 64 bit output that represents the value stored at the selected register
module mux64x32_1(addr, in, out);
	//5bit addr line
	input logic [4:0] addr;
	
	//input, 32 64bit inputs
	input logic [31:0][63:0]in;
	
	
	//temp to hold jth bit of registers
	logic [63:0][31:0] temp;
	
	//64bit output 
	output logic [63:0] out; 
	
	genvar k;
	
	int i, j;
	
	// Stores to temp a flipped version of the input
	// input is 32 by 64, temp is 64 by 32
	// This is used so that we can feed the right 32 bit value to the input of the 32:1 mux module
	always_comb begin
		for (i = 0; i < 64; i++) begin
			for (j = 0; j < 32; j++) begin
				temp[i][j] = in[j][i];
			end
		end 	
	end
	
	generate
	
		// For loop that instantiates 64 instances of the 32:1 mux
		// 32 bit inputs from 64 indexes of temp are fed into the instantiations of the 32:1 mux
		for (k = 0; k < 64; k++) begin: bitLevel
		
			mux32_1 bigboi (addr, temp[k][31:0], out[k]);
		
		end
	endgenerate
	

endmodule 