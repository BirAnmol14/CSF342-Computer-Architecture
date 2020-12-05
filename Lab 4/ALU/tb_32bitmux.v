`include "32bitmux.v"
module tb_32bit2to1mux;
reg [31:0] INP1, INP2;
reg SEL;
wire [31:0] out;
bit32_2to1mux M1(INP1,INP2,out,SEL);
initial
begin
$monitor("out=%b, sel=%b",out,SEL);
INP1=32'b10101010;
INP2=32'b01010101;
SEL=1'b0;
#100 SEL=1'b1;
#1000 $finish;
end
endmodule