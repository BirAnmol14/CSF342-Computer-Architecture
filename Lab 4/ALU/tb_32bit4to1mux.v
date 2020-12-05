`include "bit32_4to1mux.v"
module tb_32bit4to1mux;
reg [31:0] INP1, INP2,INP3;
reg [1:0] SEL;
wire [31:0] out;
bit32_4to1mux M1(INP1,INP2,INP3,SEL,out);
initial
begin
$monitor("INP1=%d,INP2=%d,INP3=%d,sel=%b,out=%d",INP1,INP2,INP3,SEL,out);
INP1=32'd1;
INP2=32'd2;
INP3=32'd3;
SEL=2'd0;
#100 SEL=2'd1;
#100 SEL=2'd2;
#100 SEL=2'd3;
#1000 $finish;
end
endmodule