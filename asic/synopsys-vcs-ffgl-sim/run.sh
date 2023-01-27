
vcs -full64 -sverilog +lint=all -xprop=tmerge -override_timescale=1ns/1ps \
  +delay_mode_zero \
  +incdir+../../sim/build \
  +vcs+dumpvars+vcs-ffgl-sim.vcd \
  -top RegIncrNstage__p_nstages_4_tb \
  $ECE5745_STDCELLS/stdcells.v \
  ../synopsys-dc-synth/post-synth.v \
  ../../sim/build/RegIncrNstage__p_nstages_4_test_random_4_tb.v

