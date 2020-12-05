module async_dff(din,clrb,clk,q);
	input din,clk,clrb;
	output q;
	reg q;
	always@(posedge clk)
	begin
		if(!clrb) q<=1'b0;
		else q<=din;
	end
endmodule