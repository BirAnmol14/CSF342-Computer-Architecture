module decoder(op,z,y,x);
	output [7:0] op;
	input z,y,x;
	//Gate level
	wire x1,y1,z1,w1;
	not n1(x1,x);
	not n2(y1,y);
	not n3(z1,z);
	and a0(op[0],z1,y1,x1);
	and a1(op[1],z1,y1,x);
	and a2(op[2],z1,y,x1);
	and a3(op[3],z1,y,x);
	and a4(op[4],z,y1,x1);
	and a5(op[5],z,y1,x);
	and a6(op[6],z,y,x1);
	and a7(op[7],z,y,x);
endmodule