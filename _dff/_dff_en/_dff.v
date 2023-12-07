module _dff(clk, d, q, q_bar);
	input clk, d;
	output q, q_bar; //set input and output
	wire clk_bar, w_q; //set wire
	
	_inv inv_clk(clk, clk_bar); //to get clk_bar
	_dlatch latch_0(.clk(clk_bar), .d(d), .q(w_q), .q_bar());
	_dlatch latch_1(.clk(clk), .d(w_q), .q(q), .q_bar(q_bar)); //connect two dlatch for dflipflop
	
endmodule
