/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_brucemack_sb_mixer (
    input  wire       VGND,
    input  wire       VPWR,
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    inout  wire [7:0] ua,       // Analog pins, only ua[5:0] can be used
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // Analog component
  db_mixer db_mixer (
    .IFOUT_P(ua[1]),
    .IFOUT_N(ua[2]),
    .RF_P(ua[0]),
    .VDD(VPWR),
    .VSS(VGND),
    .LOIN(uio_in[0])
  );

  // Digital component
  quadrature_divider quadrature_divider(
     .clk(uio_in[1]),
     .n_rst(rst_n),
     .out_i(uo_out[0]),
     .out_q(uo_out[1]),
     .VPWR(VPWR),
     .VGND(VGND)		     
   ); 
   
   // Unused output pins tied low to avoid floats
   assign uo_out[2] = VGND;
   assign uo_out[3] = VGND;
   assign uo_out[4] = VGND;
   assign uo_out[5] = VGND;
   assign uo_out[6] = VGND;
   assign uo_out[7] = VGND;

   assign uio_out[0] = VGND;
   assign uio_out[1] = VGND;
   assign uio_out[2] = VGND;
   assign uio_out[3] = VGND;
   assign uio_out[4] = VGND;
   assign uio_out[5] = VGND;
   assign uio_out[6] = VGND;
   assign uio_out[7] = VGND;

   assign uio_oe[0] = VGND;
   assign uio_oe[1] = VGND;
   assign uio_oe[2] = VGND;
   assign uio_oe[3] = VGND;
   assign uio_oe[4] = VGND;
   assign uio_oe[5] = VGND;
   assign uio_oe[6] = VGND;
   assign uio_oe[7] = VGND;
    
   
endmodule
