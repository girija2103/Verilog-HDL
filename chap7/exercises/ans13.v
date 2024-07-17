
module ans13;

reg CLK=1'b0;
integer i=0 ;
integer CYCLES=100;
initial
begin
while (i< CYCLES)
begin 

CLK=~CLK;
$display($time," CLK =%b ",CLK);
#10;
i++;
end
end

endmodule
