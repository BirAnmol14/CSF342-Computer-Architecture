/*
	Name: BIR ANMOL SINGH
	ID: 2018A7PS0261P
*/

module RSFF(S,R,clk,reset,Q,Qbar);
	input S,R,clk,reset;
	output reg Q,Qbar;
	always@(posedge clk or posedge reset)
	begin
		if(reset)
		begin
			Q=0;
			Qbar=1;
		end
		else if(S==0 && R==1) 
		begin
				Q=0;
				Qbar=1;
		end
		else if(S==1 && R==0) 
		begin
				Q=1;
				Qbar=0;
		end
		else if(S==1 && R==1) 
		begin
				Q=1;
				Qbar=0;
		end
	end
endmodule

module DFF(D,clk,reset,Q,Qbar);
	input D,clk,reset;
	output Q,Qbar;
	RSFF mod(D,~D,clk,reset,Q,Qbar);
endmodule

module Ripple_Counter(clk,reset,out);
	input clk,reset;
	output [3:0] out;
	wire w1,w2,w3,w4;
	DFF d1(w1,clk,reset,out[0],w1);
	DFF d2(w2,w1,reset,out[1],w2);
	DFF d3(w3,w2,reset,out[2],w3);
	DFF d4(w4,w3,reset,out[3],w4);
endmodule

module MEM1(addr,data,parity);
	input [2:0] addr;
	output reg [7:0] data;
	output reg parity;
	reg [8:0] mem[7:0];
	initial 
	begin
		mem[0]=9'b0001_1111_1;
		mem[1]=9'b0011_0001_1;
		mem[2]=9'b0101_0011_1;
		mem[3]=9'b0111_0101_1;
		mem[4]=9'b1001_0111_1;
		mem[5]=9'b1011_1001_1;
		mem[6]=9'b1101_1011_1;
		mem[7]=9'b1111_1101_1;
	end
	always@(addr)
	begin
		{data,parity}=mem[addr];
	end
endmodule

module MEM2(addr,data,parity);
	input [2:0] addr;
	output reg [7:0] data;
	output reg parity;
	reg [8:0] mem[7:0];
	initial 
	begin
		mem[0]=9'b0000_0000_0;
		mem[1]=9'b0010_0010_0;
		mem[2]=9'b0100_0100_0;
		mem[3]=9'b0110_0110_0;
		mem[4]=9'b1000_1000_0;
		mem[5]=9'b1010_1010_0;
		mem[6]=9'b1100_1100_0;
		mem[7]=9'b1110_1110_0;
	end
	always@(addr)
	begin
		{data,parity}=mem[addr];
	end
endmodule

module MUX2To1(ip1,ip2,sel,out);
	input ip1,ip2,sel;
	output out;
	assign out=(sel==1)?ip1:ip2;
endmodule

module MUX16To1(ip1,ip2,sel,out);
	input [7:0] ip1,ip2;
	input sel;
	output [7:0] out;
	genvar j;
	generate
		for(j=0;j<8;j=j+1)
		begin: mux_loop
			MUX2To1 m21(ip1[j],ip2[j],sel,out[j]);
		end
	endgenerate
endmodule

module Fetch_Data(ip,data,parity);
	input [3:0] ip;
	output [7:0] data;
	output parity;
	wire [7:0] w1,w2;
	wire w3,w4;
	MEM1 m1(ip[2:0],w1,w3);
	MEM2 m2(ip[2:0],w2,w4);
	MUX16To1 muxmod(w2,w1,ip[3],data);
	MUX2To1 muxmod1(w4,w3,ip[3],parity);
endmodule

module Parity_Checker(data,parity,op);
	input parity;
	input [7:0] data;
	output op;
	wire w1,needParity;
	assign w1=data[7] ^ data[6] ^data[5] ^ data[4] ^ data[3] ^ data[2] ^ data[1] ^data[0];
	assign needParity = w1;
	assign op = (needParity==parity)?1:0;
endmodule

module Design(clk,reset,op);
	input clk,reset;
	output op;
	wire[3:0] w1;
	wire [7:0] data;
	wire parity;
	Ripple_Counter rc(clk,reset,w1);
	Fetch_Data fd(w1,data,parity);
	Parity_Checker pc(data,parity,op);
endmodule

module Test_Bench;
	reg clk,reset;
	wire op;
	Design dmod(clk,reset,op);
	initial
	begin
		#0 reset=1'b1;clk=1'b0;		
	end
	always
	begin
		#5 clk=~clk;
	end
	initial
	begin
		$dumpfile("out.vcd");
		$dumpvars();
		$monitor($time," match: %b",op);
		#5 reset=1'b0;
		#170 $finish;
	end
endmodule

