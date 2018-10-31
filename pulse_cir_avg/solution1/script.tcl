############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 2015 Xilinx Inc. All rights reserved.
############################################################
open_project pulse_cir_avg
set_top pulse_cir_avg
add_files Pulse_Avg/pulse_cir_avg/pulse_cir_avg.cpp
add_files Pulse_Avg/pulse_cir_avg/rfnoc.h
open_solution "solution1"
set_part {xc7k325tffg900-2}
create_clock -period 5 -name default
#source "./pulse_cir_avg/solution1/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -format ip_catalog
