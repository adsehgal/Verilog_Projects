// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Sat Dec 19 01:15:04 2020
// Host        : Adi running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top clk_5M -prefix
//               clk_5M_ clk_5M_stub.v
// Design      : clk_5M
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k70tfbv676-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_5M(clk_5M, resetn, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_5M,resetn,clk_in1" */;
  output clk_5M;
  input resetn;
  input clk_in1;
endmodule
