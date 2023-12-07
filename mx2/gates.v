module _nand2(a,b,y); //2 input NAND Gate module

	input a,b; //input a & b
	output y; //output y
	
	assign y=~(a&b); //assign output y

endmodule //end NAND module

module _inv(a,y); //INVERTER Gate module

	input a; //input a
	output y; //output y
	
	assign y=~a; //assign output y

endmodule //end INVERTER module
