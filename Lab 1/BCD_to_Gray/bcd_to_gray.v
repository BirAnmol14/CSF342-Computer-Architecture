module bcd_to_gray(op,ip);
	input [3:0] ip;
	output [3:0] op;
	//Gate Level
	assign op[3]=ip[3];
	xor x1(op[2],ip[3],ip[2]);
	xor x2(op[1],ip[2],ip[1]);
	xor x3(op[0],ip[1],ip[0]);
	
	//Data Flow
	/*
		assign op[3]=ip[3];
		assign op[2]=ip[2]^ip[3];
		assign op[1]=ip[2]^ip[1];
		assign op[0]=ip[1]^ip[0];
	*/
endmodule