//STIMULUS MODULE

module stimulus ;

wire[1:0] MAIN_SIG, COUNTRY_SIG;
reg CAR_ON_CNTRY_RD;

//if TRUE , indicates a car on the country road 

reg CLOCK,CLEAR;

//instantiate the signal controller

sig_control SC(.highway(MAIN_SIG),.country(COUNTRY_SIG),.x(CAR_ON_CNTRY_RD),.clock(CLOCK),.clear(CLEAR));


//set up MONITOR
intial
$monitor($time,"MAIN sig=% || Country sig =%b || Car_on_cntry =%b", MAIN_SIG,COUNTRY_SIG,CAR_ON_CNTRY_RD);


//set up clock
initial
begin
	CLOCK=`FALSE;
	forever #5 CLOCK=~CLOCK;
end

//control clear signal

intial
begin

	CLEAR =`TRUE;
	repeat(5) @(negedge CLOCK);
	CLEAR =`FALSE;

end

//apply stimuls
intial
begin 
	CAR_ON_CNTRY_RD = 'FALSE;
	
	#200 CAR_ON_CNTRY_RD =`TRUE;
	#100 CAR_ON_CNTRY_RD =`FALSE;
	
	#200 CAR_ON_CNTRY_RD =`TRUE;
	#100 CAR_ON_CNTRY_RD =`FALSE;
	
	#200 CAR_ON_CNTRY_RD =`TRUE;
	#100 CAR_ON_CNTRY_RD =`FALSE;
	
	#100 $stop ;
	
end
endmodule 
	
