//Team WINLAB
//RFNoC HLS Challenge
/*rfnoc.h - Used to define custom AXI stream interface required for noc_blocks
  The default AXI stream interface in Vivado HLS consists of data, valid and ready signals. rfnoc_axis has 'last' signal along with those.
*/
#include "ap_int.h"

 struct rfnoc_axis{
     ap_int<32>       data;
     ap_uint<1>       last;
   };
