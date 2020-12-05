`include "instrMem.v"
`include "pc.v"
`include "dataMem.v"
`include "alu.v"
`include "signExtender.v"
`include "aluControl.v"
`include "cu.v"
`include "registerFile.v"
`include "shifter.v"
module SCDataPath(ALU_output,PC,reset,clk);
	input [4:0] PC;
	input reset,clk;
	output [31:0] ALU_output;
	wire [4:0] pc_instr;
	wire [31:0] instr;
	wire RegDst,ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite,Branch,ALUOp0,ALUOp1;
	pc pc1(PC,pc_instr,reset,clk);
	instrucMem(pc_instr,reset,instr);
	ANDarray cntrlUnit(RegDst,ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite,Branch,ALUOp0,ALUOp1,instr[31:26]);
	//to be copmleted
endmodule