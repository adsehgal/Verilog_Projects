module seven_seg(in, out);
    input [3:0] in;
    output [6:0] out;


reg [6:0] out;
always@(in)
begin
case (in)
//    0: out = ~7'b1111110;
//    7'h1: out = ~7'b0110000;
//    7'h2: out = ~7'b1101101;
//    7'h3: out = ~7'b1111001;
//    7'h4: out = ~7'b0110011;
//    7'h5: out = ~7'b1011011;
//    7'h6: out = ~7'b0011111;
//    7'h7: out = ~7'b1110000;
//    7'h8: out = ~7'b1111111;
//    7'h9: out = ~7'b1110011;
//    7'hA: out = ~7'b0001000;
//    7'hB: out = ~7'b1100000;
//    7'hC: out = ~7'b0110001;
//    7'hD: out = ~7'b1000010;
//    7'hE: out = ~7'b0110000;
//    7'hF: out = ~7'b0111000;

    0: out = ~7'b0111111;
    1: out = ~7'b0000110;
    2: out = ~7'b1011011;
    3: out = ~7'b1001111;
    4: out = ~7'b1100110;
    5: out = ~7'b1101101;
    6: out = ~7'b1111101;
    7: out = ~7'b0000111;
    8: out = ~7'b1111111;
    9: out = ~7'b1100111;
    10: out = 7'b0001000;
    11: out = 7'b0000011;
    12: out = 7'b1000110;
    13: out = 7'b0100001;
    14: out = 7'b0000110;
    15: out = 7'b0001110;
    default : out = 7'b1111111;
    endcase
    end
endmodule