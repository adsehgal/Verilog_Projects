`timescale 1ns / 1ps

module Matrix(
    input clk,
    input res_n,
    input usb_rx,
    output usb_tx,
    output reg [7:0] led,
    output  [7:0] row,
    output [7:0] col
    );
    wire clk_s, digsel, qsec;
    reg reset, clk_ss, clk_sss;
    reg [8:0]col_temp, row_temp;
    
    reg[63:0] i;
    integer j;
        
    clk_hz clk_gen(
       .clk_in(clk),
       .res_n(res_n),
       .clk_10Hz(clk_s)
        );
    matrix_decode_8x8 decode (
        .led_num(i), 
        .res_n(res_n),
        .rst_others(1'b1),
        .col(col), 
        .row(row)
        );
    
    always @ (posedge clk_s /*or negedge res_n*/)begin
        if(!res_n | reset)begin
            i <= 0;
        end else begin
            i <={i,1'b1};
        end
        if(&i)begin
            reset <= 1'b1;
        end else begin
            reset <= 1'b0;
        end
    end

//    always @ (posedge clk_s or negedge res_n or posedge reset) begin
//        if(!res_n | reset)begin
//            col_temp <= 'h1FF;
//            row_temp <= 'h001;
//            i <= 1'b0;
//            j <= 1'b0;
//            reset <= 1'b0;
//        end else begin
//            col_temp <= col_temp << 1'b1;
//            row_temp <= {row_temp, 1'b1};
//        if(col_temp == 0)
//            reset <= 1'b1;
//        else
//            reset <= 1'b0;
//        end        
//    end
    
//    assign usb_tx = usb_rx;
//    assign col = col_temp[8:1];
//    assign row = row_temp[8:1];
endmodule
