//========================================================================
// Registered Incrementer
//========================================================================
// This is a simple example of a module for a registered incrementer
// which combines a positive edge triggered register with a combinational
// +2 incrementer. We use flat register-transfer-level modeling.

`ifndef TUT3_VERILOG_REGINCR_REG_INCR_V
`define TUT3_VERILOG_REGINCR_REG_INCR_V

`include "vc/trace.v"

module tut3_verilog_regincr_RegIncr
(
  input  logic       clk,
  input  logic       reset,
  input  logic [7:0] in_,
  output logic [7:0] out
);

  // Sequential logic

  logic [7:0] reg_out;
  always @( posedge clk ) begin
    if ( reset )
      reg_out <= 0;
    else
      reg_out <= in_;
  end

  // ''' SECTION TASK ''''''''''''''''''''''''''''''''''''''''''''''''''''
  // This model is incomplete. Uncomment the combinational concurrent
  // block and connection statement to model the incrementer logic.
  // ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

  // logic [7:0] temp_wire;
  //
  // always @(*) begin
  //   temp_wire = reg_out + 1;
  // end
  //
  // assign out = temp_wire;

  `ifndef SYNTHESIS

  logic [`VC_TRACE_NBITS-1:0] str;
  `VC_TRACE_BEGIN
  begin
    $sformat( str, "%x (%x) %x", in_, reg_out, out );
    vc_trace.append_str( trace_str, str );
  end
  `VC_TRACE_END

  `endif /* SYNTHESIS */

endmodule

`endif /* TUT3_VERILOG_REGINCR_REG_INCR_V */
