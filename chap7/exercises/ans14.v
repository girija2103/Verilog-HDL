module ans14;

reg [0:3] cache_var [0:1023];

initial
begin
for(integer i =0;i<1024;i++)
begin
  cache_var[i]=4'b0;
  $display(" i=%d || VALUE =%b ",i,cache_var[i]);
end
end
endmodule
