/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_example (
    input  wire [7:0] load_bits,    // Dedicated inputs
    input wire  load_en,   // Dedicated outputs
    input wire out_en,    // 
    input  wire en,      // always 1 when the design is powered, so you can ignore it
    input  wire clk,      // clock
    input  wire rst,        // reset
    output wire [7:0] out
);
 
  reg [7:0] counter;
  reg [7:0] outpuh;

    always @(posedge clk or posedge rst or posedge load_en) begin
        if (rst) begin
          counter <= 8'b0;
        end else if(load_en) begin
            counter <= load_bits;
        end else if (counter == 8'hff) begin
          counter <= 8'b0;
      end
      counter <= counter + 1'b1;
      if (out_en) begin
            outpuh <= counter;
        end 
    end

endmodule

