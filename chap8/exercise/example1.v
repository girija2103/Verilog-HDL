//define a module called operation that contains the task bitwise module operation 

module operation;

parameter delay =10;
reg [15:0] A,B;
reg [15:0] AB_AND,AB_OR,AB_XOR;

always @(A or B) //whenever A or B changes in value

begin
  //invoke the task bitwise_oper .provide 2 input arguments A and B 
  // expect 3 output argument AB_AND,AB_OR , AB_XOR
  // the arguments must be specified in the same order as they appear in the task declaration
    bitwise_oper(AB_AND,AB_OR,AB_XOR,A,B);
end

//monitor
initial
$monitor ($time ," A:%b || B:%b || AB_AND :%b || AB_OR:%b || AB_XOR:%b",A,B,AB_AND,AB_OR,AB_XOR);

//stimulus generation
initial
begin
A=16'd1024 ; B=16'd2048; #10;
A=16'd10024 ; B=16'd204; #15;
A=16'd1028 ; B=16'd208; #10;
A=16'd1 ; B=16'd2; #15;
A=16'd10 ; B=16'd20;
end

//define task bitwise_oper
task bitwise_oper;

output [15:0] ab_and,ab_or,ab_xor; //outputs from the task
input [15:0] a,b; //inputs to the task 

begin 
  #delay ab_and = a & b ;
  ab_or = a | b;
  ab_xor = a ^ b;
end
  
endtask

endmodule 
