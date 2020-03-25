`timescale 1ns / 1ps


module counter_4bit(
    input clk,
    input clear,
    input up,
    input dw,
    output [4:0] q,
    output UTC
    );
    
    reg     [7:0] cnt;

always @ (posedge clk)
begin
    if (clear)
        cnt <= 4'h0;
    else if (up & (cnt <= 4'd9))
        cnt <= cnt + 1;
    else if (dw & (cnt > 4'd0 & cnt <= 4'd9))
        cnt <= cnt - 1;
    else if (dw & (cnt == 4'd0))
        cnt <= 4'h9;
    else if (up & (cnt > 4'd9))
        cnt <= 4'h0;
    else if (cnt > 4'd9)
        cnt <= 4'h0;
    else
        cnt <= cnt;
end 
assign q = cnt;
endmodule
