//repeat loop , delay the statement a=a+1 by 20 positive edges of the clock 

module ans16;

reg [3:0] a=4'b0;
reg CLK;
//monitor
initial
$monitor($time," a:%b || CLK:%b ",a,CLK);

//clk initialisation
initial
begin
CLK=1'b0;
forever #5 CLK=~CLK;
end

//stimulus : repeat loop
initial
begin
  repeat(20)@(posedge CLK);
  
a=a+1'b1;
end

initial

#400 $finish;
endmodule
