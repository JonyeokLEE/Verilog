module ns_logic(Ta, Tal, Tb, Tbl, ns, cs);
	
	input Ta, Tb, Tal, Tbl;
	input [2:0]cs;
	output [2:0]ns; //set input and output
	
	wire cs2_inv, cs1_inv, cs0_inv, Ta_inv, Tb_inv, Tal_inv, Tbl_inv;
	wire d0_0,d0_1,d0_2,d0_3,d2_0,d2_1,d2_2; //set wire
	
	_inv inv0(.a(cs[0]), .y(cs0_inv));
	_inv inv1(.a(cs[1]), .y(cs1_inv));
	_inv inv2(.a(cs[2]), .y(cs2_inv));
	_inv inv3(.a(Ta), .y(Ta_inv));
	_inv inv4(.a(Tb), .y(Tb_inv));
	_inv inv5(.a(Tal), .y(Tal_inv));
	_inv inv6(.a(Tbl), .y(Tbl_inv));
	
	
	_and4 forD0_0(cs2_inv,cs1_inv,cs0_inv,Ta_inv,d0_0);
	_and4 forD0_1(cs2_inv,cs[1],cs0_inv,Tal_inv,d0_1);
	_and4 forD0_2(cs[2],cs1_inv,cs0_inv,Tb_inv,d0_2);
	_and4 forD0_3(cs[2],cs[1],cs0_inv,Tbl_inv,d0_3);
	_or4 forD0(d0_0, d0_1, d0_2, d0_3, ns[0]);
	
	_xor2 forD1(.a(cs[1]), .b(cs[0]), .y(ns[1]));
	
	_and3 forD2_0(cs2_inv, cs[1],cs[0],d2_0);
	_and2 forD2_1(cs[2], cs1_inv, d2_1);
	_and2 forD2_2(cs[2],cs0_inv,d2_2);
	_or3 forD2(d2_0, d2_1, d2_2, ns[2]); //use gates to get next states
	
	
	
endmodule
