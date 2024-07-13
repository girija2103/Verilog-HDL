module main;
reg A,B;
reg [2:0] OUTPUT;
//instantiation 

my_and AND(.out_and(OUTPUT[0]),.a(A),.b(B));
my_not NOT(.out_not(OUTPUT[1]),.a(A));
my_or OR(.out_or(OUTPUT[2]),.a(A),.b(B));

initial
begin
    $monitor($time , "  A : %b ||  B : %b || AND : %b ||  OR : %b || NOT(A) : %b ", A, B , OUTPUT[0],OUTPUT[2],OUTPUT[1] );
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

