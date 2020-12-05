module jkFF(j,k,clk,Q);
	input j,k,clk;
	output Q;
	reg Q;
	initial 
	Q=1'b0;
	always@(posedge clk)
	begin
		if(j==0 && k==1) Q<=1'b0;
		else if(j==1 && k==0) Q<=1'b1;
		else if (j==1 && k==1) Q<=~Q;
	end
endmodule