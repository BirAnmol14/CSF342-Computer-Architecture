`include "mag.v"
module testbench;
	reg [3:0] a,b;
	wire opg,ope,opl;
	magnitudeComp4bit b1(opg,ope,opl,a,b);
	initial
		begin
			$dumpfile("output.vcd"); $dumpvars;
			$monitor(,$time," a=%b, b=%b,between a and b: equal=%b,less=%b,greater=%b",a,b,ope,opl,opg);
			#0 a=4'b0000;b=4'b0101;
			#5 a=4'b0001;
			#10 a=4'b0010;
			#15 a=4'b0011;
			#20 a=4'b0100;
			#25 a=4'b0101;
			#30 a=4'b0110;
			#35 a=4'b0111;
			#40 a=4'b1000;
			#45 a=4'b1001;
			#50 $finish;
		end
endmodule