`include "mux4_1.v"
module mux16_1(op,ip,s);
	input [15:0] ip;
	input [3:0] s;
	output op;
	wire [3:0]w;
	mux4_1 m1(w[0],ip[3:0],s[1:0]);
	mux4_1 m2(w[1],ip[7:4],s[1:0]);
	mux4_1 m3(w[2],ip[11:8],s[1:0]);
	mux4_1 m4(w[3],ip[15:12],s[1:0]);
	mux4_1 m5(op,w,s[3:2]);
endmodule