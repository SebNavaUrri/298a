/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_example (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // goes high when design is selected, ignore
    input  wire       clk,      // clock
    input  wire       rst_n     // active-low reset
);

  // uio_in[0] = load_en, uio_in[1] = out_en
  wire load_en = uio_in[0];
  wire out_en  = uio_in[1];

  reg [7:0] counter;
  reg [7:0] outpuh;

  assign uo_out  = outpuh;
  assign uio_out = 8'b0;   // uio pins used only as inputs here
  assign uio_oe  = 8'b0;   // 0 = input direction on every uio pin

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
