`timescale 1ns/1ns
`include "prob6_behavoiral.v"
module testBench_B;
  
  reg   E,W,clk;
  wire  out;
  
  prob6_behavoiral   DUT   (.OUT(out), .E(E), .W(W), .clk(clk));
  
  always forever
    begin
      #10 clk = ~clk;
    end
  
  initial
    begin
      clk = 1'b0;
      E   = 1'b0;
      W   = 1'b0;
      #40
      W   = 1'b1;
      #20
      W   = 1'b0;
      #20
      E   = 1'b1;
      #20
      W   = 1'b1;
      #20
      E   = 1'b0;
      #20
      W   = 1'b0;
      #20
      E   = 1'b1;
      W   = 1'b1;
      #20
      E   = 1'b0;
      W   = 1'b0;
      #20
      E   = 1'b1;
      #40
      E   = 1'b0;
      #20
      W   = 1'b1;
      #50
      $finish;
    end
  
endmodule