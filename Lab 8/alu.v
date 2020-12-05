module alu(a,b,cntrl,out);
	input [3:0] a,b;
	input [2:0] cntrl;
	output reg [3:0] out;
	always@(cntrl)
	begin
		case(cntrl)
			3'b000: out<=a+b;
			3'b001: out<=a-b;
			3'b010: out<=a^b;
			3'b011: out<=a|b;
			3'b100: out<=a&b;
			3'b101: out<=~(a|b);
			3'b110: out<=~(a&b);
			3'b111: out<=~(a^b);
		endcase
	end
endmodule
module tb_alu;
	reg [3:0] a,b;
	reg [2:0] cntrl;
	wire [3:0] out;
	alu a1(a,b,cntrl,out);
	initial
	begin
		a=4'b0010;b=4'b0001;cntrl=3'b000;
		$monitor("a=%b, b=%b, cntrl=%b, out=%b",a,b,cntrl,out);
		#5 cntrl=3'b001;
		#5 cntrl=3'b010;
		#5 cntrl=3'b011;
		#5 cntrl=3'b100;
		#5 cntrl=3'b101;
		#5 cntrl=3'b110;
		#5 cntrl=3'b111;
	end
endmodule