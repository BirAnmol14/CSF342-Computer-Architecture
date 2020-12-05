`include "mux4_1.v"
module testbench;
	reg [3:0] ip;
	reg [1:0] select;
	wire op;
	mux4_1 m1(op,ip,select);
	initial
		begin
			$dumpfile("mux4_1.vcd"); $dumpvars;
			$monitor(,$time," op =%b, select: %b, input: %b",op,select,ip);
			#0 ip=4'b0000;select=2'b00;
			#1 select=2'b01;
			#1 select=2'b10;
			#1 select=2'b11; 
			#5 ip=4'b0001;select=2'b00;
			#1 select=2'b01;
			#1 select=2'b10;
			#1 select=2'b11; 
			#5 ip=4'b0010;select=2'b00;
			#1 select=2'b01;
			#1 select=2'b10;
			#1 select=2'b11; 
		end
endmodule