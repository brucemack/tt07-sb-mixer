// Simple D flip-flop
// Bruce Macinnon 28-May-2024
// Tiny Tapeout 7
//
module dflipflop(d, clk, async_reset, q);
  
  input d, clk, async_reset;
  output reg q;

  always @(posedge clk or negedge async_reset) 
  begin
    if (async_reset == 0)
      q <= 0;
    else 
      q <= d; 
  end 

endmodule // dflipflop
