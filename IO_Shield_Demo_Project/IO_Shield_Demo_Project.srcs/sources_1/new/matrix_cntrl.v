`timescale 1ns / 1ps

module matrix_cntrl(
    input clk,
    input res_n,
    input en,
    output reg [23:0] led
    );
    
    localparam [8:0] ONE    = 9'b000000001;
    localparam [8:0] TWO    = 9'b000000010;
    localparam [8:0] THREE  = 9'b000000100;
    localparam [8:0] FOUR   = 9'b000001000;
    localparam [8:0] FIVE   = 9'b000010000;
    localparam [8:0] SIX    = 9'b000100000;
    localparam [8:0] SEVEN  = 9'b001000000;
    localparam [8:0] EIGHT  = 9'b010000000;
    localparam [8:0] NINE   = 9'b100000000;
    
    reg [8:0] state, next_state;
    
    always @ (posedge clk or negedge res_n)begin
        if(~res_n)begin
            led <= 24'h000000;
            state <= ONE;
        end else if (en) begin
            state <= next_state;
            
            case(state)
                ONE     : led <= {3{ONE}};
                TWO     : led <= {3{TWO}};
                THREE   : led <= {3{THREE}};
                FOUR    : led <= {3{FOUR}};
                FIVE    : led <= {3{FIVE}};
                SIX     : led <= {3{SIX}};
                SEVEN   : led <= {3{SEVEN}};
                EIGHT   : led <= {3{EIGHT}};
                NINE    : led <= {3{NINE}};
                default : led = 24'h000000;
            endcase
            
        end else begin
            led <= led;
            state <= state;
        end
    end
    
    always @ (*)begin
        case(state)
            ONE     : next_state <= TWO;
            TWO     : next_state <= THREE;
            THREE   : next_state <= FOUR;
            FOUR    : next_state <= FIVE;
            FIVE    : next_state <= SIX;
            SIX     : next_state <= SEVEN;
            SEVEN   : next_state <= EIGHT;
            EIGHT   : next_state <= NINE;
            NINE    : next_state <= ONE;
            default : next_state <= ONE;
        endcase
    end
    
endmodule
