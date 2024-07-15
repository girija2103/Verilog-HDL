//STIMULUS MODULE

`define TRUE 1'b1
`define FALSE 1'b0

`define RED 2'd0
`define YELLOW 2'd1
`define GREEN 2'd2


//state definition   HIGHWAY   COUNTRY 
`define S0 3'd0      // GREEN     RED
`define S1 3'd1       //YELLOW     RED
`define S2 3'd2       //RED     RED
`define S3 3'd3       //RED     GREEN
`define S4 3'd4       //RED     YELLOW


//DELAYS
`define Y2RDELAY 3   //Yellow to red Delay
`define R2GDELAY 2   //Red to Green Delay

module stimulus ;

wire[1:0] MAIN_SIG, COUNTRY_SIG;
reg CAR_ON_CNTRY_RD;

//if TRUE , indicates a car on the country road 

reg CLOCK,CLEAR;

//instantiate the signal controller

sig_control SC(.highway(MAIN_SIG),.country(COUNTRY_SIG),.x(CAR_ON_CNTRY_RD),.clock(CLOCK),.clear(CLEAR));


//set up MONITOR
initial
$monitor($time," MAIN sig=%b || Country sig =%b || Car_on_cntry =%b", MAIN_SIG,COUNTRY_SIG,CAR_ON_CNTRY_RD);


//set up clock
initial
begin
  CLOCK=`FALSE;
  forever #5 CLOCK=~CLOCK;
end

//control clear signal

initial
begin

  CLEAR =`TRUE;
  repeat(5) @(negedge CLOCK);
  CLEAR =`FALSE;

end

//apply stimuls
initial
begin 
  CAR_ON_CNTRY_RD = `FALSE;
  
  #200 CAR_ON_CNTRY_RD =`TRUE;
  #100 CAR_ON_CNTRY_RD =`FALSE;
  
  #200 CAR_ON_CNTRY_RD =`TRUE;
  #100 CAR_ON_CNTRY_RD =`FALSE;
  
  #200 CAR_ON_CNTRY_RD =`TRUE;
  #100 CAR_ON_CNTRY_RD =`FALSE;
  
  #100 $stop ;
  
end
endmodule 
