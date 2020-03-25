module au_top(
    input clk,              // 100MHz clock
    input rst_n,            // reset button (active low)
    output [7:0] led,       // 8 user controllable LEDs
    input usb_rx,           // USB->Serial input
    input up,
    input dw,
    input clear,
    input io_dip,
    output usb_tx,          // USB->Serial output
    output [6:0] io_seg,
    output [3:0] io_sel
    );
    
    wire rst;
    
    // The reset conditioner is used to synchronize the reset signal to the FPGA
    // clock. This ensures the entire FPGA comes out of reset at the same time.
    reset_conditioner_1 reset_conditioner(.clk(clk), .in(!rst_n), .out(rst));
    wire upbtn, dwbtn;

    
    assign led = 8'h00;      // turn LEDs off

    assign usb_tx = usb_rx;  // echo the serial data
    
    //My Code Starts Here
    Edge_Detector(.clk(clk), .btn(up), .Edet(upbtn));
    Edge_Detector(.clk(clk), .btn(dw), .Edet(dwbtn));
    reg [3:0] count;
    wire[3:0] countout;

    counter_4bit fourbtcount(.clk(clk), .clear(clear), .up(upbtn), .dw(dwbtn), .q(countout), .hex_dec(io_dip));
    seven_seg sevenseg(.in(countout), .out(io_seg));
    assign io_sel = 4'b1110;
    
endmodule