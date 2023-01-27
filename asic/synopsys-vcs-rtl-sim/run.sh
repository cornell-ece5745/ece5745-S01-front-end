
vcs -full64 -sverilog +lint=all -xprop=tmerge -override_timescale=1ns/1ps \
  +incdir+../../sim/build \
  +vcs+dumpvars+vcs-rtl-sim.vcd \
  -top RegIncrNstage__p_nstages_4_tb \
  ../../sim/build/RegIncrNstage__p_nstages_4__pickled.v \
  ../../sim/build/RegIncrNstage__p_nstages_4_test_random_4_tb.v

