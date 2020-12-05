`include "adder1bit.v"
module testbench;
	reg a,b;
	wire sum,carry;
	adder1bit a1(sum,carry,a,b);
	initial
		begin
			$dumpfile("output.vcd"); $dumpvars;
			$monitor(,$time," a=%b, b=%b,a+b=%b,carry=%b",a,b,sum,carry);
			#0 a=1'b0;b=1'b0;
			#10 a=1'b1;b=1'b0;
			#20 a=1'b0;b=1'b1; 
			#30 a=1'b1;b=1'b1;
			#50 $finish;
		end
endmodule