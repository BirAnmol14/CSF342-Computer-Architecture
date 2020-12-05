`include "jkFF.v"
module sync_4bitCounter(clk,Q);
	input clk;
	output [3:0] Q;
	wire w1,w2;
	jkFF jk1(1'b1,1'b1,clk,Q[0]);
	jkFF jk2(Q[0],Q[0],clk,Q[1]);
	and a1(w1,Q[1],Q[0]);
	jkFF jk3(w1,w1,clk,Q[2]);
	and a2(w2,w1,Q[2]);
	jkFF jk4(w2,w2,clk,Q[3]);
endmodule