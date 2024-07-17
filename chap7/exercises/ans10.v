//4-to-1 multiplexer using if and else statements

module ans10;

reg I0,I1,I2,I3;
reg S0,S1;

wire OUT;

//monitor 
initial
$monitor($time," I0:%b || I1:%b ||I2:%b || I3:%b || S0:%b || S1:%b || OUT:%b ",I0,I1,I2,I3,S0,S1,OUT);

//instantiation
mux4_to_1 m1(.out(OUT),.i0(I0),.i1(I1),.i2(I2),.i3(I3),.s0(S0),.s1(S1));

//stimulus generation
initial
begin
I0=1'b1;I1=1'b0;I2=1'b0;I3=1'b0;S1=1'b0;S0=1'b0; #10;
I0=1'b0;I1=1'b1;I2=1'b0;I3=1'b0;S1=1'b0;S0=1'b1; #10;
I0=1'b1;I1=1'b0;I2=1'b1;I3=1'b0;S1=1'b1;S0=1'b0; #10;
I0=1'b1;I1=1'b0;I2=1'b0;I3=1'b1;S1=1'b1;S0=1'b1; 
end

endmodule

module mux4_to_1(out,i0,i1,i2,i3,s0,s1);

output out;
input i0,i1,i2,i3;
input s0,s1;

reg out;

always@(i0 or i1 or i2 or i3 or s0 or s1)
if(s1==1'b0)begin
  if(s0==1'b0) 
    out=i0;
  else 
    out =i1;
end
else
begin
  if(s0==1'b0)
    out=i2;
  else 
    out =i3;
end

endmodule
