`timescale 1ns/1ns
`include  "full_add.v"
`include  "half_add.v"
module Multi_5 (P,A,B);
  output  [9:0]   P;
  input   [4:0]   A,B;
  
  wire    addends [9:0][0:15];
  wire    [63:0]  w;
  
  and       g0[4:0]   (addends[0][0:4],B[0],A);
  and       g1[4:0]   (addends[1][1:5],B[1],A);
  and       g2[4:0]   (addends[2][2:6],B[2],A);
  and       g3[4:0]   (addends[3][3:7],B[3],A);
  and       g4[4:0]   (addends[4][4:8],B[4],A);
  and       g5[4:0]   (addends[5][5:9],B[4],A);
  and       g6[4:0]   (addends[6][6:10],B[4],A);
  and       g7[4:0]   (addends[7][7:11],B[4],A);
  and       g8[4:0]   (addends[8][8:12],B[4],A); 
  
  assign    addends[0][8] = addends[0][4];
  assign    addends[0][7] = addends[0][4];
  assign    addends[0][6] = addends[0][4];
  assign    addends[0][5] = addends[0][4];
  
  assign    addends[1][8] = addends[1][5];
  assign    addends[1][7] = addends[1][5];
  assign    addends[1][6] = addends[1][5];
  
  assign    addends[2][8] = addends[2][6];
  assign    addends[2][7] = addends[2][6];
  
  assign    addends[3][8] = addends[3][7];
  
  assign    addends[1][0] = 1'b0;
  
  assign    addends[2][0] = 1'b0;
  assign    addends[2][1] = 1'b0;
  
  assign    addends[3][0] = 1'b0;
  assign    addends[3][1] = 1'b0;
  assign    addends[3][2] = 1'b0;
  
  assign    addends[4][0] = 1'b0;
  assign    addends[4][1] = 1'b0;
  assign    addends[4][2] = 1'b0;
  assign    addends[4][3] = 1'b0;
  
  assign    P[0] = addends[0][0];
  
  half_add  HA1 (.S(P[1]), .C(w[0]), .A(addends[0][1]), .B(addends[1][1]));
  full_add  FA1 (.sum(w[8]), .cOut(w[1]), .A(addends[0][2]), .B(addends[1][2]), .cIn(w[0]));
  full_add  FA2 (.sum(w[9]), .cOut(w[2]), .A(addends[0][3]), .B(addends[1][3]), .cIn(w[1]));
  full_add  FA3 (.sum(w[10]), .cOut(w[3]), .A(addends[0][4]), .B(addends[1][4]), .cIn(w[2]));
  full_add  FA4 (.sum(w[11]), .cOut(w[4]), .A(addends[0][5]), .B(addends[1][5]), .cIn(w[3]));
  full_add  FA5 (.sum(w[12]), .cOut(w[5]), .A(addends[0][6]), .B(addends[1][6]), .cIn(w[4]));
  full_add  FA6 (.sum(w[13]), .cOut(w[6]), .A(addends[0][7]), .B(addends[1][7]), .cIn(w[5]));
  full_add  FA7 (.sum(w[14]), .cOut(w[7]), .A(addends[0][8]), .B(addends[1][8]), .cIn(w[6]));
  
  half_add  HA2 (.S(P[2]), .C(w[15]), .A(w[8]), .B(addends[2][2]));
  full_add  FA8 (.sum(w[22]), .cOut(w[16]), .A(w[9]), .B(addends[2][3]), .cIn(w[15]));
  full_add  FA9 (.sum(w[23]), .cOut(w[17]), .A(w[10]), .B(addends[2][4]), .cIn(w[16]));
  full_add  FA10 (.sum(w[24]), .cOut(w[18]), .A(w[11]), .B(addends[2][5]), .cIn(w[17]));
  full_add  FA11 (.sum(w[25]), .cOut(w[19]), .A(w[12]), .B(addends[2][6]), .cIn(w[18]));
  full_add  FA12 (.sum(w[26]), .cOut(w[20]), .A(w[13]), .B(addends[2][7]), .cIn(w[19]));
  full_add  FA13 (.sum(w[27]), .cOut(w[21]), .A(w[14]), .B(addends[2][8]), .cIn(w[20]));
  
  half_add  HA3 (.S(P[3]), .C(w[28]), .A(w[22]), .B(addends[3][3]));
  full_add  FA14 (.sum(w[34]), .cOut(w[29]), .A(w[23]), .B(addends[3][4]), .cIn(w[28]));
  full_add  FA15 (.sum(w[35]), .cOut(w[30]), .A(w[24]), .B(addends[3][5]), .cIn(w[29]));
  full_add  FA16 (.sum(w[36]), .cOut(w[31]), .A(w[25]), .B(addends[3][6]), .cIn(w[30]));
  full_add  FA17 (.sum(w[37]), .cOut(w[32]), .A(w[26]), .B(addends[3][7]), .cIn(w[31]));
  full_add  FA18 (.sum(w[38]), .cOut(w[33]), .A(w[27]), .B(addends[3][8]), .cIn(w[32]));
  
  half_add  HA4 (.S(P[4]), .C(w[39]), .A(w[34]), .B(addends[4][4]));
  full_add  FA19 (.sum(w[44]), .cOut(w[40]), .A(w[35]), .B(addends[4][5]), .cIn(w[39]));
  full_add  FA20 (.sum(w[45]), .cOut(w[41]), .A(w[36]), .B(addends[4][6]), .cIn(w[40]));
  full_add  FA21 (.sum(w[46]), .cOut(w[42]), .A(w[37]), .B(addends[4][7]), .cIn(w[41]));
  full_add  FA22 (.sum(w[47]), .cOut(w[43]), .A(w[38]), .B(addends[4][8]), .cIn(w[42]));
  
  half_add  HA5 (.S(P[5]), .C(w[48]), .A(w[44]), .B(addends[5][5]));
  full_add  FA23 (.sum(w[52]), .cOut(w[49]), .A(w[45]), .B(addends[5][6]), .cIn(w[48]));
  full_add  FA24 (.sum(w[53]), .cOut(w[50]), .A(w[46]), .B(addends[5][7]), .cIn(w[49]));
  full_add  FA25 (.sum(w[54]), .cOut(w[51]), .A(w[47]), .B(addends[5][8]), .cIn(w[50]));
  
  half_add  HA6 (.S(P[6]), .C(w[55]), .A(w[52]), .B(addends[6][6]));
  full_add  FA26 (.sum(w[58]), .cOut(w[56]), .A(w[53]), .B(addends[6][7]), .cIn(w[55]));
  full_add  FA27 (.sum(w[59]), .cOut(w[57]), .A(w[54]), .B(addends[6][8]), .cIn(w[56]));
  
  half_add  HA7 (.S(P[7]), .C(w[60]), .A(w[58]), .B(addends[7][7]));
  full_add  FA28 (.sum(w[62]), .cOut(w[61]), .A(w[59]), .B(addends[7][8]), .cIn(w[60]));
  
  half_add  HA8 (.S(P[8]), .C(w[63]), .A(w[62]), .B(addends[8][8]));
  
  xor       x1  (P[9], A[4], B[4]);
  
endmodule