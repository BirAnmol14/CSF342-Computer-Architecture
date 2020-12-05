`include "addsub.v"
module testbench;
	reg m;
	reg [3:0] ip1,ip2;
	wire [3:0] val;
	wire v,cout;
	addsub as1(cout,val,v,ip1,ip2,m);
	initial
	begin
		$monitor("v=%b, cout=%b, val=%b, ip1=%b,ip2=%b,m=%b",v,cout,val,ip1,ip2,m);
		#0 m=1'b0;ip1=4'b0101;ip2=4'b1010;
		#5 m=1'b0;ip1=4'b1111;ip2=4'b0001;
		#5 m=1'b1;ip1=4'b1111;ip2=4'b0001;
		#5 m=1'b1;ip1=4'b0101;ip2=4'b0000;
	end
endmodule