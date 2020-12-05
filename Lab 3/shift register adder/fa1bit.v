`include "adder1bit.v"
module fulladder1bit(sum,cout,a,b,cin);
	input a,b,cin;
	output sum,cout;
	wire s,c;
	adder1bit half_adder(s,c,a,b);
	//s=a^b
	//c=a&b
	assign sum=s^cin;
	assign cout=cin&s|c;
endmodule