module _dff_r_sync_async(clk, reset_n, d, q_sync, q_async);
	input clk, reset_n, d;
	output q_sync, q_async; //set input and output
	
	_dff_r_sync dff_sync_0(.clk(clk), .reset_n(reset_n), .d(d), .q(q_sync));
	_dff_r_async dff_async_0(.clk(clk), .reset_n(reset_n), .d(d), .q(q_async));
	
	
endmodule
