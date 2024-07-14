//CONDITIONAL OPERATORS
module main;

reg IN0,IN2,IN3,IN1,S0,S1;
wire OUT ;

//instantiation 
multiplexer_4_1 m1(.out(OUT),.in0(IN0),.in1(IN1),.in2(IN2),.in3(IN3),.s0(S0),.s1(S1));


initial
begin
$monitor($time," S0=%b|| S1=%b || I0=%b || I1=%b || I2=%b || I3=%b || OUT=%b",S0,S1,IN0,IN1,IN2,IN3,OUT);
end


//assigment of DUT values
initial
begin 
  IN0=0;IN1=0;IN2=1;IN3=1;
  S0=0;S1=0; #5;

   IN0=0;IN1=0;IN2=1;IN3=1;
  //IN0=1;IN1=0;IN2=1;IN3=1;
  S0=0;S1=1; #5;

   IN0=0;IN1=0;IN2=1;IN3=1;
  //IN0=1;IN1=0;IN2=1;IN3=0;
  S0=1;S1=0; #5;

   IN0=0;IN1=0;IN2=1;IN3=1;
  //IN0=1;IN1=1;IN2=1;IN3=1;
  S0=1;S1=1; #5;
end
endmodule


module multiplexer_4_1(out , in0,in1,in2,in3,s0,s1);
output out;
input in0,in1,in2,in3,s0,s1;

assign out = s0?(s1?in3:in2):(s1?in1:in0);

endmodule
