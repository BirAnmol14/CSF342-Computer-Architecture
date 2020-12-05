module fullAdder(sum,cout,ip1,ip2,cin);
	//1 bit adder
	input ip1,ip2,cin;
	output cout,sum;
	reg cout,sum;
	always@(ip1 or ip2 or cin)
		begin
			if(cin==0)
			begin
				sum= ip1 ^ ip2;
				cout= ip1 & ip2; 
			end
			else
			begin
				sum=~(ip1^ip2);
				cout=(ip1|ip2);
			end
		end
endmodule