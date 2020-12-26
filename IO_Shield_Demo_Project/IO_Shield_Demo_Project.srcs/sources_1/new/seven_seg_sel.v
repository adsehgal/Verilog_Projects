`timescale 1ns / 1ps

module seven_seg_sel(
    input clk,
    input en,
    input [11:0] in_16,
    input clear,
    output reg [3:0] seg_4,
    output reg [2:0] sel
    );
    
    reg [2:0]sel_temp;
    
    //Anode selector
    always @(posedge clk or negedge clear)begin
        if (~clear)begin
            sel_temp <= 3'b001;
            sel <= 3'b001;
        end
        else if (en) begin
            sel_temp[1]<=sel_temp[0];
            sel_temp[2]<=sel_temp[1];
            sel_temp[0]<=sel_temp[2];
            sel <= sel_temp;
         end
         else begin
            sel <= sel;
         end
    end
    //split 16 bits and select 4 for 7segment display
    always @(*) begin
        case({clear, sel})
            4'b1_100 : seg_4 = in_16[11:8];
            4'b1_010 : seg_4 = in_16[7:4];
            4'b1_001 : seg_4 = in_16[3:0];
            default : seg_4 = 4'b0000;
        endcase
    end
 
endmodule
