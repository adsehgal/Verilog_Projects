module I2C_Decoder(
    input clk;
    input rst_n;
    input comms_clk;
    input data_in;  

    output reg wait_led;
);

reg [7:0] data_accumulated;

//States:
localparam [3:0] WAIT       =   'h0;
localparam [3:0] START      =   'h1;
localparam [3:0] DATA_IN    =   'h2;
localparam [3:0] STOP       =   'h3;

localparam D_HIGH = 1'b1; //logic high
localparam D_LOW = 1'b0;    //logic low
localparam D_DC = 1'bX; //dont care

reg[3:0] STATE, NEXT_STATE;
reg[4:0] data_count;    //keeps track of how many bits have been recieved
reg data_count_max;

always @(*)begin
    casex({data_count_max, comms_clk, data_in, STATE})
    {D_DC, D_DC, D_HIGH, WAIT} : NEXT_STATE = WAIT; //stay in WAIT until data_in goes low -> start condition
    {D_DC, D_HIGH, D_LOW, WAIT} : NEXT_STATE = START; //go to start state when start condition is met
    {D_LOW, D_LOW, D_DC, START} : NEXT_STATE = DATA_IN; //go to data accumulation state after start
    {D_LOW, D_DC, D_DC, DATA_IN} : NEXT_STATE = DATA_IN;    //stay in data accumulation


    default : NEXT_STATE = WAIT;
    endcase
end


always @(posedge clk or negedge res_n)begin
   
    if (!res_n)begin
        wait_led <= D_HIGH; //reset led to high
        data_accumulated <= 'h00;
        STATE <= WAIT;
        data_count <= 'h0;
    end else begin
        STATE <= NEXT_STATE;
        case (NEXT_STATE)
        WAIT : begin
            
        end
        START : begin
            
        end
        DATA_IN : begin
            
        end
        STOP : begin
            
        end
        default :begin
            
        end
        endcase

    end

end