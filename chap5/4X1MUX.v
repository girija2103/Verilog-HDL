//module main acts as stimulus and does not have any ports
module main();
    reg IN0,IN2 ,IN3,IN1;
    wire Y1,Y2,Y3,Y4;
    reg S1,S0;
    wire OUT;
    //instantiate the mux4_1
    mux4_1 mux(OUT, IN0,IN1,IN2,IN3, S0,S1);

    //define the stimulus module 

    //stimulate the inputs 

    initial 
    begin 
      //set input lunes

      IN0=1;IN2=1;IN3=0;IN1=0;
      #1 $display("IN0= %b, IN1 = %b , IN2= %b , IN3= %b\n",IN0, IN1, IN2, IN3);

      //choose IN0

      S1= 0 ; S0 =0;
      #1 $display(" S1 = %b , S0 = %b ,OUTPUT = %b\n", S1, S0, OUT);

      //choose IN1
      S1= 0 ; S0 =1;
      #1 $display(" S1 = %b , S0 = %b ,OUTPUT = %b\n", S1, S0, OUT);

      //choose IN2
      S1= 1 ; S0 =0;
      #1 $display(" S1 = %b , S0 = %b ,OUTPUT = %b\n", S1, S0, OUT);

      //choose IN3
      S1= 1 ; S0 =1;
      #1 $display(" S1 = %b , S0 = %b ,OUTPUT = %b\n", S1, S0, OUT);



    end


  
endmodule

module mux4_1(out , in0,in1 , in2, in3, s0,s1);
    output out;
    input in0,in1, in2,in3,s0,s1;
    wire y0 , y1,y2,y3;
    wire s1n,s0n;
    //invereted signals
    not(s1n,s1);
    not(s0n,s0);
    //intermediate outputs
    and(y0,s1n,s0n,in0);
    and (y1,s1n,s0,in1);
    and(y2,s1,s0n, in2);
    and(y3,s1,s0,in3);
    
    //output 
    or(out , y0,y1,y2,y3);

  
endmodule

