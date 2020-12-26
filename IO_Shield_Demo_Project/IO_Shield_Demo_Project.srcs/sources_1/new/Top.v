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
    output dp,

    output [3:0] hdmi_red,  
    output [3:0] hdmi_green,
    output [3:0] hdmi_blue, 
    output hdmi_vs,   
    output hdmi_hs,   
    output hdmi_de,   
    output hdmi_ck
    
    );
    
    wire clk_1Hz, clk_5Hz, clk_10Hz, clk_60Hz, clk_1K, clk_5M, clk_40M;
    wire rst, digsel, refresh;
    wire [3:0] seven_part;
    wire[11:0] countout;
    wire upbtn, dwbtn, UTC, DTC, btnC;
//    wire clear = io_btn[4];
    wire [2:0] io_sel_temp;
    
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
                        .res_n      (rst),
                        .clk_1Hz    (clk_1Hz),
                        .clk_5Hz    (clk_5Hz),
                        .clk_10Hz   (clk_10Hz),
                        .clk_60Hz   (clk_60Hz),
                        .clk_1K     (clk_1K),
                        .clk_5M     (clk_5M),
                        .clk_40M    (clk_40M),
                        .refresh    (refresh),
                        .digsel     (digsel)
    );
    
    //generate pulse for 1Hz, to enable counter every sec
    reg clk_1Hz_delay;
    wire tick_1Hz;
    always @(posedge clk_5M)begin
        clk_1Hz_delay <= clk_1Hz;
    end
    assign tick_1Hz = clk_1Hz & ~clk_1Hz_delay;
    
    counter_16bit sixteenbitcount(
                                .clk    (clk_5M),
                                .clear  (rst),
                                .up     (tick_1Hz),
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
                        .clear  (rst), 
                        .seg_4  (seven_part), 
                        .sel    (io_sel_temp)
                        );
    assign io_sel = ~io_sel_temp;
    assign dp = 1'b1;
    seven_seg sevenseg(
                        .clk (clk_5M),
                        .in (seven_part),
                        .out(io_seg)
                        );
    matrix_cntrl(
                .clk    (clk_5M),
                .res_n  (rst),
                .en     (refresh),
                .led    (io_led)
                );
//    assign io_led = {countout, countout};



///////////////////////////////////////////////////////////////////////////////////////////////////
/*
  wire          reset_loc;
  wire          clk_40m_tree;
  reg  [29:0]   led_cnt;
  reg  [29:0]   led_cnt_p1;
  wire          vga_de;
  wire          vga_ck;
  wire          vga_hs;
  wire          vga_vs;
  wire [23:0]   vga_rgb;
  reg  [31:0]   random_num;
  wire [7:0]    r;
  wire [7:0]    g;
  wire [7:0]    b;
  reg           mode_bit;


  assign reset_loc  = ~rst;

//-----------------------------------------------------------------------------
// Clock Buffer.
//-----------------------------------------------------------------------------
  BUFG u0_clk_tree   (.I( clk_40M         ),.O( clk_40m_tree     ));


//-----------------------------------------------------------------------------
// Flash an LED. Also control the VGA demos, toggle between color pattern and
// either a bouncing ball or moving lines.
//-----------------------------------------------------------------------------
always @ ( posedge clk_40m_tree or posedge reset_loc ) begin : proc_led 
 if ( reset_loc == 1 ) begin
   random_num   <= 32'd0;
   led_cnt      <= 30'd0;
   led_cnt_p1   <= 30'd0;
//   ok_led_loc   <= 0;
   mode_bit     <= 0;
 end else begin
   random_num   <= random_num + 3;
//   ok_led_loc   <= 0;
   led_cnt_p1   <= led_cnt[29:0];
   led_cnt      <= led_cnt + 1;
   if ( led_cnt[19] == 1 ) begin
//     ok_led_loc <= 1;
   end
   if ( led_cnt[29:27] == 3'd0 ) begin
     mode_bit <= 0;
   end else begin
     mode_bit <= 1;
   end 

 end // clk+reset
end // proc_led


// ----------------------------------------------------------------------------
// VGA Timing Generator
// ----------------------------------------------------------------------------
hdmi_core u_vga_core
(
  .reset             ( reset_loc           ),
  .random_num        ( random_num[31:0]    ),
  .color_3b          ( 1'b0                ),
  .mode_bit          ( mode_bit            ),
  .clk_dot           ( clk_40m_tree        ),
  .vga_active        ( vga_de              ),
  .vga_hsync         ( vga_hs              ),
  .vga_vsync         ( vga_vs              ),
  .vga_pixel_rgb     ( vga_rgb[23:0]       )
);
  assign r = vga_rgb[23:16];
  assign g = vga_rgb[15:8];
  assign b = vga_rgb[7:0];


// ----------------------------------------------------------------------------
// Assign the PMOD(s) for either 3b or 12b HDMI Module from Black Mesa Labs
// DDR Flop to Mirror pixel clock to TFP410 
// ----------------------------------------------------------------------------
//OFDDRCPE u1_FDDRCPE
//(
//  .C0  ( clk_40m_tree   ), .C1  ( ~ clk_40m_tree   ),
//  .CE  ( 1'b1           ),
//  .CLR ( 1'b0           ), .PRE ( 1'b0      ),
//  .D0  ( 1'b1           ), .D1  ( 1'b0      ),
//  .Q   ( vga_ck         ) 
//);

ODDR #(
	.DDR_CLK_EDGE("OPPOSITE_EDGE"), .INIT(1'b0), .SRTYPE("SYNC")) clkDDR (
		.Q(vga_ck), 
		.C(clk_40m_tree),
		.CE(1'b1),
		.D1(1'b1),
		.D2(1'b0),
		.R(reset_loc),
		.S(1'b0)
		);

// 3b for single-PMOD
//assign  pmod_m_d[7:0] = 8'd0;
//assign  pmod_m_b[7:0] = 8'd0;
//assign  pmos_m_g[7:0] = 8'd0;
//assign  pmod_m_r[7:0] = { 1'b0,vga_vs,vga_hs,vga_de,vga_ck,b[7],g[7],r[7] };

// 12b for dual-PMOD
//   assign  pmod_m_d[7:0] = 8'd0;
//   assign  pmod_m_b[7:0] = 8'd0;
//   assign  pmos_m_g[7:0] = { g[5],g[4],g[7],g[6],r[5],r[4],r[7],r[6] };
//   assign  pmod_m_r[7:0] = { vga_hs,vga_vs,b[4],vga_de,vga_ck,b[5],b[7],b[6] };

  assign hdmi_red   = r[7:4];
  assign hdmi_green = g[7:4];
  assign hdmi_blue  = b[7:4];
  assign hdmi_vs    = vga_vs;
  assign hdmi_hs    = vga_hs;
  assign hdmi_de    = vga_de;
  assign hdmi_ck    = vga_ck;
*/

    
endmodule