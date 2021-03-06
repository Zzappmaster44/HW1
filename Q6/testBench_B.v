`timescale 1ns/1ns
`include "prob6_behavoiral.v"
module testBench_B;
  
  reg   E,W,clk;
  wire  out;
  
  //Behavoiral model simulation
  prob6_behavoiral   DUT   (.OUT(out), .E(E), .W(W), .clk(clk));
  
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
    
    //Part D)
    //Using modelsim I can verify that the parts A,B, and C are equivalent. B and C are equivalent if they are given the same input and I get the same output.
    //Part A is equivalent if the expected output and state matched the planned route through the state diagram that was given to the simulation.
  
endmodule