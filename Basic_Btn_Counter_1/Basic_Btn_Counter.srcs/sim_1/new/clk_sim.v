`timescale 1ns / 1ps 

module clk_sim();
    reg clk;
    reg clear;
    wire clk_50M;
    wire clk_25M;
    wire clk_1M;
    wire clk_60Hz;
    
    clk_slow UUT (
    .clk(clk), .clear(clear), .clk_50M(clk_50M), .clk_25M(clk_25M), .clk_1M(clk_1M), .clk_60Hz(clk_60Hz)
    );
    
    parameter PERIOD = 10;
    parameter real DUTY_CYCLE = 0.5; parameter OFFSET = 2;
           initial    // Clock process for clkin
           begin
    #OFFSET
    clk = 1'b1;
       forever
       begin
            #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = ~clk; 
       end
    end
    
    initial
        begin
        
        clear = 1'b1;
        #100;
        clear = 1'b0;
        end
        
endmodule