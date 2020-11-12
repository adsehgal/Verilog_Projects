module Top(
    input clk,              // 100MHz clock
    input rst_n,            // reset button (active low)
    output [7:0] led,       // 8 user controllable LEDs
    input usb_rx,           // USB->Serial input
    input [4:0] io_btn,
    input [23:0]io_dip,
    output usb_tx,          // USB->Serial output
    output [6:0] io_seg,
    output [3:0] io_sel,
    output [23:0] io_led
    );
    
    wire rst, r_clk, digsel, ld, qsec;
    wire [3:0] seven_part;
    wire[15:0] countout;
    wire upbtn, dwbtn, UTC, DTC, btnC;
    wire clear = io_btn[4];
    wire [3:0] io_sel_temp;
    wire [23:0] dip;
    
    // The reset conditioner is used to synchronize the reset signal to the FPGA
    // clock. This ensures the entire FPGA comes out of reset at the same time.
    reset_conditioner reset_conditioner(.clk(r_clk), .in(!rst_n), .out(rst));    
    assign led = 8'h00;      // turn LEDs off
    assign usb_tx = usb_rx;  // echo the serial data
    
    counter_16bit sixteenbitcount(.clk(r_clk), .clear(clear), .up(up), .dw(dwbtn), 
                                  .ld(ld), .Din(dip[15:0]),.q(countout), 
                                  .hex_dec(dip[23]), .UTC(UTC), .DTC(DTC));
    seven_seg_sel seven (.clk(digsel), .in_16(countout), .clear(clear), .seg_4(seven_part), .sel(io_sel_temp));
    assign io_sel = ~io_sel_temp;
    seven_seg sevenseg(.in(seven_part), .out(io_seg));

    clk_slow clks (.clkin(clk), .greset(~rst_n), .clk(r_clk), .digsel(digsel), .qsec(qsec));
    
    assign io_led[15:0] = countout;
    assign io_led[23:16] = {{4{UTC}}, {4{DTC}}};
    
endmodule