`include "fadder.v"
module addsub(cout,val,v,ip1,ip2,m);
	input [3:0] ip1,ip2;
	input m;
	output [3:0] val;
	output v,cout;
	wire w0,w1,w2,w3,c1,c2,c3;
	xor x1(w0,ip2[0],m);
	xor x2(w1,ip2[1],m);
	xor x3(w2,ip2[2],m);
	xor x4(w3,ip2[3],m);
	fullAdder f1(val[0],c1,ip1[0],w0,m);
	fullAdder f2(val[1],c2,ip1[1],w1,c1);
	fullAdder f3(val[2],c3,ip1[2],w2,c2);
	fullAdder f4(val[3],cout,ip1[3],w3,c3);
	xor x5(v,cout,c3);
endmodule