`timescale 1ns / 1ps 

module top_sim();
    reg clk;              // 100MHz clock
    reg rst_n;            // reset button (active low)
//    wire [7:0] led;       // 8 user controllable LEDs
//    reg usb_rx;           // USB->Serial reg
    reg up;
    reg dw;
    reg clear;
    reg io_dip;
//    wire usb_tx;          // USB->Serial wire
    wire [6:0] io_seg;
    wire [3:0] io_sel;
    
    au_top UUT (
    .clk(clk), .clear(clear), .up(up), .dw(dw), .io_dip(io_dip), .io_seg(io_seg), .io_sel(io_sel)
    ,.rst_n(rst_n)
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
        rst_n = 1'b1;
        up = 1'b0;
        dw = 1'b0;
        io_dip = 1'b0;
        #2000;
        clear = 1'b0;
        rst_n = 1'b1;
        
        
        #1000;
        up = 1'b1;
        #200;
        up = 1'b0;
        #100;
        up = 1'b1;
        #200;
        up = 1'b0;
        #100;
        up = 1'b1;
        #200;
        up = 1'b0;
        #100;
        up = 1'b1;
        #200;
        up = 1'b0;
        #100;
        up = 1'b1;
        #200;
        up = 1'b0;
        #100;
        up = 1'b1;
        #200;
        up = 1'b0;
        #100;
        end
    


endmodule
    