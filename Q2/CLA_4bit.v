`timescale 1ns/1ns
module CLA_4bit (SUM,cOut,A,B,cIn);
  output  [3:0] SUM;
  output        cOut;
  input   [3:0] A, B;
  input         cIn;
  
  wire [3:0] Prop,Gen,C;
  wire [9:0] w;      
  
  and #10 Generator[3:0]  (Gen, A, B);
  xor #20 Propogator[3:0] (Prop,A, B);
  
  assign C[0] = cIn;
  
  and #10 g1  (w[0], Prop[0], C[0]);
  or  #10 g2  (C[1], Gen[0], w[0]);
  
  and #10 g3  (w[1], Prop[1], Prop[0], C[0]);
  and #10 g4  (w[2], Gen[0], Prop[1]);
  or  #10 g5  (C[2], Gen[1], w[1], w[2]);
  
  and #10 g6  (w[3], Prop[0], Prop[1], Prop[2], C[0]);
  and #10 g7  (w[4], Prop[2], Prop[1], Gen[0]);
  and #10 g8  (w[5], Prop[2], Gen[1]);
  or  #10 g9  (C[3], w[3], w[4], w[5], Gen[2]);
  
  and #10 g10 (w[6], Prop[0], Prop[1], Prop[2], Prop[3], C[0]);
  and #10 g11 (w[7], Prop[3], Prop[2], Prop[1], Gen[0]);
  and #10 g12 (w[8], Prop[3], Prop[2], Gen[1]);
  and #10 g13 (w[9], Prop[3], Gen[2]);
  or  #10 g14 (cOut, w[6], w[7], w[8], w[9], Gen[3]);
  
  xor #20 sum[3:0] (SUM, Prop, C);
  
endmodule
