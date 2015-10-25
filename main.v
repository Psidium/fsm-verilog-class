//`define DEBUG
`include "contador.v"
`include "fsmGB.v"
module main;
reg signed [3:0] a,b;
wire signed [7:0] ab_result;
reg clock, reset, start;
wire initCount, bigger_than_max;
wire [2:0] val;
initial begin
    clock<= 0;
    reset <=0;
    start<=0;
    a<=0;
    b<=0;
    $display("time\t clock   a       b         result");
    $monitor("%g\t %d  %d %b    %d %b    %b %d", $time, clock, a,a,b,b, ab_result,ab_result);
    #5 a <= 4;
    b <= 3;
    start <=1;
    #5 start <=0;
    #30;
    a <= -3;
    b <= 5;
    start <= 1;
    #5 start <= 0;
    #30 $finish;
end

always @(*)
    #1 clock <= ~clock;

contador U_contador(
    .reset(!initCount),
    .max_number(val),
    .clock(clock),
    .bigger_than_max(bigger_than_max)
);

fsm U_fsm(
    .clock(clock),
    .reset(reset),
    .start(start),
    .a(a),
    .b(b),
    .contBETval(bigger_than_max),
    .initCount(initCount),
    .countVal(val),
    .ab_result(ab_result)
);

endmodule
