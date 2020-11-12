`timescale 1ns / 1ps

module matrix_decode_8x8(
    input [63:0] led_num,
    input rst_others,
    input res_n,
    output reg [7:0] col,
    output reg [7:0] row
    );
    always @ (*)begin
        if (!res_n)begin
            col = 8'hFF;
            row = 8'h00;
        end else begin
            if(led_num[0]) begin
                if(rst_others)begin
                    col = 8'hFF;   
                    row = 8'h00;   
                end
                col[0] = 1'b0;     
                row[0] = 1'b1;     
            end
            
            if(led_num[1]) begin   
                if(rst_others)begin
                    col = 8'hFF;   
                    row = 8'h00;   
                end
                col[1] = 1'b0;
                row[0] = 1'b1;
            end
            
            if(led_num[2]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[2] = 1'b0;
                row[0] = 1'b1;
            end
            
            if(led_num[3]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[3] = 1'b0;
                row[0] = 1'b1;
            end
            
            if(led_num[4]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[4] = 1'b0;
                row[0] = 1'b1;
            end
            
            if(led_num[5]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[5] = 1'b0;
                row[0] = 1'b1;
            end
            
            if(led_num[6]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[6] = 1'b0;
                row[0] = 1'b1;
            end
            
            if(led_num[7]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[7] = 1'b0;
                row[0] = 1'b1;
            end
            
            if(led_num[8]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[0] = 1'b0;
                row[1] = 1'b1;
            end
            
            if(led_num[9]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[1] = 1'b0;
                row[1] = 1'b1;
            end
            
            if(led_num[10]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[2] = 1'b0;
                row[1] = 1'b1;
            end
            
            if(led_num[11]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[3] = 1'b0;
                row[1] = 1'b1;
            end
            
            if(led_num[12]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[4] = 1'b0;
                row[1] = 1'b1;
            end
            
            if(led_num[13]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[5] = 1'b0;
                row[1] = 1'b1;
            end
            
            if(led_num[14]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[6] = 1'b0;
                row[1] = 1'b1;
            end
            
            if(led_num[15]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[7] = 1'b0;
                row[1] = 1'b1;
            end
            
            if(led_num[16]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[0] = 1'b0;
                row[2] = 1'b1;
            end
            
            if(led_num[17]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[1] = 1'b0;
                row[2] = 1'b1;
            end
            
            if(led_num[18]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[2] = 1'b0;
                row[2] = 1'b1;
            end
            
            if(led_num[19]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[3] = 1'b0;
                row[2] = 1'b1;
            end
            
            if(led_num[20]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[4] = 1'b0;
                row[2] = 1'b1;
            end
            
            if(led_num[21]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[5] = 1'b0;
                row[2] = 1'b1;
            end
            
            if(led_num[22]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[6] = 1'b0;
                row[2] = 1'b1;
            end
            
            if(led_num[23]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[7] = 1'b0;
                row[2] = 1'b1;
            end
            
            if(led_num[24]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[0] = 1'b0;
                row[3] = 1'b1;
            end
            
            if(led_num[25]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[1] = 1'b0;
                row[3] = 1'b1;
            end
            
            if(led_num[26]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[2] = 1'b0;
                row[3] = 1'b1;
            end
            
            if(led_num[27]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[3] = 1'b0;
                row[3] = 1'b1;
            end
            
            if(led_num[28]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[4] = 1'b0;
                row[3] = 1'b1;
            end
            
            if(led_num[29]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[5] = 1'b0;
                row[3] = 1'b1;
            end
            
            if(led_num[30]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[6] = 1'b0;
                row[3] = 1'b1;
            end
            
            if(led_num[31]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[7] = 1'b0;
                row[3] = 1'b1;
            end
            
            if(led_num[32]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[0] = 1'b0;
                row[4] = 1'b1;
            end
            
            if(led_num[33]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[1] = 1'b0;
                row[4] = 1'b1;
            end
            
            if(led_num[34]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[2] = 1'b0;
                row[4] = 1'b1;
            end
            
            if(led_num[35]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[3] = 1'b0;
                row[4] = 1'b1;
            end
            
            if(led_num[36]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[4] = 1'b0;
                row[4] = 1'b1;
            end
            
            if(led_num[37]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[5] = 1'b0;
                row[4] = 1'b1;
            end
            
            if(led_num[38]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[6] = 1'b0;
                row[4] = 1'b1;
            end
            
            if(led_num[39]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[7] = 1'b0;
                row[4] = 1'b1;
            end
            
            if(led_num[40]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[0] = 1'b0;
                row[5] = 1'b1;
            end
            
            if(led_num[41]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[1] = 1'b0;
                row[5] = 1'b1;
            end
            
            if(led_num[42]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[2] = 1'b0;
                row[5] = 1'b1;
            end
            
            if(led_num[43]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[3] = 1'b0;
                row[5] = 1'b1;
            end
            
            if(led_num[44]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[4] = 1'b0;
                row[5] = 1'b1;
            end
            
            if(led_num[45]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[5] = 1'b0;
                row[5] = 1'b1;
            end
            
            if(led_num[46]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[6] = 1'b0;
                row[5] = 1'b1;
            end
            
            if(led_num[47]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[7] = 1'b0;
                row[5] = 1'b1;
            end
            
            if(led_num[48]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[0] = 1'b0;
                row[6] = 1'b1;
            end
            
            if(led_num[49]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[1] = 1'b0;
                row[6] = 1'b1;
            end
            
            if(led_num[50]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[2] = 1'b0;
                row[6] = 1'b1;
            end
            
            if(led_num[51]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[3] = 1'b0;
                row[6] = 1'b1;
            end
            
            if(led_num[52]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[4] = 1'b0;
                row[6] = 1'b1;
            end
            
            if(led_num[53]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[5] = 1'b0;
                row[6] = 1'b1;
            end
            
            if(led_num[54]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[6] = 1'b0;
                row[6] = 1'b1;
            end
            
            if(led_num[55]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[7] = 1'b0;
                row[6] = 1'b1;
            end
            
            if(led_num[56]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[0] = 1'b0;
                row[7] = 1'b1;
            end
            
            if(led_num[57]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[1] = 1'b0;
                row[7] = 1'b1;
            end
            
            if(led_num[58]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[2] = 1'b0;
                row[7] = 1'b1;
            end
            
            if(led_num[59]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[3] = 1'b0;
                row[7] = 1'b1;
            end
            
            if(led_num[60]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[4] = 1'b0;
                row[7] = 1'b1;
            end
            
            if(led_num[61]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[5] = 1'b0;
                row[7] = 1'b1;
            end
            
            if(led_num[62]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[6] = 1'b0;
                row[7] = 1'b1;
            end
            
            if(led_num[63]) begin
                if(rst_others)begin
                    col = 8'hFF;
                    row = 8'h00;
                end
                col[7] = 1'b0;
                row[7] = 1'b1;
            end
        end
    end
endmodule
