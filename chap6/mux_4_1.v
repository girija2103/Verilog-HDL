//LOGICAL METHOD
module main;

reg I0,I1,I2,I3;
reg S0,S1;
wire OUT;

//instantiation
mux_4_1 mux1(.out(OUT),.in0(I0),.in1(I1),.in2(I2),.in3(I3),.s0(S0),.s1(S1));

initial
begin
$monitor($time," S0=%b|| S1=%b|| I0=%b|| I1=%b|| I2=%b|| I3=%b|| OUT=%b",S0,S1,I0,I1,I2,I3,OUT);
end

initial
begin

I0=1;I1=1;I2=0;I3=1;
S0=0;S1=0;#5;

I0=0;I1=1;I2=0;I3=1;
S0=0;S1=1;#5;

I0=1;I1=1;I2=1;I3=1;
S0=1;S1=0;#5;

I0=1;I1=0;I2=0;I3=1;
S0=1;S1=1;#5;

end

endmodule



module mux_4_1(out,in0,in1,in2,in3,s0,s1);

output out;
input in0,in1,in2,in3;
input s0,s1;


assign out = ~s0 & ~s1 & in0 | ~s0 & s1 & in1 | s0 & ~s1 & in3 | s0 & s1 & in3 ;


endmodule
