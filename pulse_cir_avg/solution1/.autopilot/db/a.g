#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/radar/Pulse_Avg/pulse_cir_avg/pulse_cir_avg/solution1/.autopilot/db/a.g.bc ${1+"$@"}
