
vcs -full64 -sverilog +lint=all -xprop=tmerge -override_timescale=1ns/1ps \
  +delay_mode_zero \
  +incdir+../../sim/build \
  +vcs+dumpvars+vcs-ffgl-sim.vcd \
  -top RegIncr4stageRTL_tb \
  $ECE5745_STDCELLS/stdcells.v \
  ../synopsys-dc-synth/post-synth.v \
  ../../sim/build/RegIncr4stageRTL_test_4stage_random_tb.v

