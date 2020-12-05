`include "adder4bit.v"
module testbench;
	reg [3:0] a,b;
	wire [3:0]sum;
	wire carry;
	adder4bit a1(sum,carry,a,b);
	initial
		begin
			$dumpfile("output.vcd"); $dumpvars;
			$monitor(,$time," a=%b, b=%b, sum=%b, carry=%b",a,b,sum,carry);
			#0 a=4'b0000;b=4'b0000;
			#10 a=4'b0000;b=4'b1111;
			#20 a=4'b0000;b=4'b1010;
			#30 a=4'b0001;b=4'b1111;
			#40 a=4'b1111;b=4'b1111;
			#50 a=4'b0101;b=4'b1010;
			#60 a=4'b0011;b=4'b1100;
			#70 a=4'b1000;b=4'b1011;
			#80 $finish;
		end
endmodule