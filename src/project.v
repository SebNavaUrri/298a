/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_example (
    input  wire [7:0] ui_in,     // load value
    input  wire       load_en,
    input  wire       out_en,
    input  wire       en,        // unused, kept for interface
    input  wire       clk,
    input  wire       rst_n,     // active-low reset
    output wire [7:0] uo_out
);

  reg [7:0] counter;
  reg [7:0] outpuh;

  assign uo_out = outpuh;

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      counter <= 8'b0;
      outpuh  <= 8'b0;
    end else begin
      if (load_en)
        counter <= ui_in;
      else
        counter <= counter + 1'b1;

      if (out_en)
        outpuh <= counter;
    end
  end

endmodule
