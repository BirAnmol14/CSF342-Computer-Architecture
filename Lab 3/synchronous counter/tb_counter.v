`include "counter.v"
module testbench;
	reg clk,i;
	wire [3:0] Q;
	sync_4bitCounter c1(clk,Q);
	
	initial 
	begin
	clk = 0;
	forever
	begin
	#100 clk=1;
	#100 clk=0;
	end
	end
	
	always@(posedge clk)
	begin
	$display("Q=%b\n",Q);
	end 
endmodule