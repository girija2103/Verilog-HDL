module main;
reg [3:0] A,B;
reg Cin;
wire [3:0] SUM;
wire COUT;



//instantiation 
fulladder4 fadder(.cout(COUT),.sum(SUM),.a(A),.b(B),.cin(Cin));

//setup monitoring
initial
begin
  //prints in decimal
  //$monitor($time ," A=%b ,B=%b ,Cin=%b ,Cout=%b ,Sum=%d \n",A,B,Cin,COUT,SUM);
  $monitor($time ," A=%b ,B=%b ,Cin=%b ,Cout=%b ,Sum=%d \n",A,B,Cin,COUT,SUM);
end

//stimulus inputs
initial
begin
    A=4'd0 ;B=4'd0;Cin=1'b0;
    #5 A=4'd5;B=4'd8;
    #5 A=4'b1111; B=4'b1010;
    #5 A=4'b1011;B=4'b0111;Cin=1'b1;
    #5 A=4'd11;B=4'd10;Cin=1'b1;
end
endmodule



module fulladder4(cout,sum,a,b,cin);

output [3:0]sum;
output cout ;
input [3:0] a,b;
input cin ;

wire c1, c2,c3;
//1 bit adder instantiation

fulladder1 f0(c1,sum[0],a[0],b[0],cin);
fulladder1 f1(c2,sum[1],a[1],b[1],c1);
fulladder1 f2(c3,sum[2],a[2],b[2],c2);
fulladder1 f3(cout,sum[3],a[3],b[3],c3);

endmodule

module fulladder1(cout,sum,a,b,cin);

input a,b,cin;
output cout,sum;
wire x,y,z;

//assigment of output
xor(sum , a,b,cin);
//intermediate output
and(x,a,b);
and(y,a,cin);
and(z,b,cin);


or(cout,x,y,z);



endmodule

