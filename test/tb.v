`default_nettype none
`timescale 1ns / 1ps

module tb ();

  initial begin
    $dumpfile("tb.fst");
    $dumpvars(0, tb);
    #1;
  end

  reg  [7:0] ui_in;
  reg        load_en;
  reg        out_en;
  reg        en;
  reg        clk;
  reg        rst_n;
  wire [7:0] uo_out;

`ifdef GL_TEST
  wire VPWR = 1'b1;
  wire VGND = 1'b0;
`endif

  tt_um_example user_project (
`ifdef GL_TEST
      .VPWR(VPWR),
      .VGND(VGND),
`endif
      .ui_in  (ui_in),
      .load_en(load_en),
      .out_en (out_en),
      .en     (en),
      .clk    (clk),
      .rst_n  (rst_n),
      .uo_out (uo_out)
  );

endmodule
