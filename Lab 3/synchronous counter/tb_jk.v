`include "jkFF.v"
module testbench;
	reg clk,j,k;
	wire q;
	jkFF flipflop(j,k,clk,q);
	initial 
	clk=0; 
	always
	begin
	#2 clk=~clk;
	end
	initial
	$monitor($time," clk=%b j=%b k=%b Q=%b\n",clk,j,k,q);
	initial
	begin
	j=1;k=0;
		#3 j=0;k=1;
		#2 j=1;k=1;
		#4 j=0;k=0;
		#5 $finish;
	end
endmodule