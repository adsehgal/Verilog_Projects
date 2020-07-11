`timescale 1ns / 1ps

module top_sim();
    reg clk;
    reg res_n;
    reg usb_rx;
    wire usb_tx;
    wire [7:0] led;
    wire [7:0] row;
    wire [7:0] col;
    
    Matrix DUT  (.clk(clk), .res_n(res_n), .usb_rx(usb_rx), 
                .usb_tx(usb_tx), .led(led), .row(row), .col(col));
    
    initial begin
        clk = 1'b0;
        forever begin
            #5 clk = ~clk;
        end
    end
    
    initial begin
        res_n = 1'b0;
        usb_rx = 1'b0;
        
        #100;
        res_n = 1'b1;
        
    end
    
endmodule
