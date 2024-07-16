//negative edge triggered synchronous D Flip Flop. Time period : 10 time units

module ans7;
reg D,CLK,CLR;
wire Q;

//monitor
initial
$monitor($time," D:%b || CLK:%b || CLR:%b || Q:%b" , D,CLK,CLR,Q);

//instantiation
dff d1(.q(Q),.d(D),.clock(CLK),.clear(CLR));

//value assignment

initial
begin
CLK = 1'b0;
forever #5 CLK=~CLK; 
end

initial
begin 
CLR=1'b0; #15;
CLR =1'b1;#10;
CLR =1'b0; #10;
CLR=1'b1; #15;
CLR=1'b0;
end

initial 
begin
D=1'b1;#5;
D=1'b0;#5;
D=1'b1;#10;
D=1'b0;#10;
D=1'b1;#20;
D=1'b0;#20;
D=1'b1;#30;
D=1'b0;#30;
D=1'b1;#40;
D=1'b0;#40;
end

initial
#200 $finish;

endmodule


module dff(q, d,clock , clear);

output q;
input d,clock,clear;
reg q;

always@(negedge clock)
begin
  if(clear)
  q=1'b0;
  else
  q=d;
end
endmodule
