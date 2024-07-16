//reg oscillate // oscillates every 30 time units

module ans1;

reg oscillate;

initial
begin
//monitor
$monitor($time,"  OSCILLATE : %b",oscillate);
end

//value assignment

initial
begin
oscillate=1'b0;
forever #30 oscillate=~oscillate;

end

initial
#300 $finish;

endmodule
