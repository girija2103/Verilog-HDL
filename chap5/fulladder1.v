module main;

reg A,B,CIN;

reg SUM, COUT;

//instantiation 

f_adder1 f1(.sum(SUM),.cout(COUT),.a(A),.b(B),.cin(CIN));

//monitor
initial
begin
$monitor($time,"   A:%b || B:%b || CIN:%b || SUM:%b || COUT:%B",A,B,CIN,SUM,COUT );
end

initial
begin
A=1'b0;B=1'b0;CIN=1'b0;
#5;
A=1'b0;B=1'b0;CIN=1'b1;
#5;
A=1'b0;B=1'b1;CIN=1'b0;
#5;
A=1'b0;B=1'b1;CIN=1'b1;
#5;
A=1'b1;B=1'b0;CIN=1'b0;
#5;
A=1'b1;B=1'b0;CIN=1'b1;
#5;
A=1'b1;B=1'b1;CIN=1'b0;
#5;
A=1'b1;B=1'b1;CIN=1'b1;


end

endmodule


module f_adder1(sum,cout, a,b,cin);
output sum,cout;
input a,b,cin;


wire not_a;
wire not_b;
wire not_cin;

wire x1,x2,x3,x4;//sum components

wire y1,y2,y3; //cout components

//NOT A , NOT b
not(not_a,a);
not(not_b,b);
not(not_cin,cin);

//SUM INTERMEDIATES
and(x1,a,b,cin);
and(x2,not_a,b,not_cin);
and(x3,not_a,not_b,cin);
and(x4,a,not_b,not_cin);


//COUT INTERMEDIATES
and(y1,a,b);
and(y2,b,cin);
and(y3,a,cin);

//final SUMMATION
or(sum, x1,x2,x3,x4);
or(cout,y1,y2,y3);


endmodule
