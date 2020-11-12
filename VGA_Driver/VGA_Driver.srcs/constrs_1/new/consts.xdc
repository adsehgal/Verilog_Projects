#create_clock -period 10.0 -name clk_0 -waveform {0.000 5.000} {get_ports clk}
    set_property PACKAGE_PIN N14 [get_ports clk]
    set_property IOSTANDARD LVCMOS33 [get_ports clk]
    create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
    
set_property PACKAGE_PIN P6 [get_ports res_n]
    set_property IOSTANDARD LVCMOS33 [get_ports res_n]
    
#VGA Red
set_property PACKAGE_PIN T8 [get_ports {vgaRed[0]}]     
#A2
    set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[0]}]
set_property PACKAGE_PIN T7 [get_ports {vgaRed[1]}]     
#A3
    set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[1]}]
set_property PACKAGE_PIN T5 [get_ports {vgaRed[2]}]     
#a5
    set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[2]}]
set_property PACKAGE_PIN R5 [get_ports {vgaRed[3]}]     
#a6
    set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[3]}]
#VGA Green
set_property PACKAGE_PIN R8 [get_ports {vgaGreen[0]}]   
#a8
    set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen[0]}]
set_property PACKAGE_PIN P8 [get_ports {vgaGreen[1]}]   
#a9
    set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen[1]}]
set_property PACKAGE_PIN L2 [get_ports {vgaGreen[2]}]   
#a11
    set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen[2]}]
set_property PACKAGE_PIN L3 [get_ports {vgaGreen[3]}]   
#a12
    set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen[3]}]
#VGA Blue
set_property PACKAGE_PIN J1 [get_ports {vgaBlue[0]}]   
#a14
    set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[0]}]
set_property PACKAGE_PIN K1 [get_ports {vgaBlue[1]}]   
#a15
    set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[1]}]
set_property PACKAGE_PIN H1 [get_ports {vgaBlue[2]}]   
#a17
    set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[2]}]
set_property PACKAGE_PIN H2 [get_ports {vgaBlue[3]}]   
#a18
    set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[3]}]
    
#Hsync Vsync
set_property PACKAGE_PIN G1 [get_ports hSync]   
#a20
    set_property IOSTANDARD LVCMOS33 [get_ports hSync]
set_property PACKAGE_PIN G2 [get_ports vSync]   
#a21
    set_property IOSTANDARD LVCMOS33 [get_ports vSync]