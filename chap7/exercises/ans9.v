//negative level triggered latch
module ans9;
reg D,CLK;
wire Q;

//monitor
initial
$monitor($time," D:%b || CLK:%b || Q:%b ",D,CLK,Q);

//instantiation
level_sensitive_latch l1(.q(Q),.d(D),.clock(CLK));

//stimulus generation

//clock
initial
begin
  CLK=1'b0;
  forever #10 CLK=~CLK;
end

//D 

initial
begin
  D=1'b0; #5;
  D=1'b1; #5;

  D=1'b0; #15;
  D=1'b1; #15;

  D=1'b0; #25;
  D=1'b1; #25;
  
  D=1'b0; #35;
  D=1'b1; #35;

end

initial
#200 $finish;

endmodule

module level_sensitive_latch(q,d,clock);

output q;
input d,clock;

reg q;

always@(clock or d)
begin
if(clock==1'b1)begin

  wait(clock==1'b0);//wait until clock goes low
  q=d; //update the output q to the value of the D
end
end

endmodule

