module bit4counter(clk,q);
	input clk;
	output reg [3:0] q;
	reg [3:0] count;
	integer c;
	initial 
	begin
		c=0;
	end
	always@(posedge clk)
	begin
		count=c;
		c=c+1;
		if(c>15)c=0;
	end
	always@(count)
	begin
		q=count;
	end
endmodule
module bit4downcounter(clk,q);
	input clk;
	output reg [3:0] q;
	reg [3:0] count;
	integer c;
	initial 
	begin
		c=15;
	end
	always@(posedge clk)
	begin
		count=c;
		c=c-1;
		if(c<0)c=15;
	end
	always@(count)
	begin
		q=count;
	end
endmodule
module testbench;
	reg clk;
	wire [3:0] q;
	bit4downcounter b4c(clk,q);
	initial
	begin
	 #0 clk=1'b0;
	end
	always
	begin
		#2 clk=~clk;
	end	
	initial
	begin
		#2 $monitor("q=%d",q);
		#200 $finish;
	end
endmodule