`timescale 1ns/1ns
module add_3 (S,C,X,Y,Z);
  output  S,C;
  input   X,Y,Z;
  
  wire    w1,w2,w3,w4;
  
  xor g1  (w1,X,Y);
  xor g2  (S,w1,Z);
  
  and  g3  (w2,X,Y);
  and  g4  (w3,X,Z);
  and  g5  (w4,Y,Z);
  or  g6  (C,w2,w3,w4);
  
endmodule
  
  
  
  
  