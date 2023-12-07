module o_logic(La, Lb, cs);

	input [1:0]cs;
	output [1:0]La;
	output [1:0]Lb; //set input and output
	
	wire cs1_inv; //for ~cs[1]
	
	
	assign La[1] = cs[1];
	_inv inv_0(.a(cs[1]), .y(cs1_inv));
	_and2 AND2_0(.a(cs1_inv), .b(cs[0]), .y(La[0]));
	assign Lb[1] = cs1_inv;
	_and2 AND2_1(.a(cs[1]), .b(cs[0]), .y(Lb[0])); //get output
	

endmodule 