// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Sat Dec 26 00:08:48 2020
// Host        : Adi running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/adity/Documents/GitHub/Verilog_Projects/IO_Shield_Demo_Project/IO_Shield_Demo_Project.srcs/sources_1/ip/clk_108M/clk_108M_stub.v
// Design      : clk_108M
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tftg256-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_108M(clk_108M, resetn, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_108M,resetn,clk_in1" */;
  output clk_108M;
  input resetn;
  input clk_in1;
endmodule
