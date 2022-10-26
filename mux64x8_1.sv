//64 bit 8x1 mux
//used for ALU op selection
module mux64x8_1 (in, out, ctrl);

	//8 64 bit inputs
	input logic [7:0][63:0] in;
	
	//64 bit output
	output logic [63:0] out;
	
	//3 bit control line
	input logic [2:0] ctrl;
	
	//temp variable to flip input 
	logic [63:0][7:0] temp; 
	
	genvar k;
	
	int i, j;
	
	always_comb begin
		for (i = 0; i < 64; i++) begin
		
			for (j = 0; j < 8; j++) begin
				temp[i][j] = in[j][i];
			end
			
		end 	
	end

	
	generate 
	
		for(k = 0; k < 64; k++) begin : muxMaker
		
			mux8_1 midboi (.out(out[k]), .in(temp[k][7:0]), .sel(ctrl));
		
		end
	
	
	endgenerate 



endmodule 
