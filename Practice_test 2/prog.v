module bit4adder(inp1,inp2,sum);
	input [3:0] inp1,inp2;
	output [4:0] sum;
	assign sum=inp1+inp2;
endmodule
module invalidBCD(c,s3,s2,s1,flag);
	input c,s3,s2,s1;
	output flag;
	assign flag=c|((s2|s1)&s3);
endmodule
module bcdAdjust(s1,s2,cout,sum);
	input [4:0] s1,s2;
	output cout;
	output [7:0] sum;
	wire fg1,c1,c2,c3,fg2;
	wire [3:0] s3;
	invalidBCD in1(s2[4],s2[3],s2[2],s2[1],fg1);
	bit4adder ad1(s2[3:0],{1'b0,{2{fg1}},1'b0},{c1,sum[3:0]});
	bit4adder ad2(s1[3:0],{3'b000,fg1},{c2,s3});
	invalidBCD in2(s1[4],s3[3],s3[2],s3[1],fg2);
	bit4adder ad3(s3[3:0],{1'b0,{2{fg2}},1'b0},{c3,sum[7:4]});
	assign cout=s1[4]|fg2;
endmodule
module bcdAdder(inp1,inp2,cout,sum);
	input [7:0] inp1,inp2;
	output cout;
	output [7:0] sum;
	wire [4:0] s1,s2;
	bit4adder a1(inp1[7:4],inp2[7:4],s1);
	bit4adder a2(inp1[3:0],inp2[3:0],s2);
	bcdAdjust ba(s1,s2,cout,sum);
endmodule
module testbench;
	reg [7:0]inp1,inp2;
	wire cout;
	wire [7:0] sum;
	bcdAdder bad(inp1,inp2,cout,sum);
	initial
	begin
		#0 inp1=8'h25;inp2=8'h52;
		#1 $display("%d%d + %d%d = %d%d%d",inp1[7:4],inp1[3:0],inp2[7:4],inp2[3:0],cout,sum[7:4],sum[3:0]);
		#3 inp1=8'h99;inp2=8'h88;
		#4 $display("%d%d + %d%d = %d%d%d",inp1[7:4],inp1[3:0],inp2[7:4],inp2[3:0],cout,sum[7:4],sum[3:0]);
		#6 inp1=8'h93;inp2=8'h12;
		#7 $display("%d%d + %d%d = %d%d%d",inp1[7:4],inp1[3:0],inp2[7:4],inp2[3:0],cout,sum[7:4],sum[3:0]);
	end
endmodule