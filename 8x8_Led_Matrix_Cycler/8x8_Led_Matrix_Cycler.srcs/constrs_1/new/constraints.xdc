# clk => 100000000Hz
create_clock -period 10.0 -name clk_0 -waveform {0.000 5.000} [get_ports clk]
    set_property PACKAGE_PIN N14 [get_ports {clk}]
    set_property IOSTANDARD LVCMOS33 [get_ports {clk}]

set_property PACKAGE_PIN P6 [get_ports {res_n}]
    set_property IOSTANDARD LVCMOS33 [get_ports {res_n}]

set_property PACKAGE_PIN K13 [get_ports {led[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property PACKAGE_PIN K12 [get_ports {led[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property PACKAGE_PIN L14 [get_ports {led[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property PACKAGE_PIN L13 [get_ports {led[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
set_property PACKAGE_PIN M16 [get_ports {led[4]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]
set_property PACKAGE_PIN M14 [get_ports {led[5]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]
set_property PACKAGE_PIN M12 [get_ports {led[6]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
set_property PACKAGE_PIN N16 [get_ports {led[7]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]
set_property PACKAGE_PIN P15 [get_ports {usb_rx}]
    set_property IOSTANDARD LVCMOS33 [get_ports {usb_rx}]
set_property PACKAGE_PIN P16 [get_ports {usb_tx}]
    set_property IOSTANDARD LVCMOS33 [get_ports {usb_tx}]
    
    
set_property PACKAGE_PIN K3 [get_ports {col[0]}];#A39################
    set_property IOSTANDARD LVCMOS33 [get_ports {col[0]}]
set_property PACKAGE_PIN R10 [get_ports {col[1]}];#C9
    set_property IOSTANDARD LVCMOS33 [get_ports {col[1]}]
set_property PACKAGE_PIN N3 [get_ports {col[2]}];#C12
    set_property IOSTANDARD LVCMOS33 [get_ports {col[2]}]
set_property PACKAGE_PIN H5 [get_ports {col[3]}];#A30################
    set_property IOSTANDARD LVCMOS33 [get_ports {col[3]}]
set_property PACKAGE_PIN L4 [get_ports {col[4]}];#C18
    set_property IOSTANDARD LVCMOS33 [get_ports {col[4]}]
set_property PACKAGE_PIN J3 [get_ports {col[5]}];#A33################
    set_property IOSTANDARD LVCMOS33 [get_ports {col[5]}]
set_property PACKAGE_PIN R7 [get_ports {col[6]}];#A45################
    set_property IOSTANDARD LVCMOS33 [get_ports {col[6]}]
set_property PACKAGE_PIN T9 [get_ports {col[7]}];#A48################
    set_property IOSTANDARD LVCMOS33 [get_ports {col[7]}]
    
    
set_property PACKAGE_PIN M6 [get_ports {row[0]}];#A27################
    set_property IOSTANDARD LVCMOS33 [get_ports {row[0]}]
set_property PACKAGE_PIN N9 [get_ports {row[1]}];#A42################
    set_property IOSTANDARD LVCMOS33 [get_ports {row[1]}]
set_property PACKAGE_PIN P5 [get_ports {row[2]}];#C24
    set_property IOSTANDARD LVCMOS33 [get_ports {row[2]}]
set_property PACKAGE_PIN J5 [get_ports {row[3]}];#A36################
    set_property IOSTANDARD LVCMOS33 [get_ports {row[3]}]
set_property PACKAGE_PIN R13 [get_ports {row[4]}];#C3
    set_property IOSTANDARD LVCMOS33 [get_ports {row[4]}]
set_property PACKAGE_PIN M5 [get_ports {row[5]}];#C21
    set_property IOSTANDARD LVCMOS33 [get_ports {row[5]}]
set_property PACKAGE_PIN R12 [get_ports {row[6]}];#C6
    set_property IOSTANDARD LVCMOS33 [get_ports {row[6]}]
set_property PACKAGE_PIN P4 [get_ports {row[7]}];#C15
    set_property IOSTANDARD LVCMOS33 [get_ports {row[7]}]