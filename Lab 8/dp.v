`include "encoder.v"
`include "evenParity.v"
`include "alu.v"
`include "reg.v"
module dataPath(encode,a,b,clk,result);
	input [7:0] encode;
	input [3:0] a,b;
	input clk;
	output result;
	wire [2:0]cntrl;
	wire [3:0]alu_res;
	wire [10:0] res,res1;
	encoder e1(encode,cntrl);
	pipelineReg r1(cntrl,a,b,clk,res);
	alu a1(res[7:4],res[3:0],res[10:8],alu_res);
	pipelineReg r2(3'b000,4'b0000,alu_res,clk,res1);
	parityGen pg1(res1[3:0],result);
endmodule
module tb_dp;
	reg [7:0] encode;
	reg [3:0] a,b;
	reg clk;
	wire result;
	dataPath dp1(encode,a,b,clk,result);
	always@(clk)
	begin
		#5 clk<=~clk;
	end
	initial
	begin
		clk=1'b1;a=4'b0010;b=4'b0001;
		$dumpfile("dp.vcd");$dumpvars();
		$monitor("encode=%b, a=%b, b=%b, result=%b",encode,a,b,result);
		#12 encode=8'b00000001;
		#12 encode=8'b00000010;
		#12 encode=8'b00000100;
		#12 encode=8'b00001000;
		#12 encode=8'b00010000;
		#12 encode=8'b00100000;
		#12 encode=8'b01000000;
		#12 encode=8'b10000000;
		#50 $finish;
	end
endmodule