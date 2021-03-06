`include "and32bit.v"
module tb32bitand;
reg [31:0] IN1,IN2;
wire [31:0] OUT;
and32bit a1 (IN1,IN2,OUT);
initial
begin
$monitor("out=%b",OUT);
IN1=32'b1010;
IN2=32'b1100;
#100 IN1=32'b0011;
#400 $finish;
end
endmodule