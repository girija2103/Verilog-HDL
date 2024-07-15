module main;

reg [3:0] I;
reg [1:0] S;
wire OUT ;


//instantiation 

mux_4 m1(.out(OUT),.i0(I[0]),.i1(I[1]),.i2(I[2]),.i3(I[3]),.s0(S[0]),.s1(S[1]));
initial 
begin

$monitor($time,"I0=%b || I1=%b || I2=%b || I3=%b || S0=%b || S1=%b || OUT=%b ", I[0],I[1],I[2],I[3],S[0],S[1],OUT);
end

initial begin
  I[0]=1'b1;I[1]=1'b0;I[2]=1'b0;I[3]=1'b0;S[1]=1'b0;S[0]=1'b0;#5;
  I[0]=1'b0;I[1]=1'b1;I[2]=1'b0;I[3]=1'b0;S[1]=1'b0;S[0]=1'b1;#5;
  I[0]=1'b1;I[1]=1'b1;I[2]=1'b0;I[3]=1'b0;S[1]=1'b1;S[0]=1'b0;#5;
  I[0]=1'b0;I[1]=1'b0;I[2]=1'b0;I[3]=1'b1;S[1]=1'b1;S[0]=1'b1;
end

endmodule


module mux_4(out,i0,i1,i2,i3,s0,s1);

output out;
input i0,i1,i2,i3,s0,s1;
reg out;

always @(i0 or i1 or i2 or i3 or s0 or s1)
case({s1,s0})//switch based on the concantenation of the signals

  2'd0 : out = i0;
  2'd1 : out = i1;
  2'd2 : out = i2;
  2'd3 : out = i3;
endcase


  
endmodule

