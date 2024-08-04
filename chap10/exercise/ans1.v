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


module ans1(m,n,p,q,out);

input m,n,p,q;
output out ;

wire e,f;

assign #11 e = m & n ;
assign #8 f = p & q ;
assign #4 out = e & f ;

endmodule
