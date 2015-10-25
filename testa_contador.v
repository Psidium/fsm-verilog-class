`include "contador.v"
module main;
reg reset, clock;
reg [2:0] max_number;
wire [2:0] count;
wire bigger_than_max;
initial begin
    $display("time\t clk reset max_number count bigger_than_max");
    $monitor("%g\t %b   %b   %b     %b  %b", $time, clock, reset, max_number, count, bigger_than_max);
    clock=1;
    reset=0;
    max_number = 6;
    #30;
    reset=1;
    #3;
    reset=0;
    #15;
    $finish;
end
    //clock generator
always begin
    #2 clock = ~clock;
end

contador U_contador(reset, max_number, clock, count, bigger_than_max);

endmodule
