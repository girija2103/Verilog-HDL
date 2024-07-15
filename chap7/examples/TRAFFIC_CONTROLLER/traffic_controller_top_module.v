`define TRUE 1'b1
`define FALSE 1'b0

`define RED 2'd0
`define YELLOW 2'd1
`define GREEN 2'd2


//state definition 	HIGHWAY 	COUNTRY 
`define S0 3'd0      // GREEN 		RED
`define S1 3'd1	     //YELLOW 		RED
`define S2 3'd2	     //RED 		RED
`define S3 3'd3	     //RED 		GREEN
`define S4 3'd4	     //RED 		YELLOW


//DELAYS
`define Y2RDELAY 3 	//Yellow to red Delay
`define R2GDELAY 2 	//Red to Green Delay

module sig_control(highway,country,x,clock,clear);

//I/O ports

output [1:0] highway,country; //2 bit output for 3 states of signal {RED,GREEN,YELLOW}

reg [1:0] highway,country; //declared output signals as registers


input x;
//if TRUE indicates that there is a car on the country road , otherwise FALSE

input clock,clear;


//Internal State variables

reg [2:0] state;
reg [2:0] next_state;

initial
begin
	state=`S0;
	next_statte=`S0; //default
	highway=`GREEN;
	country='RED;
end

//state changes only at the positive edge of the clock 
always @(posedge clock)
	state=next_state;

//compute values on the main highway signal and the country signal 
always @(state)
begin
	case(state)
		`S0:begin
			highway=`GREEN;
			country=`RED;
		    end
		 `S1:begin
			highway=`YELLOW;
			country=`RED;
		    end
		 `S2:begin
			highway=`RED;
			country=`RED;
		    end
		  `S3:begin
			highway=`RED;
			country=`GREEN;
		    end
		  `S4:begin
			highway=`RED;
			country=`YELLOW;
		    end
	endcase


end


//State machine using case statements
always @( state or clear or x)
begin
	if(clear)
		next_state=`S0;
        else
        	case(state)
        	`S0 : if(x)
        		next_state=`S1;
        	       else
        	       	next_state=`S0;
        	'S1 : begin  //dealy some positive edges of the clock
        		repeat (`Y2RDELAY) @ (posedge clock);
        		next_state= `S2;
        	      end
        	'S2 : begin //delays some positive edges of the clock
        		repeat (`R2GDELAY) @(posedge clock);
        		next_state =`S3;
        	      end
        	'S3 : if(x) 
        		next_state =`S3;
        	      else 
        	      	next_state=`S4;
        	'S4 : begin //delays some positive edges of the clock
        		repeat (`Y2RDELAY) @(posedge clock);
        		next_state = `S0;
        	      end
        	default : next_state=`S0;
        	endcase
end
endmodule  
        	
        	

