`include "cu.v"
module testbench;
	reg [5:0] opcode;
	integer i;
	wire RegDst,ALUSrc,MemtoReg, RegWrite, MemRead, MemWrite,Branch,ALUOp0,ALUOp1;
	ANDarray pla(RegDst,ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite,Branch,ALUOp0,ALUOp1,opcode);
	initial begin
	$dumpfile("cu.vcd"); $dumpvars;
	for( i = 0; i <= 63; i = i + 1)
	begin
	#100 opcode = i;
	$monitor("opcode = %b ",opcode,"RegDst = %b ",RegDst,"ALUSrc = %b ",ALUSrc,"MemtoReg = %b ",MemtoReg,"RegWrite = %b " ,RegWrite,"MemRead = %b " ,MemRead, "MemWrite = %b ",MemWrite,"Branch = %b ",Branch,"ALUOp0 = %b ",ALUOp0,"ALUOp1 = %b ",ALUOp1);
	end
	end
endmodule