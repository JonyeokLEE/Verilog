module cla8(a, b, ci, s, co);
	
	input [7:0] a, b; //8-bit input a, b
	input ci; //1-bit input ci(Cin)
	
	output [7:0] s; //8-bit output s(Sum)
	output co; //1-bit output co(Cout)
	
	wire c1;
	
	cla4 cla4_0(.a(a[3:0]), .b(b[3:0]), .ci(ci), .s(s[3:0]), .co(c1));
	cla4 cla4_1(.a(a[7:4]), .b(b[7:4]), .ci(c1), .s(s[7:4]), .co(co)); //connect 2 cla4 for 8bits result
	
endmodule
