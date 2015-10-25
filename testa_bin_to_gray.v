`include "bin_to_gray.v"
module main;
reg [7:0] bin;
wire [7:0] gray;
initial begin
    $monitor("bin %b gray %b", bin, gray);
    #1 bin = 8'b01001001;
    #1 bin = 8'b10101010;
end
bin_to_gray U_bin_to_gray(bin, gray);
endmodule
