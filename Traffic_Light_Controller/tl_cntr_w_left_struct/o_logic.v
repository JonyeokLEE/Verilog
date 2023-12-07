module o_logic(La, Lb, cs);

	input [2:0]cs;
	output [1:0]La;
	output [1:0]Lb; //set input and output
	
	wire cs0_inv, cs1_inv, cs2_inv;
	wire La1_0, La0_0, Lb1_0; //set wire
	
	_inv inv0(cs[0], cs0_inv);
	_inv inv1(cs[1], cs1_inv);
	_inv inv2(cs[2], cs2_inv);
	
	_and2 forLa1_0(cs[1],cs0_inv, La1_0);
	_or2 forLa1(cs[2], La1_0, La[1]);
	
	_or2 forLa0(cs[2], cs[0], La[0]);
	
	_and2 forLb1_0(cs[1],cs0_inv, Lb1_0);
	_or2 forLb1(cs2_inv, Lb1_0, Lb[1]);
	
	_or2 forLb0(cs2_inv, cs[0], Lb[0]); //use gates to get output
	

endmodule 