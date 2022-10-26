module fullAdder(a, b, cin, sum, cout);

	input logic a, b, cin;
	
	
	output logic sum, cout;
	
	
	wire int1, int2, int3;
	
	// int1 = a ^ b
	xor(int1, a, b);
	
	// int2 = a&b
	and(int2, a, b);
	
	// int3 = (a^b)&cin
	and(int3, int1, cin);
	
	// sum = (a^b)^cin
	xor(sum, int1, cin);
	
	// cout = (a&b) + (a^b)&cin
	or(cout, int2, int3);

endmodule

module fullAdder_testbench();


	logic a, b, cin, sum, cout;
	
	fullAdder dut(a, b, cin, sum, cout);
	
	initial begin
		
		a = 0; b = 0; cin = 0; #10;
		
		a = 1; b = 0; cin = 0; #10;
		
		a = 1; b = 1; cin = 0; #10;
		
		a = 0; b = 1; cin = 0; #10;
		
		a = 0; b = 0; cin = 1; #10;
		
		a = 1; b = 0; cin = 1; #10;
		
		a = 1; b = 1; cin = 1; #10;
		
		a = 0; b = 1; cin = 1; #10;
		
	end
	


endmodule

