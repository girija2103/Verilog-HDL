module main;

reg CLR,CLK,COUNT_ENABLE;

wire[ 3:0] Q;

//instantiation of synchronous_counter

synchronous_4bit s1(.q(Q),.clear(CLR),.clock(CLK),.count_enable(COUNT_ENABLE));


initial
begin
$monitor($time," CLK:%b || CLR: %b || CNT_EN :%b || Q:%b", CLK,CLR,COUNT_ENABLE,Q[3:0]);
end

initial
begin
  CLR=1'b0;COUNT_ENABLE=1'b0;#34;
  CLR=1'b1;COUNT_ENABLE=1'b1;#700;
  CLR=1'b1;COUNT_ENABLE=1'b0;#20;
  CLR=1'b0;COUNT_ENABLE=1'b1;#80;
end

initial
begin

CLK=1'b0;forever #25 CLK=~CLK;

end


initial
begin
#900 $finish;
end
endmodule


module synchronous_4bit(q, clear, clock,count_enable);

output [3:0] q;
input clear,clock,count_enable;

//instantiation of jkff
jkff jk0(.q(q[0]),.j(count_enable),.k(count_enable),.clock(clock),.clear(clear));

wire stage_1 = (q[0] & count_enable);

jkff jk1(.q(q[1]),.j(stage_1),.k(stage_1),.clear(clear),.clock(clock));

wire stage_2= (q[1] & stage_1);
jkff jk2(.q(q[2]),.clear(clear),.clock(clock),.j(stage_2),.k(stage_2));


wire stage_3 = (q[2] & stage_2);
jkff jk3(.q(q[3]),.clear(clear),.clock(clock),.j(stage_3),.k(stage_3));

endmodule


module jkff(q,qbar,j,clear,k,clock);
output q,qbar;
input j,clear,k,clock;


wire a ,b,y,ybar,c,d;
wire cbar = ~(clock);

assign a = ~(qbar & j & clock & clear);

assign b = ~(clock & k & q);

assign y = ~(a & ybar);

assign ybar = ~(b & clear & y);

assign c = ~( y & cbar);

assign d = ~(cbar & ybar);

assign q= ~( c & qbar);

assign qbar = ~(d & clear & q);


endmodule
