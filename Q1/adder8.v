`timescale 1ns/1ns
`include "adder.v"
module adder8 (sum, cOut, A, B, cIn);
  
  output [7:0] sum;
  output       cOut;
  input  [7:0] A, B;
  input        cIn;
  
  wire [6:0] cBetween;
  
  adder add[7:0] (.sum(sum), .cOut({cOut, cBetween}), .A(A), .B(B), .cIn({cBetween, cIn}));
  
endmodule
