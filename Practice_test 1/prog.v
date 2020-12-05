module greyGenerator(clk,reset,out);
	input clk,reset;
	output reg [3:0] out;
	integer i;
	reg [3:0] inp;
	reg [3:0] w;
	initial
	begin
		inp=4'b0000;
		i=0;
	end
	always@(posedge clk)
	begin
		if(reset) 
		begin 
			i=0;
		end
		inp=i;
		w[3] = inp[3];
		w[2] = inp[3]^inp[2];
		w[1] = inp[2]^inp[1];
		w[0] = inp[1]^inp[0];
		i=i+1;
		if(i>15)i=0;
		out=w;
	end
endmodule
module testbench;
	reg clk,rst;
	wire [3:0] out;
	greyGenerator gg(clk,rst,out);
	initial
	begin
		clk=1'b0;
		rst=1'b0;
	end
	always
	begin
		#5 clk=~clk;
	end
	initial
	begin
		$dumpfile("out.vcd");
		$dumpvars();
		$monitor($time," out=%b",out);
		#17 rst=1'b1; 
		#28 rst=1'b0;
		#200 $finish;
	end
endmodule