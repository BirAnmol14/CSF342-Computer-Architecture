//ALU CONTROL
module aluControl(ALUOp1,ALUOp0,funct,operation);
	input ALUOp1,ALUOp0;
	input [5:0] funct;
	output [2:0] operation;
	wire w1;
	or o1(w1,funct[3],funct[0]);
	and a1(operation[0],ALUOp1,w1);
	and a2(w2,funct[1],ALUOp1);
	or o2(operation[2],ALUOp0,w2);
	nand n1(operation[1],ALUOp1,funct[2]);
endmodule