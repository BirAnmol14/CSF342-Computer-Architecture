module BHT(addr,in,WR,out);
	input [9:0] addr;
	input [1:0] in;
	input WR;
	output reg [1:0] out;
	reg [1:0] mem[1023:0];
	integer i;
	initial
	begin
		for(i=0;i<1024;i=i+1)
		begin
			mem[i]=2'b00;
		end
	end
	always@(addr or in or WR)
	begin
		if(WR) mem[addr]=in;
		out = mem[addr];
	end
endmodule
module mux2_1(i1,i2,s,o);
	input [1:0] i1,i2;
	input s;
	output [1:0] o;
	assign o = (s==1)?i1:i2;
endmodule
module PREDICTOR (clk,bt,st);
	input bt,clk;
	output reg [1:0] st;
	reg [1:0] curr;
	initial
	begin
		curr=2'b00;
	end
	always@(posedge clk)
	begin
		case(curr)
			2'b00:
			begin
				if(bt) curr = 2'b01;
				else curr = 2'b00;
			end
			2'b01:
			begin
				if(bt) curr = 2'b11;
				else curr = 2'b00;
			end
			2'b10:
			begin
				if(bt) curr = 2'b11;
				else curr = 2'b00;
			end
			2'b11:
			begin
				if(bt) curr = 2'b11;
				else curr = 2'b10;
			end
		endcase
	end
	always@(curr)
	begin
		st = curr;
	end
endmodule
module INTG(clk,bt,addr,st);
	input bt,clk;
	input [9:0] addr;
	wire [1:0] state,out1,out2;
	output [1:0] st;
	reg prev;
	initial
	begin
		prev=1'b0;
	end
	always@(posedge clk)
		#8 prev=bt;
	PREDICTOR p(clk,bt,state);
	BHT taken(addr,state,bt,out1);
	BHT notTaken(addr,state,!bt,out2);
	mux2_1 m1(out1,out2,prev,st);
endmodule

module testbech;
	reg bt,clk;
	reg [9:0] addr;
	wire [1:0] res;
	INTG mod(clk,bt,addr,res);
	integer i;
	initial
	begin
		clk=1'b0;
	end
	always
	begin
		#5 clk=~clk;
	end
	initial 
	begin
		$dumpfile("out.vcd");
		$dumpvars();
		#10 bt=1'b0;addr=10'b0011110000;
		#10 $monitor("res=%b",res);
		#10 bt=1'b0;
		#10 bt=1'b1;
		#10 bt=1'b1;
		#10 bt=1'b1;
		#10 bt=1'b0;
		#10 $finish;
	end
endmodule