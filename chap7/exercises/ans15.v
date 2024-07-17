//CLOCK period : 10 ; duty cycle : 40%

module ans15;

reg CLK=1'b0;
initial
begin
forever 
begin
  #6 CLK=~CLK;
  #4 CLK=~CLK;
end

end


//monitor
initial
$monitor($time," CLK :%b ", CLK);

initial
#100 $finish;
endmodule
