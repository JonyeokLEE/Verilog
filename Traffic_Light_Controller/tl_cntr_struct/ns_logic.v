module ns_logic(Ta, Tb, ns, cs);
	
	input Ta, Tb;
	input [1:0]cs;
	output [1:0]ns;
	
	wire cs1_inv, cs0_inv, Ta_inv, Tb_inv, s0_0, s0_1;
	
	_inv inv0(.a(cs[1]), .y(cs1_inv));
	_inv inv1(.a(cs[0]), .y(cs0_inv));
	_inv inv2(.a(Ta), .y(Ta_inv));
	_inv inv3(.a(Tb), .y(Tb_inv)); //to get ~Value
	
	
	_and3 AND_s0_0(.a(cs1_inv), .b(cs0_inv), .c(Ta_inv), .y(s0_0));
	_and3 AND_s0_1(.a(cs[1]), .b(cs0_inv), .c(Tb_inv), .y(s0_1));
	_or2 OR_s0(.a(s0_0), .b(s0_1), .y(ns[0]));
	
	_xor2 for_s1(.a(cs[1]),.b(cs[0]),.y(ns[1])); //get next state with boolean equation
	
	
endmodule
