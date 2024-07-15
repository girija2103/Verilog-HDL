module main ;

reg IN, S0,S1;
wire OUT0,OUT1,OUT3,OUT4;

//instantiation
demultiplexer1_to_4 demux1(.out0(OUT0),.out1(OUT1),.out2(OUT2),.out3(OUT3),.in(IN),.s0(S0),.s1(S1));

//monitor the changes

initial 
begin 

$monitor($time," IN: %b|| S1: %b|| S0: %b|| OUT0: %b|| OUT1: %b|| OUT2: %b|| OUT3: %b",IN,S1,S0,OUT0,OUT1,OUT2,OUT3);

end

initial
begin
IN = 1'b1; S1=1'b0;S0=1'b0;#5;
IN = 1'b0; S1=1'b0;S0=1'b1;#5;
IN = 1'b1; S1=1'b1;S0=1'b0;#5;
IN = 1'b1; S1=1'b1;S0=1'b0;#5;
IN = 1'b1; S1=1'bx;S0=1'b0;#5;
IN = 1'b1; S1=1'b0;S0=1'bx;#5;
IN = 1'b1; S1=1'bz;S0=1'b0;#5;
IN = 1'b1; S1=1'b0;S0=1'bz;#5;
IN = 1'b1; S1=1'bx;S0=1'bz;#5;
IN = 1'b1; S1=1'bx;S0=1'bx;#5;
IN = 1'b1; S1=1'bz;S0=1'bz;#5;

end
endmodule



module demultiplexer1_to_4(out0,out1,out2,out3,in,s0,s1);


output out0,out1,out2,out3;
reg out0,out1,out2,out3;


input in,s0,s1;

always @(s1 or s0 or in)
case ({s1,s0})//switch based on control signals

2'b00 : 
begin
out0=in;out1=1'bz;out2=1'bz;out3=1'bz;
end

2'b01 : 
begin
out0=1'bz;out1=in;out2=1'bz;out3=1'bz;
end

2'b10 : 
begin
out0=1'bz;out1=1'bz;out2=in;out3=1'bz;
end

2'b11 : 
begin
out0=1'bz;out1=1'bz;out2=1'bz;out3=in;
end

//to account for unknown signals on select / if any signal is x->o/p is x
//if one is x and the other is z ,x gets higher priority


2'bx0,2'bx1,2'b0x,2'b1x,2'bxx,2'bxz,2'bzx:
begin
out0=1'bx;out1=1'bx;out2=1'bx;out3=1'bx;
end

2'b0z,2'b1z,2'bz0,2'bz1,2'bzz:
begin
out0=1'bz;out1=1'bz;out2=1'bz;out3=1'bz;
end


default : $display("Unspecified Control signals");


endcase

endmodule
