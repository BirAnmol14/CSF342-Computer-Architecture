`include "fa1bit.v"
module testbench;
	reg a,b,cin;
	wire sum,carry;
	fulladder1bit a1(sum,carry,a,b,cin);
	initial
		begin
			$dumpfile("output.vcd"); $dumpvars;
			$monitor(,$time," a=%b, b=%b, cin=%b, sum=%b, carry=%b",a,b,cin,sum,carry);
			#0 a=1'b0;b=1'b0;cin=1'b0;
			#10 a=1'b0;b=1'b0;cin=1'b1;
			#20 a=1'b0;b=1'b1; cin=1'b0;
			#30 a=1'b0;b=1'b1;cin=1'b1;
			#40 a=1'b1;b=1'b0;cin=1'b0;
			#50 a=1'b1;b=1'b0;cin=1'b1;
			#60 a=1'b1;b=1'b1; cin=1'b0;
			#70 a=1'b1;b=1'b1;cin=1'b1;
			#80 $finish;
		end
endmodule