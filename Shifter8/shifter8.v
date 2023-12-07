module shifter8(clk, reset_n, op, shamt, d_in, d_out);
	input clk, reset_n;
	input [2:0] op;
	input [1:0] shamt;
	input [7:0] d_in;
	output [7:0] d_out; //set input and output
	
	wire [7:0] d_next; //set wire
	
	cc_logic cc_logic_0(.op(op), .shamt(shamt), .d_in(d_in), .d_out(d_out), .d_next(d_next)); //to get result
	_register8_r reg8_0(.clk(clk), .reset_n(reset_n), .d(d_next), .q(d_out)); //for clk and reset signal

endmodule
