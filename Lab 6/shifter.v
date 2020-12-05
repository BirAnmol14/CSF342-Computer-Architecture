module shift_left_2(ip,op);
	input [31:0] ip;
	output [31:0] op;
	assign op={ip[29:0],2'b00};
endmodule