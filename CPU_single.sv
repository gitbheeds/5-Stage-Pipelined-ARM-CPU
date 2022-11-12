//top level module for single cycle CPU
//makes all interconnections between different
//processing blocks

module CPU_single();

	
	//instantiate all wires here
	
	//current PC value, next PC value
	logic[63:0] currPC, nextPC;
	
	//current instruction
	logic[31:0] instruction;
	
	//registers accessed in instructions
	logic[4:0] Rn, Rm, Rd;
	
	assign Rn = instruction[9:5];
	assign Rm = instruction[20:16];
	assign Rd = instruction[4:0];
	
	//control signals
	logic uncondBr, brTaken;
	logic regWrite;
	
	
	//program counter goes here
	//PC module
	programCounter pc (.currPC, .condAddr19(instruction[23:5]), .brAddr26(instruction[25:0]), .uncondBr, .brTaken, .nextPC);
	//CPU control unit
	
	//ALU control unit
	
	//regfile instantiation
	
	logic[63:0] rd1, rd2, wd;
	
	regfile (.ReadData1(rd1), .ReadData2(rd2), .WriteData(wd), 
					 .ReadRegister1(Rn), .ReadRegister2(Rm), .WriteRegister(Rd),
					 .RegWrite, .clk);
					 
	//ALU instantiation
	
	
	//LSR, LSL instruction support here
	
	
	




endmodule 