`timescale 1ns/100ps //set timescale

module tb_ha;

	reg a,b; //set input as reg
	wire s,co; //set output as wire
	
	ha ha_test(a,b,co,s); //run ha module
	
	initial
	begin //start test
		#0 a = 0; b = 0;
		#10 a = 1; b = 0;
		#10 a = 0; b = 1;
		#10 a = 1; b = 1;
		#10 $finish;
	end //end test

endmodule
