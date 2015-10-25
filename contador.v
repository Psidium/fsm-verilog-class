module contador(reset, max_number, clock, bigger_than_max);
input reset;
input [2:0] max_number;
input clock;
output reg bigger_than_max;
reg [2:0] count;
initial begin
    count = 0;
    `ifdef DEBUG
        $display("contador.v:10: start count with 0");
    `endif
end
//sempre que count trocar de valor
always @ (count) begin
    bigger_than_max <= (count >= max_number);
    `ifdef DEBUG
        $display("contador.v:17: count changed, bigger_than_max: %b", bigger_than_max);
    `endif
end
always @ (max_number) begin//when max_number changes, reset the counter
    count <= 0;
    `ifdef DEBUG
        $display("contador.v:23: max_number changed, count %d", count);
    `endif
end
always @ (posedge clock) begin
    if (reset) begin
        count <= 0;
        `ifdef DEBUG
            $display("contador.v:30: reset set");
        `endif
    end else begin
        count <= count + 1;
        `ifdef DEBUG
            $display("contador.v:30: update count: %d", count);
        `endif
    end
end
endmodule
