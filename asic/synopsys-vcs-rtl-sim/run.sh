
vcs -full64 -sverilog +lint=all -xprop=tmerge -override_timescale=1ns/1ps \
  +incdir+../../sim/build \
  +vcs+dumpvars+vcs-rtl-sim.vcd \
  -top RegIncr4stageRTL_tb \
  ../../sim/build/RegIncr4stageRTL__pickled.v \
  ../../sim/build/RegIncr4stageRTL_test_4stage_random_tb.v

