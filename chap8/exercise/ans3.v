module ans3;

reg [3:0] A,B;
reg [2:0] SEL;

reg [4:0] OUT ; //5 bit output 

always @( A or B or SEL)
begin 
OUT = alu(A,B,SEL); // function   
$display($time," A:%b || B:%b || SEL :%b || OUT :%b",A,B,SEL,OUT);
end 


//stimulus generation : Select 
initial 
begin 
integer i;
for(i=0;i<8;i++)
begin SEL=i; #10;
end
end

//stimus generation : A and B 
initial 
begin 
integer i;
i=0;
while(i<1000)
begin 
{A,B}=i; #10 ;
i+=10;
end
end


//simulation completion 

initial 
#100 $finish ;

//FUNCTION ALU
function [4:0] alu;
input [3:0] a,b;
input [2:0] select ;

case (select)

3'b000 : alu=a;
3'b001: alu = a+b;
3'b010 : alu = a-b;
3'b011 : alu = a/b;
3'b100 : alu = a %1 ;
3'b101 : alu = a<< 1;
3'b110 : alu = a>>1;
3'b111 : alu=a>b ;


default : alu =5'b0;  
endcase
endfunction

endmodule 
