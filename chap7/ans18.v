//8 bit counter from 5 to 67 
//disabled after counting only once 


module ans18;
reg [7:0] counter;
reg CLK;
initial
counter=8'b00000101;

always@ (posedge CLK)
begin : counter_block
begin
$display($time,"  COUNTER :%d",counter);
counter=counter+ 1'b1;
end
end

//CLK initialisation
initial
begin
  CLK=1'b0;
  forever #5 CLK=~CLK;
end

initial
begin
wait(counter==8'd68)
disable counter_block;
$finish;
end


endmodule
