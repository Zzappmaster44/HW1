`timescale 1ns/1ns
`include "adder8.v"
module testBench;
  
  reg  [7:0] A,B;
  reg        cIn;
  wire [7:0] Sum;
  wire       cOut;
  
  adder8 DUT (.sum(Sum), .cOut(cOut), .A(A), .B(B), .cIn(cIn));
  
  initial
    begin
      $monitor($time,,"A=%b, B=%b, cIn=%b, Sum=%b, cOut=%b",A,B,cIn,Sum,cOut);
      A = 8'b00000000;
      B = 8'b00000000;
      cIn = 1'b0;
      #100 
      // The largest delay on a single bit adder occurs when the inputs are 0 and 1 and there is a carry in. 
      // Thus the largest delay on an 8-bit ripple adder would be if one input became all 1's and the carry in signal was also 1, while the other input remained all 0's.(as given below)
      // This would propgate the carry through all adders causing the critical path. The resulting delay would be that the sum is valid after at most 18 gate delays or 180 clock cycles.
      A = 8'b11111111;
      cIn = 1'b1;
      #300
      $finish;
    end
  
endmodule
