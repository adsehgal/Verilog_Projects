`timescale 1ns / 1ps

module LED8_Shifter(
    input clk,
    input qsec,
    input LR,
    input RL,
    input clear,
    output [7:0] led
    );
    
    
    FDRE #(.INIT (1'b1)) FF0 (.C(clk), .CE(qsec), .D((led[1] & RL) | (led[7] & LR) | clear), .Q(led[0]), .R(clear));
    FDRE #(.INIT (1'b0)) FF1 (.C(clk), .CE(qsec), .D((led[2] & RL) | (led[0] & LR)), .Q(led[1]), .R(clear));
    FDRE #(.INIT (1'b0)) FF2 (.C(clk), .CE(qsec), .D((led[3] & RL) | (led[1] & LR)), .Q(led[2]), .R(clear));
    FDRE #(.INIT (1'b0)) FF3 (.C(clk), .CE(qsec), .D((led[4] & RL) | (led[2] & LR)), .Q(led[3]), .R(clear));
    FDRE #(.INIT (1'b0)) FF4 (.C(clk), .CE(qsec), .D((led[5] & RL) | (led[3] & LR)), .Q(led[4]), .R(clear));
    FDRE #(.INIT (1'b0)) FF5 (.C(clk), .CE(qsec), .D((led[6] & RL) | (led[4] & LR)), .Q(led[5]), .R(clear));
    FDRE #(.INIT (1'b0)) FF6 (.C(clk), .CE(qsec), .D((led[7] & RL) | (led[5] & LR)), .Q(led[6]), .R(clear));
    FDRE #(.INIT (1'b0)) FF7 (.C(clk), .CE(qsec), .D((led[0] & RL) | (led[6] & LR)), .Q(led[7]), .R(clear));

endmodule
