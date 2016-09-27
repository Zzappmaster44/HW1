`timescale 1ns/1ns
`include "CSA_10_Nums.v"
module testBench;
  
  reg   [7:0]   A,B,C,D,E,F,G,H,I,J;
  wire  [15:0]  SUM;
  wire          CARRY;
  
  CSA_10_Nums   DUT   (.SUM(SUM), .CARRY(CARRY), .A(A), .B(B), .C(C), .D(D), .E(E), .F(F), .G(G), .H(H), .I(I), .J(J));
  
  initial
    begin
      $monitor($time,,"A=%d B=%d C=%d D=%d E=%d F=%d G=%d H=%d I=%d J=%d Sum=%d Carry=%d",A,B,C,D,E,F,G,H,I,J,SUM,CARRY);
      A = 8'd0;
      B = 8'd0;
      C = 8'd0;
      D = 8'd0;
      E = 8'd0;
      F = 8'd0;
      G = 8'd0;
      H = 8'd0;
      I = 8'd0;
      J = 8'd0;
      #100
      A = 8'd11;
      B = 8'd2;
      C = 8'd13;
      D = 8'd4;
      E = 8'd5;
      F = 8'd6;
      G = 8'd7;
      H = 8'd8;
      I = 8'd9;
      J = 8'd10;
      #100
      A = 8'd3;
      B = 8'd14;
      C = 8'd5;
      D = 8'd6;
      E = 8'd7;
      F = 8'd8;
      G = 8'd19;
      H = 8'd10;
      I = 8'd0;
      J = 8'd0;
      #100
      $finish;
    end
endmodule