`include "mux4_1_32bit.v"
module testbench;
	reg [1:0] sel;
	reg [31:0] in1,in2,in3,in4;
	wire [31:0] out;
	mux4_1 m(out,in1,in2,in3,in4,sel);
	initial
	begin
		sel=2'b00;
		in1=32'd1;
		in2=32'd2;
		in3=32'd3;
		in4=32'd4;
		$monitor("sel=%b, in1=%b, in2=%b, in3=%b, in4=%b, out=%b",sel,in1,in2,in3,in4,out);
		#5 sel=2'd1;
		#5 sel=2'd2;
		#5 sel=2'd0;
		#5 sel=2'd3;
		#5 in4=32'd100;
	end
endmodule