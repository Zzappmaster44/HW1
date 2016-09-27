`timescale 1ns/1ns
module  prob6_behavoiral  (OUT,E,W,clk);
  output    OUT;
  input     E,W,clk;
  
  reg       A,B;
  wire      tempA,tempB;
  
  assign  OUT = ~A & ~B;
  
  assign  tempA = E | A & ~B | A & W;
  assign  tempB = W | B & ~A | B & E;
  
  initial
    begin
      A <=  1'b0;
      B <=  1'b0;
    end
  
  always  @(posedge clk)
  begin
    A <= tempA;
    B <= tempB;
  end
  
endmodule