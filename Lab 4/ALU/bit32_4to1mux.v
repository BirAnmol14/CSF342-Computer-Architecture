`include "32bitmux.v"
module bit32_4to1mux(in1,in2,in3,sel,op);
	input [31:0] in1,in2,in3;
	input [1:0] sel;
	output [31:0] op;
	wire [31:0] w1,w2;
	bit32_2to1mux m1(in1,in2,w1,sel[0]);
	bit32_2to1mux m2(in3,32'b0,w2,sel[0]);
	bit32_2to1mux m3(w1,w2,op,sel[1]);
endmodule