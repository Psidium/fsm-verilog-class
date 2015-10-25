`include "decrement.v"
module main;
reg signed [3:0] a, b;
wire signed [3:0] out;
wire carry;
initial begin
    $monitor("a(%d): %b b(%d): %b out(%d): %b gray: %b", a,a,b,b,out,out,carry);
    #1 a <= -2;
    b <= -1;
    #1 a <=3;
    b<=2;
    #1 a <=3;
    b<=0;
    #1 a <= 7;
    b <= -2;
end
decrement U_decrement(a,b,out,carry);
endmodule
