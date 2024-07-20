module ans5;

reg [15:0] A;
reg PARITY,CLK;

always@(A or CLK)
begin 
parity(A,PARITY); //task call
$display($time, " A:%b || CLK :%b || PARITY :%b ",A,CLK,PARITY);
end

//clock
initial 
begin
CLK=1'b0;
forever #5 CLK=~CLK;
end

//stimulus generation 
initial 
begin 
A=16'd45; #25;
A=16'd445; #25;
A=16'd452; #25;A=16'd43225; #25;
A=16'd45222; #25;
A=16'd46452;
end

//simulation complete
initial 
#200 $finish;

task parity;
input [15:0] a;

output out;
repeat(3)@(posedge CLK );
out = ^(a);
endtask
endmodule
