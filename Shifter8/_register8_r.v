module _register8_r(clk, reset_n, d, q);

	input clk, reset_n;
	input [7:0] d;
	output [7:0] q; //set input and output
	
	_dff_r dff_0(.clk(clk), .reset_n(reset_n), .d(d[0]), .q(q[0]));
	_dff_r dff_1(.clk(clk), .reset_n(reset_n), .d(d[1]), .q(q[1]));
	_dff_r dff_2(.clk(clk), .reset_n(reset_n), .d(d[2]), .q(q[2]));
	_dff_r dff_3(.clk(clk), .reset_n(reset_n), .d(d[3]), .q(q[3]));
	_dff_r dff_4(.clk(clk), .reset_n(reset_n), .d(d[4]), .q(q[4]));
	_dff_r dff_5(.clk(clk), .reset_n(reset_n), .d(d[5]), .q(q[5]));
	_dff_r dff_6(.clk(clk), .reset_n(reset_n), .d(d[6]), .q(q[6]));
	_dff_r dff_7(.clk(clk), .reset_n(reset_n), .d(d[7]), .q(q[7])); //connect 8 dff

endmodule
