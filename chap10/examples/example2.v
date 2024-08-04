// lumped delay modelling
module M(a,b,c,d,out);
input a ,b,c,d;
output out ;

wire e,f;

//delay is distributed to each gate 

and  a1(e,a,b);
and  a2(f,c,d);
and #11 a3 (out,e,f);

endmodule
