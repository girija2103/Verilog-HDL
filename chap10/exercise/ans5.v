module dff d1(d,clock,reset,q,qbar);

input d , clock, reset ; 

output q,qbar ; 




//specify 

specify 

(d=>q) = 5 ;
(d=>qbar) = 5 ;
(clock => qbar ) = 5 ;
(clock => q ) = 5;
(reset => q ) =5 ;
(reset => qbar ) = 5 ;
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
