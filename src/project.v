/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_example (
    input  wire [7:0] load_bits,    // Dedicated inputs
    input wire  load_en,   // Dedicated outputs
    input wire out,
    input  wire en,      // always 1 when the design is powered, so you can ignore it
    input  wire clk,      // clock
    input  wire rst,        // reset
    output wire [7:0] out
);
 
  reg [7:0] counter;
  reg [7:0] outpuh;
    

  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out  = counter;  // Example: ou_out is the sum of ui_in and uio_in
  assign uio_out = 0;
  assign uio_oe  = 0;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, 1'b0};

    always @(posedge clk or posedge rst or posedge load_en) begin
        if (rst) begin
          counter <= 8'b0;
        end else if(load_en) begin
            counter <= load_bits;
        end else if (counter == 8'hff) begin
          counter <= 8'b0;
      end else if begin
      counter <= counter + 1'b1;
      end
        if (outpuh) begin
            outpuh <= counter;
        end 
    end

endmodule
