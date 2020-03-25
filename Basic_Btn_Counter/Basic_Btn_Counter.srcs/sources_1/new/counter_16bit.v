`timescale 1ns / 1ps


module counter_16bit(
    input clk,      //clock
    input clear,    //clear counter
    input up,       //count up
    input dw,       //count down
    input hex_dec,  //select between hex and decimal output -> true=hex, false=dec
    output [15:0] q, //final output
    output UTC,     //up terminal count -> 9 (decimal) OR F (hex)
    output DTC      ///down terminal count -> 0
    );
    
    wire [3:0] UTC_t, DTC_t;
    
    counter_4bit three_zero (
    .clk(clk), .clear(clear), .up(up), .dw(dw), .hex_dec(hex_dec), .q(q[3:0]), .UTC(UTC_t[0]), .DTC(DTC_t[0])
    );
    counter_4bit seven_four (
    .clk(clk), .clear(clear), .up(up & UTC_t[0]), .dw(dw & DTC_t[0]), .hex_dec(hex_dec), .q(q[7:4]), 
    .UTC(UTC_t[1]), .DTC(DTC_t[1])
    );
    counter_4bit eleven_eight (
    .clk(clk), .clear(clear), .up(up & (&UTC_t[1:0])), .dw(dw & (&DTC_t[1:0])), .hex_dec(hex_dec), .q(q[11:8]), 
    .UTC(UTC_t[2]), .DTC(DTC_t[2])
    );
    counter_4bit fifteen_twelve (
    .clk(clk), .clear(clear), .up(up & (&UTC_t[2:0])), .dw(dw & (&DTC_t[2:0])), .hex_dec(hex_dec), .q(q[15:12]), 
    .UTC(UTC_t[3]), .DTC(DTC_t[3])
    );
    

    assign UTC = &UTC_t;
    assign DTC = &DTC_t;
    
    
endmodule