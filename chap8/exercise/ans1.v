//calculate the factorial: 4 bit number 
//output is a 32 bit number 

module ans1;

reg [3:0] NUM;
reg [31:0] FACT;

always@(NUM)
begin 
//function call 
FACT= factorial(NUM);
$display ($time," NUM:%d || FACTORIAL:%d ",NUM,FACT);
end

//stimulus generation 
initial 
begin 
integer i ;
for(i =0;i<15;i++)
begin 
NUM=i;#10;
end
end

//simulation end
initial
#160 $finish;

function [31:0] factorial;
input [3:0] number;

integer i;
factorial=1;
for(i=1;i<=number;i++)
begin 
factorial=factorial*i;
end

endfunction
endmodule
