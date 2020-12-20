module Top(
    input usb_rx,           // USB->Serial input

    input clk,              // 100MHz clock
    input rst_n,            // reset button (active low)

    // input [4:0] io_btn,
    input [15:0]io_dip,     //dip switches

    output usb_tx,          // USB->Serial output
    
    output [7:0] led,       // 8 user controllable LEDs on main board
    output [23:0] io_led,   //LED matrix | 0 = bottom right

    output [6:0] io_seg,
    output [2:0] io_sel,
    output dp
    
    );
    
    wire clk_1Hz, clk_5Hz, clk_10Hz, clk_60Hz, clk_5M;
    wire rst, digsel, ld, qsec;
    wire [3:0] seven_part;
    wire[15:0] countout;
    wire upbtn, dwbtn, UTC, DTC, btnC;
//    wire clear = io_btn[4];
    wire [3:0] io_sel_temp;
    
    assign led = 8'h00;      // turn LEDs off
    assign usb_tx = usb_rx;  // echo the serial data

    // The reset conditioner is used to synchronize the reset signal to the FPGA
    // clock. This ensures the entire FPGA comes out of reset at the same time.
    reset_conditioner reset_conditioner(
                                    .clk(clk),
                                    .in (rst_n),
                                    .out(rst));    
    
    clk_hz slow_me_down(
                        .clk_in     (clk),
                        .res_n      (rst_n),
                        .clk_1Hz    (clk_1Hz),
                        .clk_5Hz    (clk_5Hz),
                        .clk_10Hz   (clk_10Hz),
                        .clk_60Hz   (clk_60Hz),
                        .clk_5M     (clk_5M),
                        .digsel     (digsel)
    );
    
    counter_16bit sixteenbitcount(
                                .clk    (clk_5M),
                                .clear  (rst_n),
                                .up     (clk_1Hz),
                                .dw     (1'b0),
                                .ld     (1'b0),
                                .Din    (io_dip),
                                .q      (countout),
                                .hex_dec(1'b1), //always show hex nums
                                .UTC    (UTC),
                                .DTC    (DTC)
                                );
                                
    seven_seg_sel seven (
                        .clk    (clk_5M), 
                        .en     (digsel),
                        .in_16  (countout), 
                        .clear  (rst_n), 
                        .seg_4  (seven_part), 
                        .sel    (io_sel_temp)
                        );

    assign io_sel = ~io_sel_temp;

    seven_seg sevenseg(
                        .in (seven_part),
                        .out(io_seg)
                        );
    
    assign io_led[15:0] = countout;
    assign io_led[23:16] = {{4{UTC}}, {4{DTC}}};
    
endmodule