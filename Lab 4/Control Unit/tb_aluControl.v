`include "cu.v"
`include "aluControl.v"
module testbench;
	reg [5:0] opcode,funct;
	integer i,j;
	wire RegDst,ALUSrc,MemtoReg, RegWrite, MemRead, MemWrite,Branch,ALUOp0,ALUOp1;
	wire [2:0] operation;
	ANDarray pla(RegDst,ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite,Branch,ALUOp0,ALUOp1,opcode);
	aluControl aluc(ALUOp1,ALUOp0,funct,operation);
	initial begin
	$dumpfile("ALUcu.vcd"); $dumpvars;
	for( i = 0; i <= 63; i = i + 1)
	begin
	#100 opcode = i;
		for( j = 0; j <= 63; j = j + 1)
		begin
		#100 funct = j;
		$monitor("opcode = %b ",opcode,"funct = %b ",funct,"opeartion = %b ",operation,"ALUOp0 = %b ",ALUOp0,"ALUOp1 = %b ",ALUOp1);
		end
	end
	end
endmodule