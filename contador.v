module contador(reset, max_number, clock, bigger_than_max);
input reset;
input [2:0] max_number;
input clock;
output reg bigger_than_max;
reg [2:0] count;
initial count = 0;
//sempre que count trocar de valor
always @ (count) begin
    bigger_than_max <= (count >= max_number);
end
always @ (max_number) //when max_number changes, reset the counter
    count <= 0;
always @ (posedge clock) begin
    if (reset) begin
        count <= 0;
    end else begin
        count <= count + 1;
    end
end
endmodule
