module _register32(clk, d, q);
	input clk;
	input [31:0] d;
	output [31:0] q; //set input and output
	
	_register8 _reg0(.clk(clk), .d(d[7:0]), .q(q[7:0]));
	_register8 _reg1(.clk(clk), .d(d[15:8]), .q(q[15:8]));
	_register8 _reg2(.clk(clk), .d(d[23:16]), .q(q[23:16]));
	_register8 _reg3(.clk(clk), .d(d[31:24]), .q(q[31:24])); //connect 4 8bitFF for 32bits

endmodule
