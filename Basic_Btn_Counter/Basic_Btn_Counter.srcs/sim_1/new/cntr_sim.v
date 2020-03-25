`timescale 1ns / 1ps 

module cntr_sim();
    reg clk;      //clock
    reg clear;    //clear counter
    reg up;       //count up
    reg dw;       //count down
    reg hex_dec;  //select between hex and decimal output -> true=hex, false=dec
    wire [4:0] q; //final output
    wire  UTC;     //up terminal count -> 9 (decimal) OR F (hex)
    wire  DTC;      ///down terminal count -> 0
    
counter_4bit UUT (
    .clk(clk), .clear(clear), .up(up), .dw(dw), .hex_dec(hex_dec), .q(q), .UTC(UTC), .DTC(DTC)
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
        up = 1'b0;
        dw = 1'b0;
        hex_dec = 1'b0;
        #100;
        clear = 1'b0;
        
        #1000;
        up = 1'b1;
        #300;
        hex_dec = 1'b1;
        #300;
        up = 1'b0;
        dw = 1'b1;
        #300;
        hex_dec = 1'b0;
        
        end
endmodule
         

