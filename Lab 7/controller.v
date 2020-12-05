`include "controlLogic.v"
`include "stateReg.v"
module multicycleController(clk,opcode,PCWrite,PCWriteCond,IorD,MemRead,MemWrite,IRWrite,MemtoReg,PCSrc,AluOp,AluSrcA,AluSrcB,RegWrite,RegDst);
	input [5:0] opcode;
	input clk;
	output PCWrite,PCWriteCond,IorD,MemRead,MemWrite,IRWrite,MemtoReg,AluSrcA,RegWrite,RegDst;
	output [1:0] PCSrc,AluOp,AluSrcB;
	wire [3:0] curr,next;
	reg4Bit r1(next,clk,curr);
	controlLogic cl(opcode,curr,PCWrite,PCWriteCond,IorD,MemRead,MemWrite,IRWrite,MemtoReg,PCSrc,AluOp,AluSrcA,AluSrcB,RegWrite,RegDst,next);
endmodule

module tb_control;
	reg [5:0] opcode;
	reg clk;
	wire PCWrite,PCWriteCond,IorD,MemRead,MemWrite,IRWrite,MemtoReg,AluSrcA,RegWrite,RegDst;
	wire [1:0] PCSrc,AluOp,AluSrcB;
	multicycleController mcc(clk,opcode,PCWrite,PCWriteCond,IorD,MemRead,MemWrite,IRWrite,MemtoReg,PCSrc,AluOp,AluSrcA,AluSrcB,RegWrite,RegDst);
	always@(clk)
	begin
		#10 clk<=~clk;
	end
	initial 
	begin
		clk=1'b1;opcode=6'b100011;//lw
		$dumpfile("controller.vcd");$dumpvars();
		$monitor("opcode=%b, PCWrite=%b, PCWriteCond=%b, IorD=%b, MemRead=%b, MemWrite=%b, IRWrite=%b, MemtoReg=%b, PCSrc=%b, AluOp=%b, AluSrcA=%b, AluSrcB=%b, RegWrite=%b, RegDst=%b",opcode,PCWrite,PCWriteCond,IorD,MemRead,MemWrite,IRWrite,MemtoReg,PCSrc,AluOp,AluSrcA,AluSrcB,RegWrite,RegDst);
		#200 $finish;
	end
endmodule