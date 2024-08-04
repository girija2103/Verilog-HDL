module test_bench;

reg M , N , P , Q ;

wire OUT ;


//instantiation 
ans1 a1(M, N , P , Q , OUT);


//initialisation 
initial 
{M,N,P,Q}=4'b0;


//stimulus generation 
initial 
begin 

integer i ;

for(i=0;i<16 ;i++)begin 
{M,N,P,Q}=i;
#19;

end
end

//monitor 
initial 
$monitor($time," M:%b | N :%b || P :%b || Q:%b || OUT :%b ",M,N,P,Q,OUT);
endmodule


//path delay model 
module ans1(m,n,p,q,out);

input m,n,p,q;
output out ;

wire e,f;

//specify 
specify

(m=>out)= 15;
(n=>out)= 15;
(p=>out)= 12;
(q=>out)= 12;
endspecify

assign  e = m & n ;
assign f = p & q ;
assign  out = e & f ;

endmodule
