module pipelineReg(cntrl,a,b,clk,out);
	input [3:0] a,b;
	input [2:0] cntrl;
	input clk;
	output reg [10:0] out;
	wire [10:0] tmp;
	assign tmp[3:0]=b;
	assign tmp[7:4]=a;
	assign tmp[10:8]=cntrl;
	always@(negedge clk)
	begin
		out<=tmp;
	end
endmodule
module tb_reg;
	reg [3:0] a,b;
	reg [2:0] cntrl;
	reg clk;
	wire reg [10:0] out;
	pipelineReg r1(cntrl,a,b,clk,out);
	always@(clk)
	begin
		#5 clk<=~clk;
	end
	initial
	begin
		clk=1'b1;
		$monitor("cntrl=%b, a=%b, b=%b, out=%b",cntrl,a,b,out);
		#20 a=4'b0001;b=4'b0000;cntrl=3'b110;
		#20 a=4'b0101;b=4'b0000;cntrl=3'b111;
		#20 a=4'b0101;b=4'b0110;cntrl=3'b000;
		#200 $finish;
	end
endmodule