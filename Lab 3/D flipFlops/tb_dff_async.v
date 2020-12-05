`include "async_dff.v"
module testbench;
	reg din,clk,clrb;
	wire q;
	async_dff dff(din,clrb,clk,q);
	always@(posedge clk)
	begin
		$display("din=%b, clrb=%b, q=%b\n",din,clrb,q);
	end
	initial 
	begin
	forever 
	begin
		clk=0;
		#5 clk=1;
		#5 clk=0;
	end
	end
	initial 
	begin
		#1 clrb=1; din=1;
		#5 din=0;
		#5 clrb=0;
		#2 din=1;
		#5 clrb=1;
		#1 din=0;
	end
endmodule