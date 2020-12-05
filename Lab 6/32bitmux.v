`include "8bitmux.v"
module bit32_2to1mux(in1,in2,op,select);
	input [31:0] in1,in2;
	output [31:0] op;
	input select;
	genvar j;
	generate
	for(j=0;j<4;j=j+1)
	begin: mux_loop
		bit8_2to1mux m1(in1[j*8+7:j*8],in2[j*8+7:j*8],op[j*8+7:j*8],select);
	end
	endgenerate
endmodule