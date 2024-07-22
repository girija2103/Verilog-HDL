//testbench

module test_bench;
reg D,CLK,RST;//input 

wire Q,QBAR;//output 

//instantiation 
edge_dff d1(.q(Q),.qbar(QBAR),.clk(CLK),.reset(RST),.d(D));

//monitor 
initial 
$monitor ($time," D:%b || CLK:%b ||RST :%b || Q:%b || Q' :%b ",D,CLK,RST,Q,QBAR);


//initialisation 

initial 
begin 
D=1'b1;
RST=1'b0;
end
//stimulus generation 
initial 
begin 
integer i;
for(i=0;i<100;i++)
begin 
D=~D; #i;

end 

end

//RST
initial 
begin 
integer i ;
for(i =0;i<100;i++)
begin 
RST =~RST; #(i+10);
end
end

//clk
initial 
begin 
CLK=1'b0;
forever #10 CLK =~CLK;

end
initial 
#200 $finish ;
endmodule 


//negative edge triggered d FF with asynchronous reset 

module edge_dff (q,qbar,d,clk,reset);

input d,clk,reset;
output q,qbar;

reg q,qbar; //declare q and qbar are the registers

always @(negedge clk) //assign value of q and qbar at active edge of the clock 
begin 
q=d;
qbar = ~d;

end


always@(reset) //override the regular assignments to q and qbar 
//whenever reset goes high.Use of procedural continous assignments

if(reset )
begin // if reset is high , override the regular assignments to q with 
// the new values , using procedural continous assignments 

assign q= 1'b0;
assign qbar = 1'b1;
end 

else 
begin //if resest goes low , remove the overrriding values by deassigning the registers. After this the regular 
//assignments q =d and qbar =~d will be able to change the registers on the next negative edge of the clock 

deassign q ;
deassign qbar ;

end

endmodule
