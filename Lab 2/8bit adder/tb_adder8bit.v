`include "adder8bit.v"
module testbench;
	reg [7:0] num1;
	reg [7:0] num2;
	reg cin;
	wire [7:0] sum;
	wire cout;
	fadder8bit a1(sum,cout,num1,num2,cin);
	initial
		begin
			$dumpfile("output.vcd");$dumpvars();
			$monitor("sum=%b, cout=%b, num1=%b, num2=%b, cin=%b",sum,cout,num1,num2,cin);
			#0 	num1=8'b00000000;num2=8'b00000000;cin=0;
			#5  num1=8'b00000000;num2=8'b00000000;cin=1;
			#5  num1=8'b11111111;num2=8'b00000001;cin=0;
			#5  num1=8'b11111111;num2=8'b00000000;cin=1;
			#5  num1=8'b00001111;num2=8'b11110000;cin=0;
			#5  num1=8'b11111111;num2=8'b11111111;cin=1;
		end
endmodule