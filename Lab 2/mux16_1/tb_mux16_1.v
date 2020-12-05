`include "mux16_1.v"
module testbench;
	reg [15:0] in;
	reg [3:0] sel;
	wire out;
	mux16_1 m1(out,in,sel);
	initial
		begin
			$dumpfile("output.vcd");$dumpvars();
			$monitor("in=%b | sel=%b | out=%b",in,sel,out);
			#0 in=16'b1000000000000000; sel=4'b0000;
			#3 in=16'b1000000000000000; sel=4'b0001;
			#3 in=16'b1000000000000000; sel=4'b0010;
			#3 in=16'b1000000000000000; sel=4'b0011;
			#3 in=16'b1000000000000000; sel=4'b0100;
			#3 in=16'b1000000000000000; sel=4'b0101; 
			#3 in=16'b1000000000000000; sel=4'b0110; 
			#3 in=16'b1000000000000000; sel=4'b0111; 
			#3 in=16'b1000000000000000; sel=4'b1000; 
			#3 in=16'b1000000000000000; sel=4'b1001; 
			#3 in=16'b1000000000000000; sel=4'b1010; 
			#3 in=16'b1000000000000000; sel=4'b1011; 
			#3 in=16'b1000000000000000; sel=4'b1100;
			#3 in=16'b1000000000000000; sel=4'b1101;
			#3 in=16'b1000000000000000; sel=4'b1110; 
			#3 in=16'b1000000000000000; sel=4'b1111;
		end
endmodule