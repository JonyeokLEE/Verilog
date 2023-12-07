module tl_cntr_struct(clk,reset_n,Ta,Tb,La,Lb);
	input clk,reset_n,Ta,Tb; //set input
	output [1:0] La,Lb; //set output

	wire [1:0] cs,ns; //set wire about current state and next state

	ns_logic ns_logic_0(.Ta(Ta),.Tb(Tb),.ns(ns),.cs(cs)); //module for next state
	o_logic o_logic_0(.La(La),.Lb(Lb),.cs(cs)); //module for output
	_register2_r_async register2_r_0(.clk(clk),.reset_n(reset_n),.d(ns),.q(cs)); //run register

endmodule
