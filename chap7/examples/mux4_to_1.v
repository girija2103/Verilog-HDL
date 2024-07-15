//4-to-1 multiplexer. Behavioural construct

module main;

reg I0,I1,I2,I3;
reg S0,S1;
wire OUT;

//instantiation
mux4_to_1 m1(.out(OUT),.i0(I0),.i1(I1),.i2(I2),.i3(I3),.s0(S0),.s1(S1));

//monitor
initial
begin
$monitor($time," I0:%b|| I1:%b||I2:%b|| I3:%b||S0:%b|| S1:%b||OUT : %b",I0,I1,I2,I3,S0,S1,OUT);
end
//value assignment to the variables

initial
begin
I0=1'b1; I1=1'b0;I2=1'b0; I3=1'b0;S1=1'b0; S0=1'b0;
#5;

I0=1'b0; I1=1'b1;I2=1'b0; I3=1'b0;S1=1'b0; S0=1'b1;
#5;

I0=1'b0; I1=1'b0;I2=1'b1; I3=1'b0;S1=1'b1; S0=1'b0;
#5;

I0=1'b0; I1=1'b0;I2=1'b0; I3=1'b1;S1=1'b1; S0=1'b1;


end


endmodule

module mux4_to_1(out,i0,i1,i2,i3,s1,s0);

output out;
input i0,i1,i2,i3;
input s0,s1;

//output declared as register
reg out ;

//recompute the signal out if any changes
//all input signals that cause a recomputation of out to occur must go through the always @(..) //sensitivity list

always @( s1 or s0 or i0 or i1 or i2 or i3)

begin

case({s1,s0})
2'b00 : out = i0;
2'b01 : out = i1;
2'b10 : out = i2;
2'b11 : out = i3;
default :out =1'bx;
endcase

end


endmodule
