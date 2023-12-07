module alu32(a, b, op, result, c, n, z, v);

	input [31:0] a, b;
	input [2:0] op; //set input
	
	output [31:0] result;
	output c, n, z, v; //set output
	
	wire [31:0] w_add_b;
	wire [31:0] w_not_a,w_not_b, w_and, w_or, w_xor, w_xnor, w_add;
	wire co_prev, co_add; //set wire
	
	_inv_32bits inv_32_0 (.a(a), .y(w_not_a)); //NOT a
	_inv_32bits inv_32_1 (.a(b), .y(w_not_b)); //NOT b
	_and2_32bits and2_32_0 (.a(a), .b(b), .y(w_and)); //a AND b
	_or2_32bits or2_32_0 (.a(a), .b(b), .y(w_or)); //a OR b
	_xor2_32bits xor2_32_0 (.a(a), .b(b), .y(w_xor)); //a XOR b
	_xnor2_32bits xnor2_32_0 (.a(a), .b(b), .y(w_xnor)); //a XNOR b
	
	mx2_32bits mx2_0 (.d0(b), .d1(w_not_b), .s(op[0]), .y(w_add_b)); //MX2
	mx8_32bits mx8_32bits (.a(w_not_a), .b(w_not_b), .c(w_and), .d(w_or), .e(w_xor), .f(w_xnor),
										.g(w_add), .h(w_add), .s2(op[2]), .s1(op[1]), .s0(op[0]), .y(result)); //MX8
	
	cla32_ov cla32_0 (.a(a), .b(w_add_b), .ci(op[0]), .s(w_add), .co_prev(co_prev), .co(co_add)); //Addition
	
	cal_flags32 getFlags (.op(op), .result(result), .co_add(co_add), .co_prev_add(co_prev), .c(c), .n(n), .z(z), .v(v)); //To get Flags

endmodule
