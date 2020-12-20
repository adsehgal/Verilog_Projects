`timescale 1ns / 1ps

module hz_clk_sim;

    reg clk_in;
    reg res_n;
    wire clk_1Hz;
    wire clk_5Hz;
    wire clk_10Hz;
    wire clk_60Hz;
    wire digsel;
    
    clk_hz DUT (
                .clk_in(clk_in),
                .res_n(res_n),
                .clk_1Hz(clk_1Hz),
                .clk_5Hz(clk_5Hz),
                .clk_10Hz(clk_10Hz),
                .clk_60Hz(clk_60Hz),
                .digsel(digsel)
                );
                
    initial begin
        res_n <= 1'b0;
        clk_in <= 1'b0;
        #10;
        res_n <= 1'b1;
        forever begin
            #1 clk_in <= ~clk_in;
        end
    end
endmodule