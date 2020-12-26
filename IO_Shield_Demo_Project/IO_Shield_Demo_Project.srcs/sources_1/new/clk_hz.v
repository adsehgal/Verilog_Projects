`timescale 1ns / 1ps


module clk_hz(
    input clk_in,
    input res_n,
    output reg clk_1Hz,
    output reg clk_5Hz,
    output reg clk_10Hz,
    output reg clk_60Hz,
    output reg clk_1K,
    output     clk_5M,
    output 		clk_40M,
    output     refresh,
    output     digsel
    );
//    wire clk_5M;
        clk_5M gen5Mclk
                    (
                    .resetn (res_n),
                    .clk_in1(clk_in),
                    .clk_5M (clk_5M),
                    .clk_40M()
                    );
		clk_108M gen108Mclk
                    (
                    .resetn (res_n),
                    .clk_in1(clk_in),
                    .clk_108M(clk_40M)
                    );
        
    localparam MHz5 = 31'd5000000;
    localparam Hz1 = 2500000;
    localparam Hz5 = 500000;
    localparam Hz10 = 250000;
    localparam Hz60 = 41666;
    localparam Hz1K = 2500;
    
    reg[31:0] count_1, count_5, count_10, count_60, count_1K;
    reg digsel_delay, refresh_delay;
    
    always @ (posedge clk_5M or negedge res_n)begin
        if(~res_n)begin
            count_1  <= 31'b0;
            count_5  <= 31'b0;
            count_10 <= 31'b0;
            count_60 <= 31'b0;
            count_1K <= 31'b0;
            
            clk_1Hz  <= 1'b0;
            clk_5Hz  <= 1'b0;
            clk_10Hz <= 1'b0;
            clk_60Hz <= 1'b0;
            clk_1K <= 1'b0;
            
            digsel_delay <= 1'b0;
            refresh_delay <= 1'b0;
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
                
            if(count_1K == Hz1K)begin
                clk_1K <= ~clk_1K;
                count_1K <= 0;
            end else
                count_1K <= count_1K + 1;

            digsel_delay <= clk_1K;
            refresh_delay <= clk_10Hz;
        end
    end
    assign digsel = clk_1K & ~digsel_delay;   //edge detect 1KHz to create digsel
    assign refresh = clk_10Hz & ~refresh_delay;
        
endmodule
