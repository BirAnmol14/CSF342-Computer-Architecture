module dff(q,d,clk,reset);
	input d,clk,reset;
	output reg q;
	//Reset is active low and synchronous reset
	initial
	q=1'b0;
	always@(posedge clk)
	begin
		if(reset==1'b0)
			q<=1'b0;
		else
			q<=d;
	end
endmodule