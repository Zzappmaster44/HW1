`timescale 1ns/1ns
`include  "divider.v"
module  testBench;
  
  reg   [3:0] A,B;
  wire  [3:0] Q,R;
  
  divider   DUT (.Q(Q), .R(R), .A(A), .B(B));
  
  initial
    begin
      //You will get a -1 quotient because you are dividing by 0
      A <=  4'b0;
      B <=  4'b0;
      #50
      A <=  4'd7;
      B <=  4'd2;
      #50
      A <=  4'd6;
      #50
      $finish;
    end
  
endmodule