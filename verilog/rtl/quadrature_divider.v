// Quadrature Divider
// Bruce MacKinnon 28-May-2024
// Tiny Tapeout 7
//
// Takes the clock, divides by 4, and provides outputs a two phases: 0
// degrees and 90 degrees.
//
`default_nettype none
module quadrature_divider(
  input  wire clk,
  input  wire n_rst,
  output wire out_i,
  output wire out_q
  );
   
    wire out_0;
    wire out_1;
    wire in_0 = !out_0;
    wire in_1 = !out_1;
    // In-phase and quadrature outputs
    assign out_i = !out_1 & !out_0;
    assign out_q = !out_1 & out_0;

    // Instantiate the level 0 flip-flop
    dflipflop f0(in_0, clk, n_rst, out_0);
    // Level 1 gets clocked by level 0
    dflipflop f1(in_1, out_0, n_rst, out_1);

endmodule
