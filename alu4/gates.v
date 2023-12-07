module _inv(a,y); //2-input NOT
	input a;
	output y;

	assign y=~a;

endmodule

module _nand2(a,b,y); //2-input NAND
	input a,b;
	output y;

	assign y=~(a&b);

endmodule

module _xor2(a,b,y); //2-input XOR
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

module _and2(a,b,y); //2-input AND
	input a,b;
	output y;

	assign y=a&b;

endmodule

module _and3(a,b,c,y); //3-input AND
	input a,b,c;
	output y;

	assign y=a&b&c;

endmodule

module _and4(a,b,c,d,y); //4-input AND
	input a,b,c,d;
	output y;

	assign y=a&b&c&d;

endmodule

module _and5(a,b,c,d,e,y); //5-input AND
	input a,b,c,d,e;
	output y;

	assign y=a&b&c&d&e;

endmodule

module _or2(a,b,y); //2-input OR
	input a,b;
	output y;

	assign y=a|b;

endmodule

module _or3(a,b,c,y); //3-input OR
	input a,b,c;
	output y;

	assign y=a|b|c;

endmodule

module _or4(a,b,c,d,y); //4-input OR
	input a,b,c,d;
	output y;

	assign y=a|b|c|d;

endmodule

module _or5(a,b,c,d,e,y); //5-input OR
	input a,b,c,d,e;
	output y;

	assign y=a|b|c|d|e;

endmodule

module _inv_4bits(a,y); //4bit NOT
	input [3:0] a;
	output [3:0] y;
	
	assign y=~a;

endmodule

module _and2_4bits(a,b,y); //4bit AND
	input [3:0] a,b;
	output [3:0] y;

	assign y=a&b;

endmodule

module _or2_4bits(a,b,y); //4bit OR
	input [3:0] a,b;
	output [3:0] y;

	assign y=a|b;

endmodule

module _xor2_4bits(a,b,y); //4bit XOR
	
	input [3:0] a,b;
	output [3:0] y;
	
	_xor2 xor2_0(.a(a[0]), .b(b[0]), .y(y[0]));
	_xor2 xor2_1(.a(a[1]), .b(b[1]), .y(y[1]));
	_xor2 xor2_2(.a(a[2]), .b(b[2]), .y(y[2]));
	_xor2 xor2_3(.a(a[3]), .b(b[3]), .y(y[3]));

endmodule

module _xnor2_4bits(a,b,y); //4bit XNOR
	input [3:0] a,b;
	output [3:0] y;

	wire [3:0] w0;
	
	_xor2_4bits xor2_4bits_0(.a(a), .b(b), .y(w0));
	_inv_4bits inv_4bits_0(.a(w0), .y(y));
endmodule
