module  pc(din,dout,reset,clk);
	input [4:0] din;
	input reset,clk;
	output reg [4:0] dout;
	initial
	dout=5'd0;
	always@(negedge clk or reset)
	begin
		if(reset==1) dout<=5'd0;
		else if(reset==0) dout<=din;
	end
endmodule