module ANDarray (RegDst,ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite,Branch,ALUOp0,ALUOp1,op);
input [5:0] op;
output RegDst,ALUSrc,MemtoReg, RegWrite, MemRead, MemWrite,Branch,ALUOp0,ALUOp1;
wire Rformat, lw,sw,beq;
assign Rformat= (~op[0])& (~op[1])& (~op[2])& (~op[3])& (~op[4])& (~op[5]);
assign lw= op[5]&(~op[4])&(~op[3])&(~op[2])&op[1]&op[0];
assign sw= op[5]&(~op[4])&(op[3])&(~op[2])&op[1]&op[0];
assign beq= (~op[5])&(~op[4])&(~op[3])&(op[2])&(~op[1])&(~op[0]);
assign RegDst=Rformat;
assign ALUSrc=lw|sw;
assign MemtoReg = lw;
assign RegWrite = Rformat|lw;
assign MemRead = lw;
assign MemWrite =sw;
assign Branch = beq;
assign ALUOp0 = Rformat;
assign ALUOp1 = beq;
endmodule