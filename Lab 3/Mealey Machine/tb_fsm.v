`include "fsm_mealey.v"
module testbench;
reg clk, rst, inp;
wire outp;
reg[0:16] sequence;
integer i;
mealy_pattern mp(inp,clk,rst,outp);
initial
begin
clk = 0;
rst = 1;
sequence = 17'b01_10110_1010_10110_0;
#5 rst = 0;
for( i = 0; i <= 16; i = i + 1)
begin
inp = sequence[i];
#2 clk = 1;
#2 clk = 0;
$display("State = ", mp.state, " Input = ", inp, ", Output = ", outp);
end
testing;
end
task testing;
for( i = 0; i <= 16; i = i + 1)
begin
inp = $random % 2;
#2 clk = 1;
#2 clk = 0;
$display("State = ", mp.state, " Input = ", inp, ", Output = ", outp);
end
endtask
endmodule