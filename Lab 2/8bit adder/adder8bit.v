`include "fadder.v"
module fadder8bit(sum,cout,num1,num2,cin);
	input [7:0] num1,num2;
	input cin;
	output [7:0] sum;
	output cout;
	wire c1,c2,c3,c4,c5,c6,c7;
	fadder f1(sum[0],c1,num1[0],num2[0],cin);
	fadder f2(sum[1],c2,num1[1],num2[1],c1);
	fadder f3(sum[2],c3,num1[2],num2[2],c2);
	fadder f4(sum[3],c4,num1[3],num2[3],c3);
	fadder f5(sum[4],c5,num1[4],num2[4],c4);
	fadder f6(sum[5],c6,num1[5],num2[5],c5);
	fadder f7(sum[6],c7,num1[6],num2[6],c6);
	fadder f8(sum[7],cout,num1[7],num2[7],c7);
endmodule