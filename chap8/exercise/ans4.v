module ans4;


reg [3:0] A;
reg [31:0] OUT ;

always@( A)
begin 
factorial(A,OUT);
$display($time," A:%d || OUT :%d ",A,OUT);

end

//stimulus generation 

initial 
begin 
integer i ;
for(i=1;i<16;i++)
begin 
A=i ; #20;
end
end



task factorial;
input [3:0] a;
output [31:0] out ;
reg [31:0] x;
integer i ;

x =32'b01;
for(i=1;i<=a;i++)
begin 
x *=i ;
end
#10 out = x;
endtask

endmodule 
