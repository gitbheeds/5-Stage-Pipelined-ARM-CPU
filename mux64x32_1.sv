

//creates a 64 bit input 32x1 mux from a 1 bit input 32x1 mux (bit slice)
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
	
	always_comb begin
		for (i = 0; i < 64; i++) begin
			for (j = 0; j < 32; j++) begin
				temp[i][j] = in[j][i];
			end
		end 	
	end
	
	generate
	
		
		for (k = 0; k < 64; k++) begin: bitLevel
		
			mux32_1 bigboi (addr, temp[k][31:0], out[k]);
		
		end
	endgenerate
	

endmodule 