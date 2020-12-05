module reg4Bit(in,clk,out);
	input [3:0] in;
	input clk;
	output reg [3:0] out;
	initial
	begin
		out<=4'b0000;
	end
	always@(negedge clk)
	begin
		out<=in;
	end
endmodule 