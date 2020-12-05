module decoder(op,ip);
	output [7:0] op;
	input [2:0] ip;
	//Gate level
	wire x1,y1,z1,w1;
	not n1(x1,ip[0]);
	not n2(y1,ip[1]);
	not n3(z1,ip[2]);
	and a0(op[0],z1,y1,x1);
	and a1(op[1],z1,y1,ip[0]);
	and a2(op[2],z1,ip[1],x1);
	and a3(op[3],z1,ip[1],ip[0]);
	and a4(op[4],ip[2],y1,x1);
	and a5(op[5],ip[2],y1,ip[0]);
	and a6(op[6],ip[2],ip[1],x1);
	and a7(op[7],ip[2],ip[1],ip[0]);
endmodule