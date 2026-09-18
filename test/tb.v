`default_nettype none
`timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();

  // Dump the signals to a FST file. You can view it with gtkwave or surfer.
  initial begin
    $dumpfile("tb.fst");
    $dumpvars(0, tb);
    #1;
  end

  // Wire up the inputs and outputs:
   wire [7:0] load_bits,    // Dedicated inputs
   wire  load_en,   // Dedicated outputs
   wire out_en,    // enabling the output
   wire en,      // always 1 when the design is powered, so you can ignore it
   wire clk,      // clock
   wire rst,        // reset
   wire [7:0] out
`ifdef GL_TEST
  wire VPWR = 1'b1;
  wire VGND = 1'b0;
`endif

  // Replace tt_um_example with your module name:
  tt_um_example user_project (

      // Include power ports for the Gate Level test:
`ifdef GL_TEST
      .VPWR(VPWR),
      .VGND(VGND),
`endif

     .load_bits  (load_bits),    // Dedicated inputs
     .load_en (load_en),   // Dedicated outputs
     .out_en (out_en),   // IOs: Input path
     .en (en),  // IOs: Output path
     .rst (rst),   // IOs: Enable path (active high: 0=input, 1=output)
     .out    (out),      // enable - goes high when design is selected
      .clk    (clk)      // clock
  );

endmodule
