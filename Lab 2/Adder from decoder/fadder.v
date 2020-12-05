`include "decoder.v"
module fadder(sum,carry,ip);
	input [2:0] ip;
	output sum,carry;
	wire [7:0] w;
	decoder d1(w,ip);
	or o1(sum,w[1],w[2],w[4],w[7]);
	or o2(carry,w[3],w[5],w[6],w[7]);
endmodule