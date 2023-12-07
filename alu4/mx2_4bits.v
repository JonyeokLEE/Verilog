module mx2_4bits(d0, d1, s, y);
	input [3:0] d0, d1;
	input s; //set input
	
	output [3:0] y; //set output
	
	mx2 mx2_0(.d0(d0[0]), .d1(d1[0]), .s(s), .y(y[0]));
	mx2 mx2_1(.d0(d0[1]), .d1(d1[1]), .s(s), .y(y[1]));
	mx2 mx2_2(.d0(d0[2]), .d1(d1[2]), .s(s), .y(y[2]));
	mx2 mx2_3(.d0(d0[3]), .d1(d1[3]), .s(s), .y(y[3])); //Run MX2 and store the result each bits
	
endmodule

