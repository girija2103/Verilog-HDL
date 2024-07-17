//8 bit ALU 4 bit inputs a,b ,3 bit select input 
module ans12;

reg [3:0] A,B;
reg [2:0] SELECT;

wire [4:0] OUT;

//monitor
initial
$monitor($time," A:%b || B:%b || SELECT:%b || OUT :%b ", A,B,SELECT,OUT);

//instantiation
alu alu1(.out(OUT),.select(SELECT),.a(A),.b(B));

//stimulus generation
initial
begin
A=4'b1001; B=4'b0; SELECT=3'b000;#10;
A=4'b1001; B=4'b0001; SELECT=3'b001;#10;
A=4'b1111; B=4'b0001; SELECT=3'b010;#10;
A=4'b1000; B=4'b0010; SELECT=3'b011;#10;
A=4'b1001; B=4'b0010; SELECT=3'b100;#10;
A=4'b0111; B=4'b0; SELECT=3'b101;#10;
A=4'b1110; B=4'b0; SELECT=3'b110;#10;
A=4'b1101; B=4'b0001; SELECT=3'b111;#10;
end

endmodule

module alu(out,select,a,b);

output [4:0] out;
input [3:0] a,b;
input [2:0] select;

reg [4:0] out;

always@( select or a or b)
case(select)

3'b000 : out=a;
3'b001 : out = a+b;
3'b010 : out = a-b;
3'b011 : out = a/b;
3'b100 : out = a%b ;
3'b101 : out = a << 1;
3'b110 : out = a>> 1;
3'b111 : out =(a>b);
default :out = 5'b0;


endcase


endmodule
