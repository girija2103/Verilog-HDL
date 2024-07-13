module main;

reg SET,RESET;

reg Q;

//instantiation

srLatch sr1(.q(Q),.set(SET),.reset(RESET));

//monitor

initial
begin
$monitor($time,"  Q:%b,SET:%b, RESET:%b",Q,SET,RESET);
end

initial
begin
SET=1'b0;RESET=1'b0;
#3;
SET=1'b0;RESET=1'b1;
#3;
SET=1'b1;RESET=1'b0;
#3;
SET=1'b1;RESET=1'b1;
#3;
SET=1'b1;RESET=1'b0;
#3;
SET=1'b0;RESET=1'b0;
end

endmodule



module srLatch(q,set,reset);
output q;
input set,reset;
//assign q=1'b0;
wire q_bar;
//wire q_wire;
//assign q_bar=1'b0;
nor #(1) nor1(q,reset,q_bar);

nor #(1) nor2(q_bar,q,set);

endmodule
