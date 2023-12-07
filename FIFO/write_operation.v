module write_operation(Addr, we, wEn);

	input we;
	input [2:0] Addr;
	output [7:0] wEn; //set input and output
	
	wire [7:0] w_a; //set wire
	
	_3_to_8_decoder decoder3_8(.d(Addr), .q(w_a));
	_and2 AND0(.a(w_a[0]), .b(we), .y(wEn[0]));
	_and2 AND1(.a(w_a[1]), .b(we), .y(wEn[1]));
	_and2 AND2(.a(w_a[2]), .b(we), .y(wEn[2]));
	_and2 AND3(.a(w_a[3]), .b(we), .y(wEn[3]));
	_and2 AND4(.a(w_a[4]), .b(we), .y(wEn[4]));
	_and2 AND5(.a(w_a[5]), .b(we), .y(wEn[5]));
	_and2 AND6(.a(w_a[6]), .b(we), .y(wEn[6]));
	_and2 AND7(.a(w_a[7]), .b(we), .y(wEn[7])); //connect decoder and each and2
	
endmodule
