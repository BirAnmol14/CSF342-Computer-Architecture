`include "nand.v"
module testbench;
	reg a,b;
	wire c;
	nand_gate nand1(c,a,b);
	initial
		begin
			$dumpfile("nand.vcd"); $dumpvars;
			$monitor(,$time," a=%b, b=%b, c=%b",a,b,c);
			#0 a=1'b0;b=1'b0;
			#3 a=1'b0;b=1'b1;
			#6 a=1'b1;b=1'b0;
			#9 a=1'b1;b=1'b1;
			#10 $finish;
		end
endmodule
