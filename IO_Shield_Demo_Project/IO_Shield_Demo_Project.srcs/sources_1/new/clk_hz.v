`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2020 09:45:34 PM
// Design Name: 
// Module Name: clk_hz
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


module clk_hz(
    input clk_in,
    input res_n,
    output reg clk_1Hz,
    output reg clk_5Hz,
    output reg clk_10Hz,
    output reg clk_60Hz,
    output     clk_5M,
    output     digsel
    );
//    wire clk_5M;
        clk_5M gen5Mclk
                    (
                    .resetn (res_n),
                    .clk_in1(clk_in),
                    .clk_5M (clk_5M)
                    );
        
    localparam MHz5 = 31'd5000000;
    localparam Hz1 = 2500000;//MHz5 - (MHz5 >> 22); //produce 0.9Hz actually31'd4999999;
    localparam Hz5 = 500000;//MHz5 - (MHz5 >> 20); //produce 4.5Hz actually31'd0999999;
    localparam Hz10 = 250000;//MHz5 - (MHz5 >> 19); //produce 9Hz actually31'd099998;
    localparam Hz60 = 41666;//MHz5 - (MHz5 >> 16); //produce 76Hz actually //31'd16666;
    reg[31:0] count_1, count_5, count_10, count_60;
    reg digsel_delay;
    
    always @ (posedge clk_5M or negedge res_n)begin
        if(~res_n)begin
            count_1  <= 31'b0;
            count_5  <= 31'b0;
            count_10 <= 31'b0;
            count_60 <= 31'b0;
            clk_1Hz  <= 1'b0;
            clk_5Hz  <= 1'b0;
            clk_10Hz <= 1'b0;
            clk_60Hz <= 1'b0;
        end 
        else begin
            if(count_1 == Hz1)begin
                clk_1Hz <= ~clk_1Hz;
                count_1 <= 0;
            end else
                count_1 <= count_1 + 1;
                
            if(count_5 == Hz5)begin
                clk_5Hz <= ~clk_1Hz;
                count_5 <= 0;
            end else
                count_5 <= count_5 + 1;
            
            if(count_10 == Hz10)begin
                clk_10Hz <= ~clk_10Hz;
                count_10 <= 0;
            end else
                count_10 <= count_10 + 1;
                
            if(count_60 == Hz60)begin
                clk_60Hz <= ~clk_60Hz;
                count_60 <= 0;
            end else
                count_60 <= count_60 + 1;

            digsel_delay <= clk_60Hz;
        end
    end
    assign digsel = clk_60Hz & ~digsel_delay;   //edge detect 60Hz to create digsel
        
endmodule
