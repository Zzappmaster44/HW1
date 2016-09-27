`timescale 1ns/1ns
module half_add (S,C,A,B);
  output    S,C;
  input     A,B;
  
  xor   g1  (S,A,B);
  
  and   g2  (C,A,B);
  
endmodule