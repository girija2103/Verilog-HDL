//define a module that contains the task asymmetric_sequence 

module example2;

reg CLK;


//monitor 
initial
$monitor($time," CLOCK :%b ", CLK);
initial 
  init_sequence ; //invoke the task init_sequence

always 
begin 
  asymmetric_sequence ; //invoke the task asymmetric_sequence
end

//initialisation sequence
task init_sequence;
begin 
  CLK=1'b0;
end
endtask

//define task to generate asssymetric sequence
//operate directly on the clock defined in the module

task asymmetric_sequence ;

begin 
  #12 CLK = 1'b0;
  #5 CLK=1'b1;
  #3 CLK =1'b0;
  #10 CLK =1'b1;
end
endtask

initial
#100 $finish;

endmodule 
