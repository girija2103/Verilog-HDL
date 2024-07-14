module main;

//inputs and outputs
reg X,Y,Z;
wire D,B;

//instantiation 

full_sub fs1(.x(X),.y(Y),.z(Z),.d(D),.b(B));

//monitor
initial
begin
$monitor($time," X=%b ||Y=%b || Z=%b || D=%b || B=%b",X,Y,Z,D,B);
end

initial
begin 
X=1'b0;Y=1'b0;Z=1'b0;#5;

X=1'b0;Y=1'b0;Z=1'b1;#5;

X=1'b0;Y=1'b1;Z=1'b0;#5;

X=1'b0;Y=1'b1;Z=1'b1;#5;

X=1'b1;Y=1'b0;Z=1'b0;#5;

X=1'b1;Y=1'b0;Z=1'b1;#5;

X=1'b1;Y=1'b1;Z=1'b0;#5;

X=1'b1;Y=1'b1;Z=1'b1;



end
//assig
endmodule


module full_sub(d,b,x,y,z);

output d,b;
input x,y,z;


assign d = (~x & ~y & z) + (~x & y & ~z) + (x & ~y & ~z) +(x & y & z);

assign b = (~x & y) + (~x & z) + (y & z);



endmodule
