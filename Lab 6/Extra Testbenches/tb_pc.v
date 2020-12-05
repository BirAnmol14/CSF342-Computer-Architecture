`include "pc.v"
module tb_pc;
	reg [4:0] din;
	reg clk,reset;
	wire [4:0] dout;
	pc pc1(din,dout,reset,clk);
	always
	begin
	#20 clk = ~clk;
	end
	initial
	begin
		$dumpfile("pc.vcd");
		$dumpvars();
		#0 clk=0;
		reset=1;
		$monitor("din=%b, dout=%b",din,dout);
		#15 reset=0;din=5'd1;
		#25 reset=1;
		#20 din=5'd2;
		#35 reset=0;
		#51 din=5'd3;
		#100 $finish;
	end
endmodule