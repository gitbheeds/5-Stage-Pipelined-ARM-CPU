`timescale 1ps/1ps

//zero flag detection
//uses nor and and gates to determine if the
//output is zero
//output takes 150ps to calculate
module zeroCheck (check, z_flag);

	//64-bit value to check
	input logic [63:0] check;
	
	//output of first stage nor gates
	logic [15:0] norOut;

	//output of second stage and gates
	logic [3:0] andOut;
	
	//final output: zero flag
	output logic z_flag;

	genvar i, j;
	
	generate
	
		for(i = 0; i < 64; i = i + 4) begin : norGen
		
			nor #(50) stage1 (norOut[i/4], check[i], check[i+1], check[i+2], check[i+3]);
		
		end
		
		for(j = 0; j < 16; j = j + 4) begin : andGen
		
			and #(50) stage2 (andOut[j/4], norOut[j], norOut[j+1], norOut[j+2], norOut[j+3]);
		
		end
		
		//final output
			and #(50) zeroOut (z_flag, andOut[0], andOut[1], andOut[2], andOut[3]);
	
	endgenerate
	
endmodule 


module zeroCheck_tb();

	logic [63:0] check;
	
	logic z_flag;
	
	zeroCheck dut (.*);
	
	initial begin
	
		check = $random(); #200;
		
		check = $random(); #200;
		
		check = 64'b0; #200;
	
	
	end


endmodule 
