module fa(a,b,ci,co,s); //Full Adder Module
	
	input a,b,ci; //set input
	output co,s; //set output
	
	wire c1,c2,sm; //for data transter
	
	ha ha1(.a(b),.b(ci),.co(c1),.s(sm));
	ha ha2(.a(a),.b(sm),.co(c2),.s(s));
	_or orForFa(.a(c2),.b(c1),.y(co));
	//Assign Full Adder by using Half Adder
	

endmodule
