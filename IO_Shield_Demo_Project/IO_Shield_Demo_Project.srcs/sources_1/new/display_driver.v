`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Aditya Sehgal
// 
// Create Date: 07/11/2020 05:27:44 PM
// Module Name: driver
// Project Name: VGA Driver
// Target Devices: Artix-7 XC735AT
// Tool Versions: 
// Description: Simple driver designed to drive 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module driver(
    input clk,              //input a 25MHz clock
    input res_n,            //input a negative reset signal
    output reg [15:0] pixelX,
    output reg [15:0] pixelY,
    output reg hSync,       //output high when max X coordinate is reached
    output reg vSync,       //output high when max Y coordinate is reached
    output reg inDisplay,   //output high when colors can be shown
    output reg frame        //output high every frame
    );

    //counting pixels
    parameter   maxX = 16'd800,         //maximum value of X coordinate 
                maxY = 16'd525;         //maximum value of Y coordinate
    
    parameter   activeX = 16'd640,      //horizontal active region 
                frontPorchX = 16'd16,   //horizontal front porch
                syncX = 16'd96,         //horizontal sync pulse
                backPorchX = 16'd48;    //horizontal back porch

    parameter   activeY = 16'd480,      //veritcal active region 
                frontPorchY = 16'd10,   //vertical front porch
                syncY = 16'd2,          //vertical sync pulse
                backPorchY = 16'd33;    //vertical back porch

//    reg [15:0]pixelX, pixelY;           //16-bit reg's to store X and Y values

    always @(posedge clk)begin
        if (!res_n)begin
            pixelX  <=  16'd0;
            pixelY  <=  16'd0;
            frame   <=  1'b0;
        end
        if ((pixelX < maxX) && res_n)
            pixelX  <=  pixelX + 1'b1;    //increment x-counter
        else begin
            pixelX  <=  16'd0;    //reset x-counter at 799 pixels;
            pixelY  <=  pixelX + 1'b1;    //increment Y when X resets
        end

        frame   <= 1'b0;

        if ((pixelY >= maxY) || !res_n)
            frame   <=  1'b1;
            pixelY  <=  16'd0;
    end

    //assign active region where colors can be displayed
    always @(posedge clk)begin
        if ((pixelX < activeX) && (pixelY < activeY))
            inDisplay   <=  1'b1;
        else
            inDisplay   <=  1'b0;
    end

    //assign hSync and vSync
    always @(posedge clk)begin
        if (!res_n)begin
            hSync   <=  1'b0;
            vSync   <=  1'b0;
        end else begin
            hSync   <=  (pixelX > (activeX + frontPorchX)) && (pixelX < (activeX + frontPorchX + backPorchX));
            vSync   <=  (pixelY > (activeY + frontPorchY)) && (pixelY < (activeY + frontPorchY + backPorchY)); 
        end
    end

    
endmodule
