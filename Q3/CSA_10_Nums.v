`timescale 1ns/1ns
`include "CSA_bit.v"
module CSA_10_Nums (SUM, CARRY, A,B,C,D,E,F,G,H,I,J);
  output  [15:0]  SUM;
  output          CARRY;
  input   [7:0]   A,B,C,D,E,F,G,H,I,J;
  
  reg     [16:0]  temp;
  
  wire    [8:0]   w1,w2;
  wire    [9:0]   w3,w4;
  wire    [10:0]  w5,w6;
  wire    [11:0]  w7,w8;
  wire    [12:0]  w9,w10;
  wire    [13:0]  w11,w12;
  wire    [14:0]  w13,w14;
  wire    [15:0]  w15,w16;
  
  // A total of 8 CSA's are need to add ten numbers becuase you will need 1 for the first three numbers and then 1 additional one for each next number.
  // That means generally speaking that you will need N-2 CSA's where N is the number of words you are adding.
  CSA_bit #(8)  adder1 (.S(w1), .C(w2), .X(A), .Y(B), .Z(C));
  CSA_bit #(9)  adder2 (.S(w3), .C(w4), .X(w1), .Y(w2), .Z({1'b0,D}));
  CSA_bit #(10)  adder3 (.S(w5), .C(w6), .X(w3), .Y(w4), .Z({2'b0,E}));
  CSA_bit #(11)  adder4 (.S(w7), .C(w8), .X(w5), .Y(w6), .Z({3'b0,F}));
  CSA_bit #(12)  adder5 (.S(w9), .C(w10), .X(w7), .Y(w8), .Z({4'b0,G}));
  CSA_bit #(13)  adder6 (.S(w11), .C(w12), .X(w9), .Y(w10), .Z({5'b0,H}));
  CSA_bit #(14)  adder7 (.S(w13), .C(w14), .X(w11), .Y(w12), .Z({6'b0,I}));
  CSA_bit #(15)  adder8 (.S(w15), .C(w16), .X(w13), .Y(w14), .Z({7'b0,J}));
  
  assign  SUM = temp[15:0];
  assign  CARRY = temp[16];
  
  always @(A or B or C or D or E or F or G or H or I or J)
    assign temp = w15 + w16;
  
endmodule