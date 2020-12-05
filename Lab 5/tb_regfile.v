`include "registerFile.v"
module testbench;
	reg clk,reset,RegWrite;
	reg [1:0] readReg1,readReg2,WriteReg;
	reg [31:0] WriteData;
	wire [31:0] ReadData1,ReadData2;
	RegFile rf(clk,reset,readReg1,readReg2,WriteData,WriteReg,RegWrite,ReadData1,ReadData2);
	always@(clk)
	#5 clk<=~clk;
	initial 
	begin
		$dumpfile("regFile.vcd");
		$dumpvars;
		clk=1'b1;
		reset=1'b0;
		RegWrite=1'b0;
		WriteReg=2'b00;
		readReg1=2'b00;
		readReg2=2'b01;
		#0 $monitor(,$time," data1=%b, data2=%b",ReadData1,ReadData2); 
		#15 reset=1'b1;readReg1=2'b00;readReg2=2'b01;
		#10 WriteReg=2'b00;WriteData=32'd1;RegWrite=1'b1;
		#10 WriteData=32'd2;RegWrite=1'b0;
		#15 readReg1=2'b00;readReg2=2'b01;
		#10 readReg1=2'b10;
		#10 WriteReg=2'b11; WriteData=32'd4;RegWrite=1'b1;
		#10 readReg2=2'b11;RegWrite=1'b0;
		#15 readReg1=2'b10;readReg2=2'b11;
	end
endmodule