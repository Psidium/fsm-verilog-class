`include "contador.v"
`include "fsmGB.v"
module main;
reg [3:0] a,b;
wire [7:0] ab_result;
reg clock, reset;
wire initCount, bigger_than_max, start;
wire [2:0] val;
initial begin
    clock<= 0;
    reset <=0;
    a<=0;
    b<=0;
    $display("clock   a       b     result");
    $monitor(" %d   %d %b    %d %b    %b %d", $time, a,a,b,b, ab_result,ab_result);

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
