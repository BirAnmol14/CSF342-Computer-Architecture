module nand_gate(c,a,b);
	input a,b;
	output c;
	wire d;
	and a1(d,a,b);
	not n1(c,d);
endmodule