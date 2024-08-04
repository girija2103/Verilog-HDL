module test_bench ;

reg A,B,C,D;

wire OUT ;


//instantiation 
M m1(A,B,C,D,OUT);


//initialisation 
initial 
{A,B,C,D} = 4'b0 ;

//stimulus generation 
initial 
begin 

integer i ;

for(i=0;i<2**(4);i++)
begin 
{A,B,C,D}= i ;
#10;

end
end

//monitor
initial 
$monitor ($time, " A:%b || B :%b || C:%b || D:%b || OUT :%b ",A,B,C,D,OUT);

endmodule



//Conditional Path delays 

module M (a,b,c,d,out);

input a ,b,c,d;
output out;

wire e,f;

//specify block with conditional pin to pin timing 
specify 

//different pin to pin based on the state of signal a 
if(a) (a=>out) = 9 ;
if (~a) (a=>out) = 10 ;


//conditional expression contains two signals b and c 

//if b&c true , delays =9 
//otherwise delay =13

if(b & c) (b=> out) = 9 ;
if (~(b & c)) ( b=>out)=13;

//use concantenation operation 
//use full connection 
if ({c,d}==2'b01)
//conditional path delays 
(c,d *> out )=11;
if({c,d}!=2'b01)
(c,d *> out )=13;

endspecify

and a1(e,a,b);
and a2(f,c,d);
and a3(out,e,f);
endmodule
