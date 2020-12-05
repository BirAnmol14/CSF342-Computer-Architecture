module sequentialAdder(clk,EN,clrb,ip,sum,cout);
	input clk,EN,ip,clrb;
	output reg sum,cout;
	wire q1,q2,q3,w;
	initial
	begin
		sum=1'b0;
		cout=1'b0;
	end
	shiftReg4bit reg1(sum,clk,EN,q1);
	shiftReg4bit reg2(ip,clk,EN,q2);
	and a1(w,clk,EN);
	async_dff dff(cout,clrb,clk,q3);
	fulladder1bit fa(sum,cout,q1,q2,);
endmodule