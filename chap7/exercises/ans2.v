//clock : time period 40 time units : DUTY CYLE : 25%  : 10 time units

module ans2;

reg CLOCK;

//monitor 
initial
$monitor($time," CLOCK: %b ",CLOCK);


//value assignment
initial
CLOCK=1'b0;

always
begin
#30 CLOCK=~CLOCK;
#10 CLOCK=~CLOCK;
end

initial
#400 $finish;

endmodule
