module cntr8(clk, reset_n, inc, load, d_in, d_out, o_state);
	input clk, reset_n, inc, load;
	input [7:0]d_in; //set input
	
	output [7:0]d_out;
	output [2:0]o_state; //set output
	
	wire [2:0] next_state;
	wire [2:0] state; //set wire
	
	assign o_state = state; //assign output state
	
	os_logic os_0(.state(state), .d_in(d_in), .d_out(d_out)); //to get output
	ns_logic ns_0(.load(load), .inc(inc), .state(state), .next_state(next_state)); //to get next state
	_register3_r reg3_0(.clk(clk), .reset_n(reset_n), .d(next_state), .q(state)); //for clk and reset
	
endmodule
