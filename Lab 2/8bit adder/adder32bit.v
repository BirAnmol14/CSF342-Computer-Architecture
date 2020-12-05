`include "adder8bit.v"
module adder32bit(sum,cout,num1,num2,cin);
	input [31:0] num1,num2;
	input cin;
	output [31:0] sum;
	output cout;
	wire c1,c2,c3;
	fadder8bit f1(sum[7:0],c1,num1[7:0],num2[7:0],cin);
	fadder8bit f2(sum[15:8],c2,num1[15:8],num2[15:8],c1);
	fadder8bit f3(sum[23:16],c3,num1[23:16],num2[23:16],c2);
	fadder8bit f4(sum[31:24],cout,num1[31:24],num2[31:24],c3);
endmodule