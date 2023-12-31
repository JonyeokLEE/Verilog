module mx8(a, b, c, d, e, f, g, h, s2, s1, s0, y);
	input a, b, c, d, e, f, g, h;
	input s2, s1, s0; //set input

	output y; //set output

	wire w0, w1, w2, w3, w4, w5; //set wire

	mx2 mx2_0(.d0(a), .d1(b), .s(s0), .y(w0));
	mx2 mx2_1(.d0(c), .d1(d), .s(s0), .y(w1));
	mx2 mx2_2(.d0(e), .d1(f), .s(s0), .y(w2));
	mx2 mx2_3(.d0(g), .d1(h), .s(s0), .y(w3));
	mx2 mx2_4(.d0(w0), .d1(w1), .s(s1), .y(w4));
	mx2 mx2_5(.d0(w2), .d1(w3), .s(s1), .y(w5));
	mx2 mx2_6(.d0(w4), .d1(w5), .s(s2), .y(y)); //run MX2 7 times

endmodule
