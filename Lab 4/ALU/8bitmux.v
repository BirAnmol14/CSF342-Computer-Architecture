`include "2mux1.v"
module bit8_2to1mux(in1,in2,op,select);
	input [7:0] in1,in2;
	output [7:0] op;
	input select;
	genvar j;
	generate
	//used to do multiple instansiation
	for(j=0;j<8;j=j+1)
	begin:mux_loop
	mux2_1 m1(op[j],in1[j],in2[j],select);
	end
	endgenerate
endmodule