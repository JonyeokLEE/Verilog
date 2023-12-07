module fa_v2(a, b, ci, s);

	input a, b, ci;
	output s;
	
	wire w0; //set input and output and wire
	
	_xor2 xor2_1(.a(a), .b(b), .y(w0));
	_xor2 xor2_2(.a(w0), .b(ci), .y(s)); //two xor for fa
	
endmodule
