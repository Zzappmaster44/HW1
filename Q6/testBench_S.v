`timescale 1ns/1ns
`include "prob6_structual.v"
module testBench_S;
  
  reg   E,W,clk;
  wire  out;
  
  //Structual model simulation
  prob6_structual   DUT   (.OUT(out), .E(E), .W(W), .clk(clk));
  
  //Run clock
  always forever
    begin
      #10 clk = ~clk;
    end
  
  
  initial
    begin
      //Start in state 0,0 for 2 clock posedges
      clk = 1'b0;
      E   = 1'b0;
      W   = 1'b0;
      #40
      //Move to state 0,1
      W   = 1'b1;
      #20
      //Stay in state 0,1 (stable input)
      W   = 1'b0;
      #20
      //Move to state 1,1
      E   = 1'b1;
      #20
      //Stay in state 1,1 (stable input)
      W   = 1'b1;
      #20
      //Stay in state 1,1 (stable input)
      E   = 1'b0;
      #20
      //Move to state 0,0
      W   = 1'b0;
      #20
      //Move to state 1,1
      E   = 1'b1;
      W   = 1'b1;
      #20
      //Move to state 0,0
      E   = 1'b0;
      W   = 1'b0;
      #20
      //Move to state 0,1 for 2 clock posedges (stable input)
      E   = 1'b1;
      #40
      //Stay in state 0,1 (stable input)
      E   = 1'b0;
      #20
      //Move to state 1,1
      W   = 1'b1;
      #50
      $finish;
    end
  
endmodule