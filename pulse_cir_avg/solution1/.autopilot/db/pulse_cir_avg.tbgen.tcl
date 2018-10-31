set C_TypeInfoList {{ 
"pulse_cir_avg" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"i_data": [[],"0"] }, {"o_data": [[],"0"] }, {"threshold": [[],"1"] }, {"seq_len": [[],"2"] }, {"avg_size": [[],"1"] }],[],""], 
"0": [ "stream<rfnoc_axis>", {"hls_type": {"stream": [[[[],"3"]],"4"]}}], 
"3": [ "rfnoc_axis", {"struct": [[],[],[{ "data": [[], "5"]},{ "last": [[], "6"]}],""]}], 
"5": [ "ap_int<32>", {"hls_type": {"ap_int": [[[[], {"scalar": { "int": 32}}]],""]}}], 
"1": [ "ap_uint<32>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 32}}]],""]}}], 
"2": [ "ap_uint<16>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 16}}]],""]}}], 
"6": [ "ap_uint<1>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 1}}]],""]}}],
"4": ["hls", ""]
}}
set moduleName pulse_cir_avg
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set pipeII 1
set pipeLatency 73
set C_modelName {pulse_cir_avg}
set C_modelType { void 0 }
set C_modelArgList { 
	{ i_data_V_data_V int 32 regular {axi_s 0 volatile  { i_data data } }  }
	{ i_data_V_last_V int 1 regular {axi_s 0 volatile  { i_data last } }  }
	{ o_data_V_data_V int 32 regular {axi_s 1 volatile  { o_data data } }  }
	{ o_data_V_last_V int 1 regular {axi_s 1 volatile  { o_data last } }  }
	{ threshold_V int 32 unused  }
	{ seq_len_V int 16 regular  }
	{ avg_size_V int 32 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "i_data_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "i_data.V.data.V","cData": "int32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "i_data_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "i_data.V.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "o_data_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "o_data.V.data.V","cData": "int32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "o_data_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "o_data.V.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "threshold_V", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "threshold.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "seq_len_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "seq_len.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "avg_size_V", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "avg_size.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 13
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ i_data_TDATA sc_in sc_lv 32 signal 0 } 
	{ i_data_TVALID sc_in sc_logic 1 invld 0 } 
	{ i_data_TREADY sc_out sc_logic 1 inacc 1 } 
	{ i_data_TLAST sc_in sc_lv 1 signal 1 } 
	{ o_data_TDATA sc_out sc_lv 32 signal 2 } 
	{ o_data_TVALID sc_out sc_logic 1 outvld 3 } 
	{ o_data_TREADY sc_in sc_logic 1 outacc 3 } 
	{ o_data_TLAST sc_out sc_lv 1 signal 3 } 
	{ threshold_V sc_in sc_lv 32 signal 4 } 
	{ seq_len_V sc_in sc_lv 16 signal 5 } 
	{ avg_size_V sc_in sc_lv 32 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "i_data_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "i_data_V_data_V", "role": "default" }} , 
 	{ "name": "i_data_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "i_data_V_data_V", "role": "default" }} , 
 	{ "name": "i_data_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "i_data_V_last_V", "role": "default" }} , 
 	{ "name": "i_data_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "i_data_V_last_V", "role": "default" }} , 
 	{ "name": "o_data_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "o_data_V_data_V", "role": "default" }} , 
 	{ "name": "o_data_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "o_data_V_last_V", "role": "default" }} , 
 	{ "name": "o_data_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "o_data_V_last_V", "role": "default" }} , 
 	{ "name": "o_data_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "o_data_V_last_V", "role": "default" }} , 
 	{ "name": "threshold_V", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "threshold_V", "role": "default" }} , 
 	{ "name": "seq_len_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "seq_len_V", "role": "default" }} , 
 	{ "name": "avg_size_V", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "avg_size_V", "role": "default" }}  ]}
set Spec2ImplPortList { 
	i_data_V_data_V { axis {  { i_data_TDATA in_data 0 32 }  { i_data_TVALID in_vld 0 1 } } }
	i_data_V_last_V { axis {  { i_data_TREADY in_acc 1 1 }  { i_data_TLAST in_data 0 1 } } }
	o_data_V_data_V { axis {  { o_data_TDATA out_data 1 32 } } }
	o_data_V_last_V { axis {  { o_data_TVALID out_vld 1 1 }  { o_data_TREADY out_acc 0 1 }  { o_data_TLAST out_data 1 1 } } }
	threshold_V { ap_none {  { threshold_V in_data 0 32 } } }
	seq_len_V { ap_none {  { seq_len_V in_data 0 16 } } }
	avg_size_V { ap_none {  { avg_size_V in_data 0 32 } } }
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
