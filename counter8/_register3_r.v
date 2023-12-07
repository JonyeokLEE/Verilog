module _register3_r(clk, reset_n, d, q);

	input clk, reset_n;
	input [2:0] d;
	output [2:0] q; //set input and output
	
	_dff_r dff_0(.clk(clk), .reset_n(reset_n), .d(d[0]), .q(q[0]));
	_dff_r dff_1(.clk(clk), .reset_n(reset_n), .d(d[1]), .q(q[1]));
	_dff_r dff_2(.clk(clk), .reset_n(reset_n), .d(d[2]), .q(q[2])); //connect 3 dff

endmodule
