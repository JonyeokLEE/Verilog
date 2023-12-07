module cla4(a, b, ci, s, co);
	
	input [3:0] a, b; //4-bit input a, b
	input ci; //1-bit input ci(Cin)
	
	output [3:0] s; //4-bit output s(Sum)
	output co; //1-bit output co(Cout)
	
	wire [3:0] carry; //To store carry
	
	clb4 clb4_1 (.a(a), .b(b), .ci(ci), .c1(carry[0]), .c2(carry[1]), .c3(carry[2]), .co(co));
	//Run Carry-Lookahead Block to get Carry
	
	fa_v2 fa_1 (.a(a[0]), .b(b[0]), .ci(ci), .s(s[0]));
	fa_v2 fa_2 (.a(a[1]), .b(b[1]), .ci(carry[0]), .s(s[1]));
	fa_v2 fa_3 (.a(a[2]), .b(b[2]), .ci(carry[1]), .s(s[2]));
	fa_v2 fa_4 (.a(a[3]), .b(b[3]), .ci(carry[2]), .s(s[3]));
	//Run Full Adder without Output Cout	
	
endmodule
