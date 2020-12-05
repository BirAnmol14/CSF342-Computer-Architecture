module parityGen(in,out);
	//Even Parity Generator
	input [3:0] in;
	output out;
	assign out=in[0]^in[1]^in[2]^in[3];
endmodule
module tb_parity;
	reg [3:0] in;
	wire out;
	parityGen pg(in,out);
	initial
	begin
		in=4'd0;
		$monitor("in=%b, out=%b",in,out);
		#5 in=4'b0001;
		#5 in=4'b0011;
		#5 in=4'b1011;
		#5 in=4'b1001;
		#5 in=4'b1111;
	end
endmodule