`timescale 1ns/1ns
`include "add_3.v"
module CSA_bit #(parameter W=1)(S,C,X,Y,Z);
  output  [W:0]   S,C;
  input   [W-1:0] X,Y,Z;
  
  wire    [W-1:0] wireS, wireC;
  reg     [W:0]   fS, fC;
    
  add_3 adder[W-1:0]  (.S(wireS), .C(wireC), .X(X), .Y(Y), .Z(Z));
  
  initial
    begin
      assign fS = W+1'b0;
      assign fC = W+1'b0;
    end
  
  always @(X or Y or Z)
    begin
      assign fS = {1'b0, wireS};
      assign fC = {wireC, 1'b0};
    end
    
  assign S = fS;
  assign C = fC;

endmodule