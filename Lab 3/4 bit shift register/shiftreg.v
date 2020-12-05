module shiftReg4bit(in,clk,EN,Q);
	input in,clk,EN;
	output [0:3]Q;
	reg [0:3]Q;
	initial
	Q=4'd0;
	always@(posedge clk)
	begin
		if(EN)
			Q={in,Q[0:2]};
	end
endmodule