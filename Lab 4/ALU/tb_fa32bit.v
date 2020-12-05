`include "fa32bit.v"
module testbench_fa32bit;
	reg [31:0] in1,in2;
	reg cin;
	wire [31:0] sum;
	wire carry;
	fa32bit a1(in1,in2,cin,sum,carry);
	initial 
	begin
		$monitor("cout=%b, sum=%b",carry,sum);
		in1=32'hFFFFFFFF;
		in2=32'h00000001;
		cin=1'b0;
		#100 cin=1'b1;in2=32'd0;
		#100 in1=32'd0;
		#100 $finish;
	end
endmodule