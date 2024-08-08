module dff(d,clock,reset,q,qbar);

input d , clock, reset ; 

output q,qbar ; 
reg q , qbar ;

//specify 

specify
    (d *> q) = 5;
    (d *> qbar) = 5;
    if (d == 1'b1)
        (clock *> qbar) = 7;
    if (d == 1'b0)
        (clock *> qbar) = 4;
    if (d == 1'b0)
        (clock *> q) = 5;
    if (d == 1'b1)
        (clock *> q) = 6;
    (reset *> q) = 5;
    (reset *> qbar) = 5;
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
