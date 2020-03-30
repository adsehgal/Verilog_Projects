module au_top(
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
    reset_conditioner_1 reset_conditioner(.clk(r_clk), .in(!rst_n), .out(rst));    
    assign led = 8'h00;      // turn LEDs off
    assign usb_tx = usb_rx;  // echo the serial data
    
    //My Code Starts Here
    Edge_Detector ED1 (.clk(r_clk), .btn(io_btn[0]), .Edet(upbtn)); //Sync and edge detect up button
    Edge_Detector ED2 (.clk(r_clk), .btn(io_btn[2]), .Edet(dwbtn)); //Sync and edge detect down button
    Edge_Detector ED3 (.clk(r_clk), .btn(io_btn[3]), .Edet(ld));    //Sync and edge detect load button
    FDRE #(.INIT(1'b0)) cont_sync (.C(r_clk), .D(io_btn[1]), .R(1'b0), .CE(1'b1), .Q(btnC));    //Sync continuous count button
    FDRE #(.INIT(1'b0)) Din_sync[23:0] (.C({24{r_clk}}), .D(io_dip), .R(24'b0), .CE({24{1'b1}}), .Q(dip));  //Sync dip switches
    
    wire up = upbtn | (btnC & ~UTC);    //Stop counter at FFFF (in hex mode) or 9999 (in dec mode)
    
    //Instance of 16 bit counter
    //clear = reset
    //ld = load value of dip switches
    //hex_dec = mode select
        //hex_dec = 0 -> count in hex
        //hex_dec = 1 -> count in decimal
    //UTC -> high at FFFF (in hex) and 9999 (in dec)
    //DTC -> high at 0000
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