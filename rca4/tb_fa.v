`timescale 1ns/100ps //set timescale

module tb_fa;

	reg a,b,ci; //set input as reg
	wire s,co; //set output as wire
	
	fa fa_test(a,b,ci,co,s); //run fa mulde
	
	initial
	begin //start test
		#0 a = 0; b = 0; ci = 0;
		#10 a = 1; b = 0; ci = 0;
		#10 a = 0; b = 1; ci = 0;
		#10 a = 1; b = 1; ci = 0;
		#10 a = 0; b = 0; ci = 1;
		#10 a = 1; b = 0; ci = 1;
		#10 a = 0; b = 1; ci = 1;
		#10 a = 1; b = 1; ci = 1;
		#10 $finish;
	end //end test

endmodule
