module main;

reg IN0,IN1,S;
wire OUT;

//instantiation
multiplexer_2_1 multi1(.out(OUT),.in0(IN0),.in1(IN1),.s(S));

//monitor
initial
begin
$monitor($time," S:%b || IN0:%b || IN1:%b , OUT:%b ",S,IN0,IN1,OUT);
end

//assignment of values
initial
begin
S=1'b0;IN1=1'b0;IN0=1'b0;
//#7;
S=1'b0;IN1=1'b0;IN0=1'b1;
#7;
S=1'b0;IN1=1'b1;IN0=1'b0;
#7;
S=1'b0;IN1=1'b1;IN0=1'b1;
#7;
S=1'b1;IN1=1'b0;IN0=1'b0;
#7;
S=1'b1;IN1=1'b0;IN0=1'b1;
#7;
S=1'b1;IN1=1'b1;IN0=1'b0;
#7;
S=1'b1;IN1=1'b1;IN0=1'b1;


end

endmodule



module multiplexer_2_1(out,in0,in1,s);

output out;
input s,in0,in1;
wire out1;
wire out2;

bufif0  #(1:2:3, 3:4:5, 5:6:7) b1(out1,in0,s);//output, input , control
bufif1  #(1:2:3, 3:4:5, 5:6:7) b2(out2,in1,s); //(rise,fall,turnoff)

or gate(out,out1,out2);

endmodule
