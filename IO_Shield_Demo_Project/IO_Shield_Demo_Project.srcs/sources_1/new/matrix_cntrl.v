`timescale 1ns / 1ps

module matrix_cntrl(
    input clk,
    input res_n,
    input en,
    output reg [23:0] led
    );
    
    //matrix states
    localparam [8:0] ONE        = 9'b000000001;
    localparam [8:0] TWO        = 9'b000000010;
    localparam [8:0] THREE      = 9'b000000100;
    localparam [8:0] FOUR       = 9'b000001000;
    localparam [8:0] FIVE       = 9'b000010000;
    localparam [8:0] SIX        = 9'b000100000;
    localparam [8:0] SEVEN      = 9'b001000000;
    localparam [8:0] EIGHT      = 9'b010000000;
    localparam [8:0] NINE       = 9'b100000000;
    localparam [8:0] TEN        = 9'b100000001;
    localparam [8:0] ELEVEN     = 9'b100000010;
    localparam [8:0] TWELVE     = 9'b100000100;
    localparam [8:0] THIRTEEN   = 9'b100001000;
    localparam [8:0] FOURTEEN   = 9'b100010000;
    localparam [8:0] FIFTEEN    = 9'b100100000;
    localparam [8:0] SIXTEEN    = 9'b101000000;
    localparam [8:0] SEVENTEEN  = 9'b110000000;
    localparam [8:0] EIGHTEEN   = 9'b110000001;
    
    //led patterns
    localparam [23:0] P_ZERO    	= 24'h000000;
    localparam [23:0] P_ONE     	= 24'h000001;
    localparam [23:0] P_TWO     	= 24'h000013;
    localparam [23:0] P_THREE   	= 24'h000137;
    localparam [23:0] P_FOUR    	= 24'h00137F;
    localparam [23:0] P_FIVE    	= 24'h0137FF;
    localparam [23:0] P_SIX     	= 24'h137FFF;
    localparam [23:0] P_SEVEN   	= 24'h37FFFF;
    localparam [23:0] P_EIGHT   	= 24'h7FFFFF;
    localparam [23:0] P_NINE    	= 24'hFFFFFF;
    localparam [23:0] P_TEN     	= 24'hFFFFF7;
    localparam [23:0] P_ELEVEN  	= 24'hFFFF73;
    localparam [23:0] P_TWELVE  	= 24'hFFF731;
    localparam [23:0] P_THIRTEEN	= 24'hFF7310;
    localparam [23:0] P_FOURTEEN	= 24'hF73100;
    localparam [23:0] P_FIFTEEN 	= 24'h731000;
    localparam [23:0] P_SIXTEEN 	= 24'h310000;
    localparam [23:0] P_SEVENTEEN	= 24'h100000;



    reg [8:0] state, next_state;
    
    always @ (posedge clk or negedge res_n)begin
        if(~res_n)begin
            led <= 24'h000000;
            state <= ONE;
        end else if (en) begin
            state <= next_state;
            
            case(state)
                ONE         : led <= P_ONE;
                TWO         : led <= P_TWO;
                THREE       : led <= P_THREE;
                FOUR        : led <= P_FOUR;
                FIVE        : led <= P_FIVE;
                SIX         : led <= P_SIX;
                SEVEN       : led <= P_SEVEN;
                EIGHT       : led <= P_EIGHT;
                NINE        : led <= P_NINE;
                TEN         : led <= P_NINE;
                ELEVEN      : led <= P_TEN;
                TWELVE      : led <= P_ELEVEN;
                THIRTEEN    : led <= P_TWELVE;
                FOURTEEN    : led <= P_THIRTEEN;
                FIFTEEN     : led <= P_FOURTEEN;
                SIXTEEN     : led <= P_FIFTEEN;
                SEVENTEEN   : led <= P_SIXTEEN;
                EIGHTEEN    : led <= P_SEVENTEEN;
                default     : led <= P_ZERO;
            endcase
            
        end else begin
            led     <= led;
            state   <= state;
        end
    end
    
    always @ (*)begin
        case(state)
            ONE         : next_state = TWO;
            TWO         : next_state = THREE;
            THREE       : next_state = FOUR;
            FOUR        : next_state = FIVE;
            FIVE        : next_state = SIX;
            SIX         : next_state = SEVEN;
            SEVEN       : next_state = EIGHT;
            EIGHT       : next_state = NINE;
            NINE        : next_state = TEN;
            TEN         : next_state = ELEVEN;
            ELEVEN      : next_state = TWELVE;
            TWELVE      : next_state = THIRTEEN;
            THIRTEEN    : next_state = FOURTEEN;
            FOURTEEN    : next_state = FIFTEEN;
            FIFTEEN     : next_state = SIXTEEN;
            SIXTEEN     : next_state = SEVENTEEN;
            SEVENTEEN   : next_state = EIGHTEEN;
            default     : next_state = ONE;
        endcase
    end
    
endmodule
