module _register8(clk, d, q);
	input clk;
	input [7:0] d;
	output [7:0] q; //set input and output
	
	_dff _dff0(.clk(clk), .d(d[0]), .q(q[0]), .q_bar());
	_dff _dff1(.clk(clk), .d(d[1]), .q(q[1]), .q_bar());
	_dff _dff2(.clk(clk), .d(d[2]), .q(q[2]), .q_bar());
	_dff _dff3(.clk(clk), .d(d[3]), .q(q[3]), .q_bar());
	_dff _dff4(.clk(clk), .d(d[4]), .q(q[4]), .q_bar());
	_dff _dff5(.clk(clk), .d(d[5]), .q(q[5]), .q_bar());
	_dff _dff6(.clk(clk), .d(d[6]), .q(q[6]), .q_bar());
	_dff _dff7(.clk(clk), .d(d[7]), .q(q[7]), .q_bar()); //connect 8 ff for 8 bits

endmodule
