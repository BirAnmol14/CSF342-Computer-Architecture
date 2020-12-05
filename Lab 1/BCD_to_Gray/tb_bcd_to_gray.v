`include "bcd_to_gray.v"
module testbench;
	reg [3:0]ip;
	wire [3:0]op;
	bcd_to_gray b1(op,ip);
	initial
		begin
			$dumpfile("output.vcd"); $dumpvars;
			$monitor(,$time," ip=%b, op=%b",ip,op);
			#0 ip=4'b0000;
			#5 ip=4'b0001;
			#10 ip=4'b0010;
			#15 ip=4'b0011;
			#20 ip=4'b0100;
			#25 ip=4'b0101;
			#30 ip=4'b0110;
			#35 ip=4'b0111;
			#40 ip=4'b1000;
			#45 ip=4'b1001;
			#50 $finish;
		end
endmodule