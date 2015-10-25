module fsm(clock,reset,start, a, b, contBETval, initCount, countVal, ab_result);
input reset, clock, start;
input [3:0] a,b;
input contBETval; //count bigger or equal than val
output reg initCount; //init counter
output reg [2:0] countVal;
output reg [1:0] currentState; //mudaDisplay = currentState
output reg [7:0] ab_result;
reg [1:0] nextState;
reg [7:0] ab;

always @(posedge clock) begin
    if (reset == 1)
        currentState <= 2'b00;
    else
        currentState <= nextState;
end

always @(*) begin
    ab <= {a,b};
    case (currentState)
        2'b00: begin //state 00 wait for start
            initCount <=0;
            if (start==0)
                nextState <= 2'b00;
            else 
                nextState <= 2'b01;
            ab_result <= 8'hFF;
        end
        2'b01: begin //show A and B @ display
            countVal <= 6;
            initCount <= 1;
            ab_result <= ab;
            if (contBETval) begin
                if (a > b)
                    nextState <= 2'b10;
                else
                    nextState <= 2'b11;
            end else
                nextState <= 2'b01;
        end
        2'b10: begin
            countVal <= 3;
            initCount <= 1;
            ab_result <= a - b;
            if (contBETval)
                nextState <= 2'b00;
            else
                nextState <= 2'b10;
        end
        2'b11: begin
            countVal <= 3;
            initCount <= 1;
            //bin to gray
            ab_result <= ab[7:0] ^ {1'b0, ab[7:1]}; //AB XOR AB with MSB preserved
            if (contBETval)
                nextState <= 2'b00;
            else
                nextState <= 2'b11;
        end
    endcase
end
endmodule
