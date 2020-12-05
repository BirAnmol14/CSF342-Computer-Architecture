`include "fa1bit.v"
module adder4bit(sum,carry,a,b);
	input [3:0]a,b;
	output [3:0]sum;
	output carry;
	wire c0,c1,c2;
	fulladder1bit f1(sum[0],c0,a[0],b[0],1'b0);
	fulladder1bit f2(sum[1],c1,a[1],b[1],c0);
	fulladder1bit f3(sum[2],c2,a[2],b[2],c1);
	fulladder1bit f4(sum[3],carry,a[3],b[3],c2);
endmodule