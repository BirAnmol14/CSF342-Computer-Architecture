`include "fa1bit.v"
module fa32bit(in1,in2,cin,sum,carry);
	input [31:0] in1,in2;
	input cin;
	output [31:0] sum;
	output carry;
	wire [32:0] c;
	assign c[0]=cin;
	genvar j;
	generate
	for(j=0;j<32;j=j+1)
	begin: faloop
		fulladder1bit a1(sum[j],c[j+1],in1[j],in2[j],c[j]);
	end
	endgenerate
	assign carry=c[32];
endmodule