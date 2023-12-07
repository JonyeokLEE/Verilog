module cal_flags32(op, result, co_add, co_prev_add, c, n, z, v);
	
	input [2:0] op; //operater 3-bit opcode
	input [31:0] result; //result of operation
	input co_add, co_prev_add; //result of cla
	
	output c, n, z, v; //carry, negative, zero, overflow
	
	assign c = (op[2:1] != 2'b11) ? 1'b0 : co_add; //if op[2:1] is not 11 -> c = 0 / is  11 -> c = co_add
	assign n = result[31]; //n is Sign bit of Result
	assign z = (result == 32'b0) ? 1'b1 : 1'b0; //if result is 0000 -> Zero / is not 0000 -> Not Zero
	assign v = (op[2:1] != 2'b11) ? 1'b0 : co_add ^ co_prev_add; // if op[2:1] is not 11 -> V = 0 / is 11 -> V = co_add xor c3_add

endmodule
