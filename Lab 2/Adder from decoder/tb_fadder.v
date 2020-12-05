`include "fadder.v"
module testbench;
	reg [2:0] ip;
	wire s,c;
	fadder f1(s,c,ip);
	initial
		begin
			$dumpfile("ouput.vcd");$dumpvars();
			$monitor(,$time," input=%b,s=%b,c=%b",ip,s,c);
			#0 ip=3'b000;
			#4 ip=3'b100;
			#4 ip=3'b010;
			#4 ip=3'b110;
			#4 ip=3'b001;
			#4 ip=3'b101;
			#4 ip=3'b011;
			#4 ip=3'b111;
		end
endmodule
