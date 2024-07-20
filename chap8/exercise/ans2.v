//mutiplication of 2 4 bit numbers a and bit
//8 bit value 

module ans2;


reg [3:0] A,B;
reg [7:0] OUT;



function [7:0] multiplication ;

input [3:0] a,b;
begin
multiplication = a * b;
end
endfunction 

//initiliasation 
initial 
{A,B}=8'b0;

always@(A or B)
begin 
//function call
OUT = multiplication(A,B);
$display($time , " A:%d || B:%d || OUT:%d" ,A,B ,OUT);
end


//stimulus generation 
initial 
begin 
integer i ;
for(i =0;i<2**(8);i++)
begin 
{A,B} =i; #10;
end
end

initial 
#2600 $finish ;

endmodule 
