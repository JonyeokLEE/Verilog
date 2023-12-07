module alu4(a, b, op, result, c, n, z, v);
	
	input [3:0] a, b;
	input [2:0] op; //opcode

	output [3:0] result; //alu Result
	output c, n, z, v; //alu flags

	wire [3:0] w_add_b; //result of mx2
	wire [3:0] w_not_a,w_not_b, w_and, w_or, w_xor, w_xnor, w_add; //result of logic gates
	wire c3_add, co_add; //result of CLA
	
	_inv_4bits notA (.a(a), .y(w_not_a)); //Not A
	_inv_4bits notB (.a(b), .y(w_not_b)); //Not B
	
	_and2_4bits AandB (.a(a), .b(b), .y(w_and)); //A AND B
	_or2_4bits AorB (.a(a), .b(b), .y(w_or)); //A OR B
	_xor2_4bits AxorB (.a(a), .b(b), .y(w_xor)); // A XOR B
	_xnor2_4bits AxnorB (.a(a), .b(b), .y(w_xnor)); //A XNOR B
	
	mx2_4bits mux_of_b (.d0(b), .d1(w_not_b), .s(op[0]), .y(w_add_b));
	// MX2_4Bits - input 1: b, input 2: NotB, selection: op[0], output: w_add_b
	
	cla4_ov cla_A_waddb (.a(a), .b(w_add_b), .ci(op[0]), .s(w_add), .c3(c3_add), .co(co_add));
	// Adder- A + w_add_b + op[0] = w_add / co_add, c3_add
	mx8_4bits mx8_4bits_0 (.a(w_not_a), .b(w_not_b), .c(w_and), .d(w_or), .e(w_xor), .f(w_xnor),
										.g(w_add), .h(w_add), .s2(op[2]), .s1(op[1]), .s0(op[0]), .y(result));
										//Put all results to MX8
	cal_flags4 get_flags (.op(op), .result(result), .co_add(co_add), .c3_add(c3_add),
										.c(c), .n(n), .z(z), .v(v));
										//Calculate flags with result

endmodule
