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
    input clk,
    input res_n,
    output Hsync,
    output Vsync,
    output [3:0] vgaRed,
    output [3:0] vgaBlue,
    output [3:0] vgaGreen,
    output Frame
    );
    
    always @(posedge clk or negedge res_n)begin
    end
    
endmodule
