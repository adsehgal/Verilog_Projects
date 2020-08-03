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
    output reg clk_10Hz
    );
    wire clk_5M;
    clk_wiz_0 generate_clks (
        .clk_5M(clk_5M),     
        .resetn(res_n),
        .locked(),     
        .clk_in1(clk_in));
        
    localparam Hz1 = 'd4999999;
    localparam Hz5 = 'd0999999;
    localparam Hz10 = 'd099998;
    integer count_1, count_5, count_10;
    
    always @ (posedge clk_5M)begin
        if(!res_n)begin
            count_1 <= 0;
            count_5 <= 0;
            count_10 <= 0;
            clk_1Hz <= 0;
            clk_5Hz <= 0;
            clk_10Hz <= 0;
        end else begin
            count_1 <= count_1 + 1;
            count_5 <= count_5 + 1;
            count_10 <= count_10 + 1;
            if(count_1 == Hz1)begin
                clk_1Hz <= ~clk_1Hz;
                count_1 <= 0;
            end
            if(count_5 == Hz5)begin
                clk_5Hz <= ~clk_1Hz;
                count_5 <= 0;
            end
            if(count_10 == Hz10)begin
                clk_10Hz <= ~clk_10Hz;
                count_10 <= 0;
            end
        end
    end
        
endmodule
