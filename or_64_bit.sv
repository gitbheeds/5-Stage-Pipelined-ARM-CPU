`timescale 1ps/1ps
// 64 bit OR
// Takes in two 64 bit inputs A and B and does bitwise OR for a 64 bit
// output
module or_64_bit(A, B, out);

	//64 bit inputs
	input logic [63:0] A, B;
	
	//64 bit result output
	output logic [63:0] out;

	genvar i;

	generate 
	    
	    for(i = 0; i < 64; i++) begin : theBigAnd
            or #(50) (out[i], A[i], B[i]);
        end	    
	endgenerate
	

endmodule

module and_64_bit_testbench();
    
    logic [63:0] A, B, out;
    
    or_64_bit dut(A, B, out);
    
    initial begin
        A = 64'b1; B = 64'b0; #60;
        
        A = 64'b1; B = 64'b1; #60;
        
        A = 64'b0; B = 64'b1; #60;
        
        A = 64'b0; B = 64'b0; #60;
        
        A= $random(); B = $random(); #60
        
    end

endmodule
