`include "decoder2_4.v"
module testbench;
	reg [1:0]reg_no;
	wire [3:0]register;
	decoder2_4 d(register,reg_no);
	initial
	begin
		$monitor("reg_no=%b, register=%b",reg_no,register);
		#5 reg_no=2'd0;
		#5 reg_no=2'd3;
		#5 reg_no=2'd1;
		#5 reg_no=2'd2;
	end
endmodule