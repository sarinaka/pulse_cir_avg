//Team WINLAB
//RFNoC HLS Challenge
/* pulse_cir_avg_ctrl_impl.cpp - Block controller implementation for pulse_cir_avg NoC block
   Used Ettus provided block controllers for reference
*/
#include <uhd/rfnoc/pulse_cir_avg_block_ctrl.hpp>
#include <uhd/convert.hpp>
#include <uhd/utils/msg.hpp>

using namespace uhd::rfnoc;
    
// pulse_cir_avg_block_ctrl???
class pulse_cir_avg_ctrl_impl : public pulse_cir_avg_block_ctrl
{
public:

    UHD_RFNOC_BLOCK_CONSTRUCTOR(pulse_cir_avg_block_ctrl)
    {
        set_pulse_cir_avg(0xFFFF/*threshold*/, 4/*log_avg_size*/, 255/*pn seq len*/);
    }

    void set_pulse_cir_avg(const uint32_t threshold, const int log_avg_size, const int seq_len)
    {
        UHD_RFNOC_BLOCK_TRACE() << "pulse_cir_avg::set_pulse_cir_avg()" << std::endl;
        UHD_MSG(status) << "Configuring PULSE CIR avg. Threshold : " << threshold << "Log2(avg_size) : " << log_avg_size << "Seq_len : " << seq_len << std::endl;

        if(log_avg_size > 7) {
           throw uhd::value_error(str(boost::format("log2(avg_size) should be <= 7 - Maximum averaging factor is 256")));
        }
        if(seq_len > 1023){
           throw uhd::value_error(str(boost::format("PN sequence too long!! length should be <= 1023")));
        }
        
        sr_write("BLOCK_RESET", 1);
        sr_write("BLOCK_RESET", 0);

        uint32_t log_avg_size_seq_len = (log_avg_size << 10) + seq_len;
        sr_write("THRESHOLD", threshold);
        
        sr_write("AVG_SIZE_SEQ_LEN", log_avg_size_seq_len );
     }

};

UHD_RFNOC_BLOCK_REGISTER(pulse_cir_avg_block_ctrl, "PULSECIRAvg");