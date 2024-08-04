//full connection 
module M (a,b,c,d,out);

input a ,b,c,d;

output out ;

wire e,f;

//full connection 
specify

(a,b *>out) = 9 ;
(c,d *> out ) = 11 ; 

endspecify

//gate instantiation 
and a1(e,a,b);
and a2(f,c,d);
and a3(out,e,f);
endmodule
