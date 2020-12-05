module REG1(clk,EN,numin,numout);
	input clk,EN;
	input [3:0] numin;
	output reg [3:0] numout;
	always@(posedge clk)
	begin
		if(EN) numout<=numin;
	end
endmodule

module ROTATOR(clk,Enable,numo,numrotated);
	input clk,Enable;
	input [3:0] numo;
	output reg [3:0] numrotated;
	always@(posedge clk)
	begin
		if(Enable) numrotated={numo[0],numo[3:1]};
	end
endmodule

module MULTIPLIER(op1,op2,product);
	input [3:0] op1,op2;
	output reg [7:0] product;
	reg [3:0] A,M,Q;
	reg C;
	integer count;
	always@(op1 or op2)
	begin
		count=4;
		A=4'b0000;
		M=op1;
		Q=op2;
		C=1'b0;
		while(count!=0)
		begin
			if(Q[0]==1)
			begin
				{C,A} = A+M;
			end
			{C,A,Q}={1'b0,C,A,Q[3:1]};
			count=count-1;
		end
		product <= {A,Q};
	end
endmodule

module DECODER(sel,out1);
	input [3:0] sel;
	output reg [15:0] out1;
	always@(sel)
	begin
		out1=16'd0;
		out1[sel]=1;
	end
endmodule

module MEMORY(WE,datatowrite,regsel,readdata);
	input WE;
	input [15:0] regsel;
	input [7:0] datatowrite;
	reg [7:0] mem [15:0];
	output reg [7:0] readdata;
	always@(WE or datatowrite or regsel)
	begin
		case(regsel)
				16'b0000_0000_0000_0001:begin
					if(WE) mem[0] = datatowrite;
					readdata = mem[0];
				end
				16'b0000_0000_0000_0010:begin
					if(WE) mem[1] = datatowrite;
					readdata = mem[1];
				end
				16'b0000_0000_0000_0100:begin
					if(WE) mem[2] = datatowrite;
					readdata = mem[2];
				end
				16'b0000_0000_0000_1000:begin
					if(WE) mem[3] = datatowrite;
					readdata = mem[3];
				end
				16'b0000_0000_0001_0000:begin
					if(WE) mem[4] = datatowrite;
					readdata = mem[4];
				end
				16'b0000_0000_0010_0000:begin
					if(WE) mem[5] = datatowrite;
					readdata = mem[5];
				end
				16'b0000_0000_0100_0000:begin
					if(WE) mem[6] = datatowrite;
					readdata = mem[6];
				end
				16'b0000_0000_1000_0000:begin
					if(WE) mem[7] = datatowrite;
					readdata = mem[7];
				end
				16'b0000_0001_0000_0000:begin
					if(WE) mem[8] = datatowrite;
					readdata = mem[8];
				end
				16'b0000_0010_0000_0000:begin
					if(WE) mem[9] = datatowrite;
					readdata = mem[9];
				end
				16'b0000_0100_0000_0000:begin
					if(WE) mem[10] = datatowrite;
					readdata = mem[10];
				end
				16'b0000_1000_0000_0000:begin
					if(WE) mem[11] = datatowrite;
					readdata = mem[11];
				end
				16'b0001_0000_0000_0000:begin
					if(WE) mem[12] = datatowrite;
					readdata = mem[12];
				end
				16'b0010_0000_0000_0000:begin
					if(WE) mem[13] = datatowrite;
					readdata = mem[13];
				end
				16'b0100_0000_0000_0000:begin
					if(WE) mem[14] = datatowrite;
					readdata = mem[14];
				end
				16'b1000_0000_0000_0000:begin
					if(WE) mem[15] = datatowrite;
					readdata = mem[15];
				end
		endcase
	end
endmodule
module DATAPATH(num,key,storedvalue);
	input [3:0] num,key;
	reg clk,EN,Enable,WE;
	wire [3:0] numo,numrot,numrot1;
	wire [7:0] prod;
	wire [15:0] addr;
	output [7:0] storedvalue;
	initial
	begin
		#0 clk=1'b1;EN=1'b1;Enable=1'b1;WE=1'b1;
	end
	always
	begin
		#5 clk=~clk;
	end
	REG1 reg1(clk,EN,num,numo);
	ROTATOR r1(clk,Enable,numo,numrot);
	ROTATOR r2(clk,Enable,numrot,numrot1);
	MULTIPLIER mult(numrot1,key,prod);
	DECODER dec(numo,addr);
	MEMORY m1(WE,prod,addr,storedvalue);
endmodule


module TESTBENCH;
	reg [3:0] num,key;
	wire [7:0] storedvalue;
	DATAPATH dp(num,key,storedvalue);
	initial
	begin
		$dumpfile("out.vcd");
		$dumpvars();
		$monitor($time," num=%b, key=%b, val=%b",num,key,storedvalue);
		#0 num=4'b1000;key=4'b1000;
		#12 num=4'b1001;key=4'b1000;
		#12 num=4'b1100;key=4'b1010;
		#12 num=4'b1011;key=4'b1110;
		#50 $finish;
	end
endmodule