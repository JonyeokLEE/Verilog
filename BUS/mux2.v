module mux2(d0,d1,s,y); //2-to-1 MUX module

	input d0,d1,s; //2 input d0 & d1, Selection signal s
	output y; //output y
	
	wire sb; //signal after INVERTER wire sb
	wire w0,w1; //signal after NAND wire w0,w1
	
	_inv iv0(s,sb); //call _inv module
	_nand2 nd20(d0,sb,w0); //call _nand2 module
	_nand2 nd21(d1,s,w1); //call _nand2 module
	_nand2 nd22(w0,w1,y); //finally get output y

endmodule //end MUX module
