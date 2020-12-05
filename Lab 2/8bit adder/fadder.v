`include "decoder.v"
module fadder(sum,carry,z,y,x);
	input z,y,x;
	output sum,carry;
	wire [7:0] w;
	decoder d1(w,z,y,x);
	or o1(sum,w[1],w[2],w[4],w[7]);
	or o2(carry,w[3],w[5],w[6],w[7]);
endmodule