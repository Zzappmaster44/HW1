`timescale 1ns/1ns
module divider (Q,R,A,B);
  output reg signed [3:0] Q,R;
  input signed      [3:0] A,B;
  
  reg  signed       [3:0] _R,_M,_Q;
  /*
  initial
    begin
      _R =  4'b0;
      _M =  B;
      _Q =  A;
    end
  */
  always @(A or B)
    begin
      _R =  4'b0;
      _M =  B;
      _Q =  A;
      repeat(4)
        begin
          {_R,_Q} = {_R,_Q} << 1;
           _R     =  _R     - _M;
          if(_R < 0)
            begin
              _Q[0] = 1'b0;
              _R    =  _R     + _M; 
            end
          else
              _Q[0] = 1'b1;
        end
      Q <=  _Q;
      R <=  _R;
    end
  
endmodule