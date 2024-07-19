//define a module that contains a function shift 

module shifter;

//left/right shifter
`define LEFT_SHIFT 1'b0 
`define RIGHT_SHIFT 1'b1 

reg [31:0] addr,left_addr,right_addr;

reg control;

//compute the right and left shifted values whenever 
//a new address value appears


//stimulus generation 

initial 
begin 
addr =32'd124535; #10;
addr = 32'd34475; #10;
addr = 32'd24734 ; #10;
addr = 32'd3432 ; 
end
always @ (addr)
begin 
  //call the function defined below to do the left and the right shift 
  left_addr= shift(addr, `LEFT_SHIFT);
  right_addr =shift(addr, `RIGHT_SHIFT);
  $display($time,"  ADDR:%b || L_SHIT :%b || R_SHIFT :%b ",addr,left_addr,right_addr);

end

//define shift function . The output is a 32 bit values
function [31:0] shift;
input [31:0] address;
input control;

begin 

  //set the output value appropriately based on the control signal 
  shift =(control == `LEFT_SHIFT ? (address <<1 ): address>>1);
end
endfunction
endmodule
