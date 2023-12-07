module tl_cntr_w_left_struct(clk, reset_n, Ta, Tal, Tb, Tbl, La, Lb);

	input clk, reset_n, Ta, Tal, Tb, Tbl;
	output [1:0] La,Lb; //set input and output

	wire [2:0] cs,ns; //set wire

	ns_logic ns_logic_0(.Ta(Ta), .Tal(Tal), .Tb(Tb), .Tbl(Tbl), .ns(ns),.cs(cs)); //for next state
	o_logic o_logic_0(.La(La),.Lb(Lb),.cs(cs)); //for output
	_register3_r register3_r_0(.clk(clk),.reset_n(reset_n),.d(ns),.q(cs)); //run register
	

endmodule 