module M(a,b,c,d,out);

input a ,b,c,d;
wire e,f;
output out ;

//path delay modelling
specify

(a=>out) = 9 ;
(b=>out) = 9 ;
(c=>out) = 11 ;
(d=>out) = 11 ;

endspecify

//gate instantiation 
and a1(e,a,b);
and a2(f,c,d);
and a3(out,e,f);

endmodule
