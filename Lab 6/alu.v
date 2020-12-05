`include "fa32bit.v"
`include "or32bit.v"
`include "and32bit.v"
`include "bit32_4to1mux.v"
module alu(a,b,binvert,sel,cout,result);
	input [31:0] a,b;
	input [1:0] sel;
	input binvert;
	output cout;
	output [31:0] result;
	wire [31:0] notb,b_from_mux,and_result,or_result,adder_result;
	assign notb=~b;
	bit32_2to1mux m1(b,notb,b_from_mux,binvert);
	and32bit a1(a,b_from_mux,and_result);
	or32bit o1(a,b_from_mux,or_result);
	fa32bit fa1(a,b_from_mux,binvert,adder_result,cout);
	bit32_4to1mux m2(and_result,or_result,adder_result,sel,result);
endmodule