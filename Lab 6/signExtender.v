module signExtend16_to_32(ip,op);
	input [15:0] ip;
	output [31:0] op;
	assign op={{16{ip[15]}},ip[15:0]};
endmodule