`include "fadder.v"
module testbech;
	reg ip1,ip2,cin;
	wire cout,sum;
	fullAdder f1(sum,cout,ip1,ip2,cin);
	initial
	begin
		$monitor("sum=%b, cout=%b, ip1=%b, ip2=%b, cin=%b",sum,cout,ip1,ip2,cin);
		#0 ip1=1'b0;ip2=1'b0;cin=1'b0;
		#5 ip1=1'b0;ip2=1'b0;cin=1'b1;
		#5 ip1=1'b0;ip2=1'b1;cin=1'b0;
		#5 ip1=1'b0;ip2=1'b1;cin=1'b1;
		#5 ip1=1'b1;ip2=1'b0;cin=1'b0;
		#5 ip1=1'b1;ip2=1'b0;cin=1'b1;
		#5 ip1=1'b1;ip2=1'b1;cin=1'b0;
		#5 ip1=1'b1;ip2=1'b1;cin=1'b1;
	end
endmodule