`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2020 03:07:55 PM
// Design Name: 
// Module Name: top_sim
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


module top_sim();

    reg usb_rx;
    reg clk;
    reg rst_n;
    reg [15:0]io_dip;

    wire usb_tx;    
    wire [7:0] led;
    wire [23:0] io_led;
    wire [6:0] io_seg;
    wire [3:0] io_sel;
    
    Top DUT (
            .usb_rx     (usb_rx),
            .clk        (clk),
            .rst_n      (rst_n),
            .io_dip     (io_dip),
            
            .usb_tx     (usb_tx),
            .led        (led),
            .io_led     (io_led),
            .io_seg     (io_seg),
            .io_sel     (io_sel)
    );
    
    initial begin
        rst_n = 1'b0;
        usb_rx = 1'b0;
        clk = 1'b0;
        io_dip = 16'h0000;
        #10;
        rst_n = 1'b1;
        forever begin
            #1 clk = ~clk;
        end
    end

endmodule
