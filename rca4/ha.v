module ha(a, b, co, s); //Half Adder Module
	
	input a, b; //set input
	output co, s; //set output
	wire andforco, xorfors; //for data transfer
	
	_and andHA(a,b,co); //Cout = A and B
	_xor xorHA(a,b,s); //Sum = A xor B
	
endmodule
