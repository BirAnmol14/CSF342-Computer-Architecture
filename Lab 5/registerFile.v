`include "register32bit_pipo.v"
`include "decoder2_4.v"
`include "mux4_1_32bit.v"
module RegFile(clk,reset,readReg1,readReg2,WriteData,WriteReg,RegWrite,ReadData1,ReadData2);
	input clk,reset,RegWrite;
	input [1:0] readReg1,readReg2,WriteReg;
	input [31:0] WriteData;
	output [31:0] ReadData1,ReadData2;
	wire wclk1,wclk2,wclk3,wclk4;
	wire [3:0] write_register;
	wire [31:0] opr1,opr2,opr3,opr4;
	decoder2_4 d(write_register,WriteReg);
	and a1(wclk1,clk,RegWrite,write_register[0]);
	and a2(wclk2,clk,RegWrite,write_register[1]);
	and a3(wclk3,clk,RegWrite,write_register[2]);
	and a4(wclk4,clk,RegWrite,write_register[3]);
	reg32bit r0(opr1,WriteData,wclk1,reset);
	reg32bit r1(opr2,WriteData,wclk2,reset);
	reg32bit r2(opr3,WriteData,wclk3,reset);
	reg32bit r3(opr4,WriteData,wclk4,reset);
	mux4_1 m1(ReadData1,opr1,opr2,opr3,opr4,readReg1);
	mux4_1 m2(ReadData2,opr1,opr2,opr3,opr4,readReg2);
endmodule