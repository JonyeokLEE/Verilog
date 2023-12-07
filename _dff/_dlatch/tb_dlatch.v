`timescale 1ns/100ps //set timesclae

module tb_dlatch;
	reg tb_clk;
	reg tb_d;
	wire tb_q;
	wire tb_q_bar; //set wire and reg
	
	_dlatch test_dlatch( .clk(tb_clk), .d(tb_d), .q(tb_q), .q_bar(tb_q_bar)); //run module
	
	always #5
	begin
		tb_clk = ~tb_clk;
	end //set clk period
	
	
	initial
	begin
		#0; tb_clk = 0; tb_d = 0;
		#7; tb_d = 1;
		#10; tb_d = 0;
		#12; tb_d = 1;
		#20; $stop;
	end //test end
	
endmodule
