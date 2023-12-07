module fa_v2(a, b, ci, s); //Full Adder Version 2

	input a, b, ci; //set input
	output s; //set output
	
	wire w0; //set wire
	
	_xor2 xor2_1(.a(a), .b(b), .y(w0));
	_xor2 xor2_2(.a(w0), .b(ci), .y(s));
	//A ^ B ^ Cin
	
endmodule
