`timescale 1ns / 1ps

module seven_seg_sel(
    input clk,
    input en,
    input [15:0] in_16,
    input clear,
    output reg [3:0] seg_4,
    output reg [3:0] sel
    );
    
    reg [3:0]sel_temp;
    
    //Anode selector
    always @(posedge clk or negedge clear)begin
        if (~clear)
            sel_temp <= 4'b1000;
        else begin
                    sel_temp[3]<=sel_temp[0];
                    sel_temp[2]<=sel_temp[3];
                    sel_temp[1]<=sel_temp[2];
                    sel_temp[0]<=sel_temp[1];
                    sel <= sel_temp;
         end
    end
    //split 16 bits and select 4 for 7segment display
    always @(*) begin
        case(sel_temp)
            4'b1000 : seg_4 = in_16[15:12];
            4'b0100 : seg_4 = in_16[11:8];
            4'b0010 : seg_4 = in_16[7:4];
            4'b0001 : seg_4 = in_16[3:0];
            default : seg_4 = 4'b0000;
        endcase
    end
 
endmodule
