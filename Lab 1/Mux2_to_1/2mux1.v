module mux2_1(f,a,b,s);
	input a,b,s;
	output f;
	//assign f=((a&~s)|(b&s));
	assign f=s?b:a;
endmodule