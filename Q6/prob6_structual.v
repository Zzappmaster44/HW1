`timescale 1ns/1ns
`include "dff.v"
module prob6_structual (OUT,E,W,clk);
  output  OUT;
  input   E,W,clk;
  
  wire    w1,w2,w3,w4,A_D,B_D,A,B,_A,_B;
  
  and   g1  (w1,A,_B);
  and   g2  (w2,A,W);
  or    g3  (A_D,E,w1,w2);
  
  and   g4  (w3,B,_A);
  and   g5  (w4,B,W);
  or    g6  (B_D,W,w3,w4);
  
  dff   dffA  (.Q(A),._Q(_A),.D(A_D),.clk(clk));
  dff   dffB  (.Q(B),._Q(_B),.D(B_D),.clk(clk));
  
  and   g7  (OUT,_A,_B);
  
endmodule