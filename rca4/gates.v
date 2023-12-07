module _inv(a, y); //1-input Inverter Gate
	input a;
	output y;
	
	assign y=~a; //assign

endmodule

module _or(a, b, y); //2-input OR Gate
	input a, b;
	output y;
	
	assign y= a|b; //assign
	
endmodule

module _and(a, b, y); //2-input AND Gate
	input a, b;
	output y;
	
	assign y = a&b; //assign
	
endmodule
	


module _xor(a, b, y); //2-input XOR Gate

	input a, b;
	output y;
	
	wire inv_a, inv_b, a_and_inv_b, inv_a_and_b, y_for_or;
	
	_inv inv1(a,inv_a);
	_inv inv2(b,inv_b);
	_and and1(a,inv_b,a_and_inv_b);
	_and and2(inv_a,b,inv_a_and_b);
	_or or1(a_and_inv_b,inv_a_and_b,y_for_or);
	// a ^ b = (~a)&b + a&(~b)
	
	assign y=y_for_or; //assign
	
	
endmodule
