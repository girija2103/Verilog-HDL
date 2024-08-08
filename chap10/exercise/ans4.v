module dff d1(d,clock,reset,q,qbar);

input d , clock, reset ; 

output q,qbar ; 




//specify 

specify 

(d=>q) = 5 ;
(d=>qbar) = 5 ;
(clock => qbar ) = 7 ;
(clock => q ) =6 ;
(reset => q ) =2 ;
(reset => qbar ) = 3 ;
endspecify 



always @( posedge clock or reset )

begin 

if(clock ) 
begin 
q=d;
qbar = ~d;
end

if(reset) 
begin 
q=1'b0;
qbar = 1'b1;
end

end





endmodule
