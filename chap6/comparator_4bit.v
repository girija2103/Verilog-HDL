module main;

reg [3:0] A,B;
wire A_GB, A_LB, A_EB;

//instantiation

comparator_4bit c1(.a(A),.b(B),.a_eb(A_EB),.a_lb(A_LB),.a_gb(A_GB));

//monitor
initial
begin
$monitor($time," A=%b || B=%b || A_EB = %b || A_LB=%b || A_GB=%b",A,B,A_EB,A_LB,A_GB);
end

initial 
begin

A=4'b1000;B=4'b1011;#5;

A=4'b0000;B=4'b1001;#5;

A=4'b1110;B=4'b1110;#5;

A=4'b1010;B=4'b0111;
end

endmodule


module comparator_4bit(a_gb,a_lb,a_eb,a,b);
output a_gb,a_lb,a_eb;
input [3:0]a,b;

wire x3= a[3] & b[3] || (~a[3] & ~b[3]);
wire x2= a[2] & b[2] || (~a[2] & ~b[2]);
wire x1= a[1] & b[1] || (~a[1] & ~b[1]);
wire x0= a[0] & b[0] || (~a[0] & ~b[0]);

assign a_gb= (a[3] & ~b[3]) || (x3 & a[2] & ~b[2]) || (x3 & x2 & a[1] & ~b[1]) || (x3 & x2 & x0 & a[0] & ~b[0]);
assign a_lb = (~a[3] & b[3]) || (~a[2] & b[2] & x3) || (~a[1] & b[1] & x2 & x3) || (~a[0] & b[0] & x1 & x2 & x3);
assign a_eb = (x3 & x2 & x1 & x0);
endmodule

