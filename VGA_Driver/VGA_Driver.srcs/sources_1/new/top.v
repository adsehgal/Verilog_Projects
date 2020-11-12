`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/26/2020 05:07:33 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input clk,
    input res_n,
    output reg [3:0] vgaRed,
    output reg [3:0] vgaGreen,
    output reg [3:0] vgaBlue,
    output hSync,
    output vSync
    );
    wire inDisplay, frame, clk_v;
    wire [15:0] pixelX, pixelY;
    clks slow_clk (
        .clkin(clk), 
        .clk(clk_v), 
        .greset(~res_n)
    );
    driver VGAdriver(
        .clk(clk_v), 
        .res_n(res_n), 
        .pixelX(pixelX), 
        .pixelY(pixelY), 
        .hSync(hSync), 
        .vSync(vSync), 
        .inDisplay(inDisplay), 
        .frame(frame)
    );
    
    always @(posedge clk_v)begin
        if (((pixelX >= 320-10 ) && (pixelX <= 320+10)) && ((pixelY >=240-10) && (pixelY <= 240+10)))begin
            vgaBlue <= 4'hF;
        end
        else begin
            vgaBlue <= 4'h0;
        end
        vgaGreen <= 4'h0;
        vgaRed <= 4'h0;
    end


endmodule
