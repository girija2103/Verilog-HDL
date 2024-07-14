//USING : DATAFLOW OPERATORS
module main;

reg [3:0]A,B;
reg CIN;
wire [3:0] SUM;
wire COUT;

//instantiation

full_adder fa1(.cout(COUT),.sum(SUM),.a(A),.b(B),.cin(CIN));

//monitor
initial
begin
  $monitor($time," A: %b|| B: %b|| Cin: %b|| Sum: %b|| Cout: %b",A,B,CIN,SUM,COUT);
end

//assignment of values

initial
begin
A=4'b1011;B=4'b1001;CIN=1'b1;#5;

A=4'b0011;B=4'b1101;CIN=1'b0;#5;

A=4'b1010;B=4'b0001;CIN=1'b1;#5;

A=4'b1111;B=4'b1000;CIN=1'b0;
end

endmodule



module full_adder(cout,sum,a,b,cin);
output cout;
output [3:0] sum;
input [3:0] a,b;
input cin;

assign {cout,sum}= a+b+cin;


endmodule
