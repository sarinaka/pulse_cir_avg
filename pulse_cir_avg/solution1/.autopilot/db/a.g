#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/radar/pulse_cir_avg/solution1/.autopilot/db/a.g.bc ${1+"$@"}
