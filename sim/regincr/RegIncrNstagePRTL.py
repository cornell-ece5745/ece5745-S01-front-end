#=========================================================================
# RegIncrNstagePRTL
#=========================================================================
# Registered incrementer that is parameterized by the number of stages.

from pymtl3      import *
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
    # This model is incomplete. As part of the tutorial you will insert
    # code here to connect the stages together.
    # ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    # Connect reg_incr in chain

    for i in range( nstages - 1 ):
      connect( s.reg_incrs[i+1].in_, s.reg_incrs[i].out )

    # Connect last reg_incr in chain to output port

    connect( s.reg_incrs[-1].out, s.out )

  # Line tracing

  def line_trace( s ):
    pipe_str = '|'.join([ str(reg_incr.out) for reg_incr in s.reg_incrs ])
    return f"{s.in_} ({pipe_str}) {s.out}"

