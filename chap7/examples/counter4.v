//4 bit counter -> behavioural flow

module main;

reg CLR,CLK;
wire[3:0] Q;

//instantiation
counter c1(.q(Q),.clear(CLR),.clock(CLK));

//monitor
initial
begin
$monitor($time," CLEAR :%b|| CLOCK :%B|| Q:%b",CLR,CLK,Q);
end

// assignment of values to the signals
initial
begin
    CLK = 1'b0;
    CLR = 1'b0; #5;
    CLR = 1'b1; #1;
    CLR = 1'b0; #10;
    CLR = 1'b1; #5;
    CLR = 1'b0; #5;
    
end

always
begin
    #5 CLK = ~CLK;
end

initial
begin
    #150 $finish;
end
endmodule


module counter(q,clear,clock);

output[3:0] q;
input clear,clock;

//output defined as register
reg [3:0]q;

always @(posedge clear or negedge clock)
begin
if(clear)
  q=4'd0;
else 
  q= (q+1)%16;

end

endmodule
