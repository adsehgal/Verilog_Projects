`timescale 1ns / 1ps


module counter_4bit(
    input clk,      //clock
    input clear,    //clear counter
    input up,       //count up
    input dw,       //count down
    input hex_dec,  //select between hex and decimal output -> true=hex, false=dec
    output [3:0] q, //final output
    output UTC,     //up terminal count -> 9 (decimal) OR F (hex)
    output DTC      ///down terminal count -> 0
    );
    
    reg     [7:0] cnt;

always @ (posedge clk)
begin
    if (clear)
        cnt <= 4'h0;
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
//    else if (cnt > 4'hF)    //abnormal behaviour reset
//        cnt <= 4'h0;
    else
        cnt <= cnt;
    
end 
    //Terminal Count handling
//    if((cnt == 4'd9) & ~hex_dec)
//         UTC <= 1'b1;
         assign UTC = ((cnt==4'd9) & ~hex_dec) | ((cnt == 4'hF) & hex_dec);
//    else if ((cnt == 4'hF) & hex_dec)
//        UTC <= 1'b1;
//    else
//        UTC <= 1'b0;
        assign DTC = cnt == 4'd0;
//    if(cnt == 0)
//        DTC <= 1'b1;
//    else
//        DTC <= 1'b0;
    
    assign q = cnt;
endmodule
