module au_top(
    input clk,              // 100MHz clock
    input rst_n,            // reset button (active low)
    output [7:0] led,       // 8 user controllable LEDs
    input usb_rx,           // USB->Serial input
    input [4:0] io_btn,
    input io_dip,
    output usb_tx,          // USB->Serial output
    output [6:0] io_seg,
    output [3:0] io_sel,
    output dp
    );
    
    wire rst, r_clk, digsel;
    wire [3:0] seven_part;
    wire[15:0] countout;
    wire upbtn, dwbtn, UTC, DTC;
    wire clear = io_btn[4];
    
    // The reset conditioner is used to synchronize the reset signal to the FPGA
    // clock. This ensures the entire FPGA comes out of reset at the same time.
    reset_conditioner_1 reset_conditioner(.clk(r_clk), .in(!rst_n), .out(rst));    
    assign led = 8'h00;      // turn LEDs off
    assign usb_tx = usb_rx;  // echo the serial data
    
    //My Code Starts Here
    Edge_Detector ED1 (.clk(r_clk), .btn(io_btn[0]), .Edet(upbtn));
    Edge_Detector ED2 (.clk(r_clk), .btn(io_btn[2]), .Edet(dwbtn));
    
    
    wire up = upbtn | (io_btn[1] & ~UTC);
    counter_16bit sixteenbitcount(.clk(r_clk), .clear(clear), .up(up), .dw(dwbtn), 
                                  .q(countout), .hex_dec(io_dip), .UTC(UTC), .DTC(DTC));
    seven_seg_sel seven (.clk(digsel), .in_16(countout), .clear(clear), .seg_4(seven_part), .sel(io_sel));
    seven_seg sevenseg(.in(seven_part), .out(io_seg));
//    assign io_sel = 4'b1110;

    clk_slow clks (.clkin(clk), .greset(~rst_n), .clk(r_clk), .digsel(digsel));
//    assign dp = ~((UTC & ~io_sel[3]) | (DTC & ~io_sel[0]));
    
endmodule