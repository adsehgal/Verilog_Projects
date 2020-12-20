`timescale 1ns / 1ps


module counter_4bit(
    input clk,      //clock
    input clear,    //clear counter
    input up,       //count up
    input dw,       //count down
    input hex_dec,  //select between hex and decimal output -> true=hex, false=dec
    input ld,       //load value of Din
    input [3:0] Din,    //value to be loaded
    output [3:0] q, //final output
    output UTC,     //up terminal count -> 9 (decimal) OR F (hex)
    output DTC      ///down terminal count -> 0
    );
    
    reg     [3:0] cnt;

always @ (posedge clk or negedge clear)
begin
    if (~clear)
        cnt <= 4'h0;
    else if(ld)
        cnt <= Din;
    else if (up & (cnt < 4'd9) & ~hex_dec) //count up to 9
        cnt <= cnt + 1;
    else if (up & (cnt < 4'hF) & hex_dec)  //count up to F
        cnt <= cnt + 1;
    else if (dw & (cnt > 4'd0 & cnt <= 4'd9)  & ~hex_dec)   //count down
        cnt <= cnt - 1;
    else if (dw & (cnt > 4'd0 & cnt <= 4'hF)  & hex_dec)    //count down
        cnt <= cnt - 1;
    else if (dw & (cnt == 4'd0) & ~hex_dec) //down roll over - dec
        cnt <= 4'h9;
    else if (dw & (cnt == 4'd0) & hex_dec)  //dow roll over - hex
        cnt <= 4'hF;
    else if (up & (cnt >= 4'd9) & ~hex_dec)  //up limit - dec
        cnt <= 4'h0;
    else if (up & (cnt >= 4'hF) & hex_dec)   //up limit - hex
        cnt <= 4'h0;
    else
        cnt <= cnt;
    
end 

    assign UTC = ((cnt==4'd9) & ~hex_dec) | ((cnt == 4'hF) & hex_dec);
    assign DTC = cnt == 4'd0;
    assign q = cnt;
endmodule
