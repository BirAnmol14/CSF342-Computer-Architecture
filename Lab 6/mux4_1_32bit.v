module mux4_1(out,in1,in2,in3,in4,select);
	//32 bit ip and op
	input [1:0] select;
	input [31:0] in1,in2,in3,in4;
	output reg [31:0] out;
	always@(*)
	begin
	case(select)
		2'b00:out<=in1;
		2'b01:out<=in2;
		2'b10:out<=in3;
		2'b11:out<=in4;
	endcase
	end
endmodule