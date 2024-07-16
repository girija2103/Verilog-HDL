//asynchronous negative edge triggered DFF. Time Period : 5 units

module ans8;

reg D,CLK,CLR;
wire Q;

//monitor
initial
$monitor($time," D: %b || CLK:%b || CLR :%b || Q:%b", D,CLK,CLR,Q);


//instantiation
dff d1(.q(Q),.d(D),.clock(CLK),.clear(CLR));

//value assignment
initial
begin
CLK=1'b0;
forever #5 CLK=~CLK;
end

initial
begin
CLR=1'b0;#10;
CLR=1'b1;#10;
CLR=1'b0;#20;
CLR=1'b1;#20;
CLR=1'b0;#10;
CLR=1'b1;#10;
CLR=1'b0;#20;
CLR=1'b1;#20;
end

initial
begin

D=1'b1;#5;
D=1'b0;#5;
D=1'b1;#15;
D=1'b0;#15;
D=1'b1;#25;
D=1'b0;#25;
D=1'b1;#35;
D=1'b0;#35;
end

initial
#200 $finish;
endmodule

module dff(q,d,clock,clear);

output q;
input d;
input clock,clear;

reg q; //output declared as reg

always@(posedge clear or negedge clock)
begin
if(clear) q=1'b0;

else q=d;
end

endmodule
