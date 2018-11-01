

// Copyright (c) 2017 - WINLAB, Rutgers University, USA
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
//Team WINLAB
//RFNoC HLS Challenge
/* averaging.cpp - Used to generate RTL for the averaging module used in noc_block_cir_avg
   i_data - AXI stream input data (with tlast) Packets of PDP of incoming samples
   o_data - AXI stream output data (with tlast) Average PDP over 'K'(averaging factor) packets
   threshold - to discard noise at the beginning of signal reception (before any signal is sent), and to get the LOS path as the first output in a packet, this threshold input could be set by the user, so that the averaging module starts processing samples only after it finds a sample whose value is over the threshold.
   seq_len - input parameter PN sequence length
   log_avg_size - user provided input parameter log2(averaging_factor).
*/



/* questions:
 1. how to detect end of file/signal? (axes.last? is a variable we set, not something we can ask for)
 2. how to keep track of variable pulse sizes in order to resize vectors
 3. how to divide? (discarding of bits?)
 4. decision: accumulation, and then division at the end

*/


#include <hls_stream.h>
#include "ap_int.h"
#include "rfnoc.h"

void pulse_cir_avg(hls::stream<rfnoc_axis> i_data, hls::stream<rfnoc_axis> o_data, ap_uint<32> threshold, ap_uint<16> seq_len, ap_uint<32> avg_size)
{
#pragma HLS PIPELINE II=1
#pragma HLS INTERFACE axis port=o_data
#pragma HLS INTERFACE axis port=i_data
#pragma HLS INTERFACE ap_ctrl_none port=return

	static ap_uint<32> data_in_reg; // 32 bit wide temp register for one sample???


	static ap_uint<1> data_in_valid;

	static ap_uint<16> seq_len_reg;
	static ap_uint<32> avg_size_reg;
	//static ap_uint<3> log_avg_size_reg;

	enum averagingState {ST_IDLE = 0, ST_FIRST_BLK, ST_NOT_FIRST_BLK};
	static averagingState currentState;
#pragma HLS RESET variable=currentState

	//static hls::stream<ap_uint<40> > data_fifo; // 64 or 33 continuous avg to handle overflow
    // NOT continuous average = issue with clocking
    static hls::stream<ap_uint<64> > data_fifo;

//#pragma HLS STREAM variable=data_fifo depth=1024 dim=1 // depth <= 8192
#pragma HLS STREAM variable=data_fifo depth=8192 dim=1
#pragma HLS RESOURCE variable=data_fifo core=FIFO_BRAM //type of memory


 // 40 bits to accommodate for accumulation over 128 samples (max averaging size)
   static hls::stream<ap_uint<32> > out_fifo;
    // static hls::stream<ap_uint<64> > out_fifo;
#pragma HLS STREAM variable=out_fifo depth=1024 dim=1
#pragma HLS RESOURCE variable=out_fifo core=FIFO_BRAM

	static ap_uint<40> pfetch_data;
#pragma HLS DEPENDENCE variable=pfetch_data inter false
	static ap_uint<10> wr_cnt; // sample count
#pragma HLS RESET variable=wr_cnt
	static ap_uint<10> rd_cnt;
#pragma HLS RESET variable=rd_cnt
    static ap_int<1> threshold_met; // data power must exceed noise power by this threshold
#pragma HLS RESET variable=threshold_met

	static ap_uint<8> blk_cnt; // pulse count (total signals read in) num averages
	static ap_uint<9> out_sample_cnt;
	rfnoc_axis out_sample; // data, last
	ap_uint<32> tmp_data;

	switch(currentState){
            // idle state is waiting for a new set of data
	   case ST_IDLE :

		  //  if(data_in_valid)
		  //  {
      //          if(!threshold_met) // if threshold is met, isnt the signal discernable from the noise, and a good thing?
      //            {
      //                 seq_len_reg = seq_len;
      //                 avg_size_reg = avg_size;
      //                 //log_avg_size_reg = log_avg_size;
      //                 //avg_size_reg = 1 << log_avg_size; ?? what is this line doing
      //            }
      //          if(!threshold_met && (data_in_reg > threshold))
      //                 threshold_met = 1;
      //          // basically if the threshold is met, then transition to the sample obtaining state
      //          if( (!threshold_met && (data_in_reg > threshold)) || threshold_met)
      //            {
			//           data_fifo.write(data_in_reg);
			//           wr_cnt = wr_cnt + 1;
			//           currentState = ST_FIRST_BLK;
      //            }
		  //  }

			seq_len_reg = seq_len;
			avg_size_reg = avg_size;

			if(data_in_valid)
			{
				wr_cnt = wr_cnt + 1;
				currentState = ST_FIRST_BLK;
				if (avg_size_reg <= 1 )
				{
					 out_fifo.write(data_in_reg);
				}
				else{
					data_fifo.write(data_in_reg); // First block/packet is stored in the data fifo
								// if we have collected enough samples
				}
			}
			 else
			 {
			 	wr_cnt = 0; // reset wr_cnt to zero
			 }
   		break;
	   case ST_FIRST_BLK:  // first pulse is sent/obtained
		   if(data_in_valid)
		   {
				 // handle case for 0 and 1
				 if (avg_size_reg <=1 )
				 {
					 	out_fifo.write(data_in_reg);
				 }
				 else{
					 data_fifo.write(data_in_reg); // First block/packet is stored in the data fifo
	               // if we have collected enough samples
				 }


			   if(wr_cnt == seq_len_reg - 1) // wr_cnt = sample count
			   {
					 	wr_cnt = 0;
				  	if(avg_size_reg <=1 )
							{
								blk_cnt = 0;
							 	currentState = ST_IDLE;
				    	}
						else{
								blk_cnt = 1; // set #pulses to 1 because we have obtained a full set of samples
								currentState = ST_NOT_FIRST_BLK; // change states
							}

			   }
			   else
			   {
				   wr_cnt = wr_cnt + 1; // increment
				   currentState = ST_FIRST_BLK; // remain in the same state
			   }


		   }
		   break;
      case ST_NOT_FIRST_BLK: // new state: not the first block
			   if(data_in_valid)
			   {
	               if(blk_cnt < (avg_size_reg - 1)) // if we have not reached the desired number of pulses
	               {
	                   // continuous avg
	                   // data_in_reg2 (RR) * constant to undo avg
	                   //data_in_reg2 = data_in_reg*(n-1) + data_fifo.read();
	                   // data_in_reg3 <64>  = data_in_reg2/n
	                   // range is bit operation for division , first 32 bits
	                   // range(31, 0)
	                   // data_fifo.write(data_in_reg3);

	                     data_fifo.write(data_in_reg + data_fifo.read()); // subsequent blocks are added to the stored data (element by element) and stored back in the data fifo

							         if(wr_cnt == seq_len_reg - 1)
							         {
										        wr_cnt = 0;
										        blk_cnt = blk_cnt + 1;
										        currentState = ST_NOT_FIRST_BLK;
							         }
				         			else
						         	{
							        			wr_cnt = wr_cnt + 1;
						         	}
	               }
	               else
	               {
	                   // enough pulses have been collected


	                      //tmp_data = ((data_in_reg + data_fifo.read())).range(31, 0); // division operation???????????????????????
	            	   	  if (avg_size_reg != 0)
	            	   	  {
	               	   	   tmp_data = ((data_in_reg + data_fifo.read())) / avg_size_reg;
	            	   	  }
	            	   	  else
	            	   	  {
	            	   				tmp_data = ((data_in_reg + data_fifo.read()));
	            	   	  }
	            	      out_fifo.write(tmp_data); // Average block is written to a different FIFO out_fifo
	                    if(wr_cnt == seq_len_reg - 1)
	                    {
	                       wr_cnt = 0;
	                       blk_cnt = 0;
	                       currentState = ST_IDLE;
	                    }
	                    else
	                    {
	                       wr_cnt = wr_cnt + 1;
	                    }
	               }
			   }
		   break;
        }


        if(!out_fifo.empty())
        {
            out_sample.data = (out_fifo.read());  // sending average data out

            if ((out_sample_cnt == 259) || (rd_cnt == seq_len_reg - 1) )  // fragmenting output packet in case of incoming packet size > 260, i.e., 260*4 = 1040 bytes to fit in an Ethernet packet.
           {
               out_sample.last = 1;
               out_sample_cnt = 0;
           }
            else
            {
                out_sample.last = 0;
                out_sample_cnt = out_sample_cnt + 1;
            }

           if(rd_cnt == seq_len_reg - 1)
              rd_cnt = 0;
           else
              rd_cnt = rd_cnt + 1;


            o_data.write(out_sample);
        }


	if(!i_data.empty()) // reading incoming data
	{
		data_in_reg = i_data.read().data; // internal register to store incoming data
		data_in_valid = 1;
	}
	else
		data_in_valid = 0;


}
