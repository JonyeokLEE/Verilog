module mux2_8bits(d0, d1, s, y);
	input [7:0] d0, d1;
	input s; //set input
	
	output [7:0] y; //set output
	
	mux2 mux2_0(.d0(d0[0]), .d1(d1[0]), .s(s), .y(y[0]));
	mux2 mux2_1(.d0(d0[1]), .d1(d1[1]), .s(s), .y(y[1]));
	mux2 mux2_2(.d0(d0[2]), .d1(d1[2]), .s(s), .y(y[2]));
	mux2 mux2_3(.d0(d0[3]), .d1(d1[3]), .s(s), .y(y[3]));
	mux2 mux2_4(.d0(d0[4]), .d1(d1[4]), .s(s), .y(y[4]));
	mux2 mux2_5(.d0(d0[5]), .d1(d1[5]), .s(s), .y(y[5]));
	mux2 mux2_6(.d0(d0[6]), .d1(d1[6]), .s(s), .y(y[6]));
	mux2 mux2_7(.d0(d0[7]), .d1(d1[7]), .s(s), .y(y[7])); //Run MX2 and store the result each bits
	
endmodule

