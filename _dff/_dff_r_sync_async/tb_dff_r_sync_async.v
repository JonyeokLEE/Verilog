`timescale 1ns/100ps //set timescale

module tb_dff_r_sync_async;
	reg tb_clk, tb_reset_n, tb_d;
	wire tb_q_sync, tb_q_async; //set reg and wire
	
	_dff_r_sync_async test_dff_r_sync_async(.clk(tb_clk), .reset_n(tb_reset_n), .d(tb_d), .q_sync(tb_q_sync), .q_async(tb_q_async)); //run module
	
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
	end //end test

endmodule
