module instrucMem(pc,rst,instr);
	input[4:0] pc;//5 bits
	input rst;
	output[31:0] instr;
	reg[31:0] mem[31:0];//array of size 32(pow(2,5)) with mem[i] being 32 bits
	always@(pc)
	instr<=mem[pc];
	always@(rst) 
		begin
		if(rst) 
			begin
			mem[0]<=32'h00000200;
			mem[1]<=32'h00000201;
			mem[2]<=32'h00000204;
			mem[3]<=32'h00000108;
			end
		end
endmodule
