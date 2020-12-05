module encoder(ip,op);
	input [7:0] ip;
	output reg [2:0] op;
	always@(ip)
	begin
		case(ip)
			8'b00000001:op<=3'b000;
			8'b00000010:op<=3'b001;
			8'b00000100:op<=3'b010;
			8'b00001000:op<=3'b011;
			8'b00010000:op<=3'b100;
			8'b00100000:op<=3'b101;
			8'b01000000:op<=3'b110;
			8'b10000000:op<=3'b111;
		endcase
	end
endmodule
module tb_encoder;
	reg[7:0] ip;
	wire[2:0] op;
	encoder e1(ip,op);
	initial
	begin
		$monitor("ip=%b , op=%b",ip,op);
		#5 ip=8'b00000001;
		#5 ip=8'b00000010;
		#5 ip=8'b00000100;
		#5 ip=8'b00001000;
		#5 ip=8'b00010000;
		#5 ip=8'b00100000;
		#5 ip=8'b01000000;
		#5 ip=8'b10000000;
	end
endmodule