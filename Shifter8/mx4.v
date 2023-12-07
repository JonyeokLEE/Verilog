module mx4(d0,d1,d2,d3,s,y); //2-to-1 MUX module

	input d0,d1,d2,d3;
	input [1:0]s;
	output y; //output y
	
	wire w0, w1;
	
	mx2 mx2_0(d0, d1, s[0], w0);
	mx2 mx2_1(d2, d3, s[0], w1);
	
	mx2 mx2_2(w0, w1, s[1], y); //construct mx4 with 3 mx2

endmodule //end MUX module
