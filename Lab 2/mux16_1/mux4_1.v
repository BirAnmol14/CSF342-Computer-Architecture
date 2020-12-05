module mux4_1(op,ip,s);
	output op;
	input [3:0] ip;
	input [1:0] s;
	assign op=(~s[0] & ~s[1] & ip[0])|(s[0] & ~s[1] & ip[1])|(~s[0] & s[1] & ip[2])|(s[0] & s[1] & ip[3]);
endmodule