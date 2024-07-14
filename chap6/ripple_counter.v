module main;

reg CLK,CLR;
wire [3:0] Q;

//instantiation of the ripple counter
ripple_counter rc1(Q,CLK,CLR);

//monitor
initial
begin
$monitor($time,"  Q:%b || CLK :%b || CLR :%b", Q[3:0],CLK,CLR);
end

initial
begin
  CLR=1'b1;
  #34 CLR=1'b0;
  #200 CLR=1'b1;
  #50 CLR=1'b0;
end

//set up the clock to toggle after every 10 time units
initial
begin
CLK=1'b0;
forever #10 CLK=~CLK;
end

//finish the simulation at time 400

initial
begin

  #400 $finish;
end
endmodule


module ripple_counter(Q,clock,clear);

//input and output declaration
output [3:0] Q;
input clock,clear;

tff t0(.clock(clock),.clear(clear),.q(Q[0]));
tff t1 (.clock(Q[0]),.q(Q[1]),.clear(clear));
tff t2(.clock(Q[1]),.clear(clear),.q(Q[2]));
tff t3(.clock(Q[2]),.clear(clear),.q(Q[3]));

endmodule



module tff(q,clear,clock);

//inputs and ouptuts declaration
output q;
input clock,clear;

//instantiate the edge triggered dff
//complement of output is fed back to the input
dff d1(.q(q),.d(~q),.clock(clock),.clear(clear));

endmodule




module dff(q,qbar,d,clear,clock);

//inputs and outputs
output q,qbar;
input clear,d,clock;

//Internal variables
wire r,rbar,s,sbar,cbar;

//dataflow statements
//creating complement of signal clear
assign cbar=~clear;

//input latches, a latch is level sensitive. flip flop is edge sensitive ( using 3 sr latches)

assign sbar = ~(rbar & s),
       s = ~(sbar &cbar & ~clock),
       r = ~(s & (~clock) & rbar),
       rbar = ~(r & cbar & d);

//output latch 

assign q = ~( s & qbar),
       qbar = ~( cbar & r & q);

endmodule
