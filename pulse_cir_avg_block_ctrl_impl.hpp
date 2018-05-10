//Team WINLAB
//RFNoC HLS Challenge
/* pulse_cir_avg_block_ctrl.hpp - Block controller for pulse_cir_avg NoC block
   Used Ettus provided block controllers for reference
*/

#ifndef INCLUDED_LIBUHD_RFNOC_pulse_cir_avg_block_ctrl_HPP
#define INCLUDED_LIBUHD_RFNOC_pulse_cir_avg_block_ctrl_HPP

#include <uhd/rfnoc/source_block_ctrl_base.hpp>
#include <uhd/rfnoc/sink_block_ctrl_base.hpp>

namespace uhd {
    namespace rfnoc {

class UHD_RFNOC_API pulse_cir_avg_block_ctrl : public source_block_ctrl_base, public sink_block_ctrl_base
{
public:
    UHD_RFNOC_BLOCK_OBJECT(pulse_cir_avg_block_ctrl)

    //! Configure the pulse averaging block 
    //
    virtual void set_pulse_cir_avg(const uint32_t threshold, const int log_avg_size, const int seq_len) = 0;

}; /* class pulse_cir_avg_block_ctrl*/

}} /* namespace uhd::rfnoc */

#endif 
/* INCLUDED_LIBUHD_RFNOC_pulse_cir_avg_block_ctrl_HPP */
// vim: sw=4 et:
