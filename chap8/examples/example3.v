//define a module that contains the function calc_parity


module parity;

reg [31:0] addr;
reg parity ;

//compute a new parity whenever address value changes


//stimulus generation 
initial 
begin 
addr =32'b1; #10;
addr =32'd102 ; #15;

addr =32'd105; #10;
addr =32'd1032 ; #15;

addr =32'd157985; #10;
addr =32'd1024535 ; 
end


always @(addr)
begin
parity = calc_parity(addr); //first invocation of calc_parity 
$display($time ," Parity Calculated : %b ", calc_parity(addr)); //second invocation of calc_parity
end

//define the parity calculation function

function calc_parity ;

input [31:0] address;
begin 
  //set the output value appropriately . Use the implicit 
  //internal register calc_parity 
  calc_parity = ^address; //return the xor of all the address bits
end
endfunction

endmodule
