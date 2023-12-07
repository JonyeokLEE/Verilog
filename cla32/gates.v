module _inv(a,y);
	input a;
	output y;

	assign y=~a;

endmodule

module _nand2(a,b,y);
	input a,b;
	output y;

	assign y=~(a&b);

endmodule

module _and2(a,b,y);
	input a,b;
	output y;

	assign y=a&b;

endmodule

module _or2(a,b,y);
	input a,b;
	output y;

	assign y=a|b;

endmodule

module _xor2(a,b,y);
	input a, b;
	output y;

	wire inv_a, inv_b;
	wire w0, w1;

	_inv inv_1(.a(a), .y(inv_a));
	_inv inv_2(.a(b), .y(inv_b));
	_and2 and2_1(.a(inv_a), .b(b), .y(w0));
	_and2 and2_2(.a(a),.b(inv_b), .y(w1));
	_or2 or2_1(.a(w0), .b(w1),.y(y));

endmodule

module _and3(a,b,c,y);
	input a,b,c;
	output y;

	assign y=a&b&c;

endmodule

module _and4(a,b,c,d,y);
	input a,b,c,d;
	output y;

	assign y=a&b&c&d;

endmodule

module _and5(a,b,c,d,e,y);
	input a,b,c,d,e;
	output y;

	assign y=a&b&c&d&e;

endmodule

module _or3(a,b,c,y);
	input a,b,c;
	output y;

	assign y=a|b|c;

endmodule

module _or4(a,b,c,d,y);
	input a,b,c,d;
	output y;

	assign y=a|b|c|d;

endmodule

module _or5(a,b,c,d,e,y);
	input a,b,c,d,e;
	output y;

	assign y=a|b|c|d|e;

endmodule

