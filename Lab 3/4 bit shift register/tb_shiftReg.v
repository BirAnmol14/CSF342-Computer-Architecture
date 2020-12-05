`include "shiftreg.v"
module testbench;
	reg in,EN,CLK;
	wire [0:3]Q;
	shiftReg4bit reg1(in,CLK,EN,Q);
	initial 
	begin 
	CLK=0; 
	end
	always #2 CLK=~CLK; 
	initial $monitor($time," EN=%b in= %b Q=%b\n",EN,in,Q); 
	initial 
	begin 
	in=0;EN=0; 
	#4 in=1;EN=1;
	#4 in=1;EN=1; 
	#4 in=0;EN=0; 
	#5 $finish; 
	end 
endmodule