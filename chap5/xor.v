module main;
reg A,B;
reg OUTPUT;
//instantiation 

my_xor xor1(.out_xor(OUTPUT),.x(A),.y(B));

initial
begin
    $monitor($time , "  A : %b ||  B : %b || XOR : %b ", A, B , OUTPUT);
end


initial 
begin
  //#5
  A=1'b0;
  B=1'b0;
  #5;

  A=1'b0;
  B=1'b1;
  #5;


  A=1'b1;
  B=1'b0;
  #5;

  A=1'b1;
  B=1'b1;
  
end
endmodule


//XOR
module my_xor(out_xor, x,y);

wire not_x ;
wire not_y ;

wire xbar_y;
wire ybar_x;

output out_xor;
input x,y;


//instantiation NOT 

my_not not1(.out_not(not_x), .a(x));
my_not not2(.out_not(not_y),.a(y));

//instantiation AND

my_and and1(.out_and(xbar_y),.a(not_x),.b(y));
my_and and2(.out_and(ybar_x),.a(x),.b(not_y));

//instantiation OR 

my_or or1(.out_or(out_xor),.a(xbar_y),.b(ybar_x));

endmodule



//AND
module my_and(out_and,a,b);

output out_and;
input a,b;
//intermediate
wire x;

//x=(a.b)'

nand(x,a,b);

nand(out_and,x,x);

endmodule

//NOT
module my_not(out_not , a);

output out_not;
input a;

nand(out_not,a,a);


endmodule


//OR
module my_or(out_or, a,b);

output out_or;
input a,b;

wire not_a,not_b;

nand(not_a,a,a);//a'
nand(not_b,b,b);//b'

nand(out_or,not_a,not_b);


endmodule

