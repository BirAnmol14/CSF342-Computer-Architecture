`include "dff.v"
module reg32bit(q,d,clk,reset);
	input clk,reset;
	input [31:0] d;
	output [31:0] q;
	genvar j;
	generate
	for(j=0;j<32;j=j+1)
	begin : dff_loop
		dff d1(q[j],d[j],clk,reset);
	end
	endgenerate
endmodule