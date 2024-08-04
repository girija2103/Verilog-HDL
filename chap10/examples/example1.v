//distributed delays in gate level modelling
module M(a,b,c,d,out);
input a ,b,c,d;
output out ;

wire e,f;

//delay is distributed to each gate 

and #5 a1(e,a,b);
and #7 a2(f,c,d);
and #4 a3 (out,e,f);

endmodule


//distributed delays in data level modelling 


module M2 (out , a,b,c,d);

output out ;

input a,b,c,d;

wire e,f;

//distributed delay in each expression 
assign #5 e = a & b ;
assign #7 f = c & d; 
assign #4 out = e & f;

endmodule 
