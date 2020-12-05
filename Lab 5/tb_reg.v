`include "register32bit_pipo.v"
module testbench;
	reg [31:0] d;
	reg clk,reset;
	wire [31:0] q;
	reg32bit R(q,d,clk,reset);
	always @(clk)
	#5 clk<=~clk;
	initial
	begin
	$monitor("reset=%b, d=%b, q=%b",reset,d,q);
	clk= 1'b1;
	reset=1'b0;//reset the register
	#20 reset=1'b1;
	#20 d=32'hAFAFAFAF;
	#20 d=32'hFAFAFAFA;
	#200 $finish;
	end
endmodule