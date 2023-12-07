module _dff_r(clk, reset_n, d, q);
	input clk, reset_n, d;
	output q; //set output and input
	
	wire w_d; //set wire
	
	_and2 AND2(.a(d), .b(reset_n), .y(w_d)); //for reset signal
	_dff ResetDFF(.clk(clk), .d(w_d), .q(q), .q_bar()); //run dff module

endmodule
