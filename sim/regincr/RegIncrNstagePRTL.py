#=========================================================================
# RegIncrNstagePRTL
#=========================================================================
# Registered incrementer that is parameterized by the number of stages.

from pymtl3 import *
from pymtl3.passes.backends.verilog import *
from .RegIncrRTL import RegIncrRTL

class RegIncrNstagePRTL( Component ):

  # Constructor

  def construct( s, nstages=2 ):

    # Port-based interface

    s.in_ = InPort  ( Bits8 )
    s.out = OutPort ( Bits8 )

    # Instantiate the registered incrementers

    s.reg_incrs = [ RegIncrRTL() for _ in range(nstages) ]

    # Connect input port to first reg_incr in chain

    connect( s.in_, s.reg_incrs[0].in_ )

    # ''' SECTION TASK '''''''''''''''''''''''''''''''''''''''''''''''''''
    # This model is incomplete. Uncomment the code to instantiate and
    # connect the stages together.
    # ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    # for i in range( nstages - 1 ):
    #   connect( s.reg_incrs[i].out, s.reg_incrs[i+1].in_ )

    # Connect last reg_incr in chain to output port

    connect( s.reg_incrs[-1].out, s.out )

    # If translated into Verilog, we use the explicit name

    s.set_metadata( VerilogTranslationPass.explicit_module_name,
                    f"RegIncr{nstages}stageRTL" )

  # Line tracing

  def line_trace( s ):
    pipe_str = '|'.join([ str(reg_incr.out) for reg_incr in s.reg_incrs ])
    return f"{s.in_} ({pipe_str}) {s.out}"

