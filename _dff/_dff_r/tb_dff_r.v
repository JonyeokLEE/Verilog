`timescale 1ns/100ps //set timescale
module tb_dff_r;
	reg tb_clk, tb_reset_n, tb_d;
	wire tb_q; //set reg and wire
	
	_dff_r test_dff_r(.clk(tb_clk), .reset_n(tb_reset_n), .d(tb_d), .q(tb_q)); //run module
	
	always #5
	begin
		tb_clk = ~tb_clk;
	end //set clk period
	
	initial
	begin
		#0; tb_clk = 0; tb_d = 0; tb_reset_n = 0;
		#7; tb_reset_n = 1; tb_d = 1;
		#10; tb_d = 0;
		#12; tb_d = 1;
		#10; tb_reset_n = 0;
		#10; tb_d=0;
		#20; $stop;
	end //stop test
	
	
endmodule
