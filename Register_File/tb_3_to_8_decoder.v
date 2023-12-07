module tb_3_to_8_decoder;
	reg [2:0] tb_d;
	wire [7:0] tb_q; //set input and output and reg
	
	_3_to_8_decoder test_3_to_8_decoder(.d(tb_d), .q(tb_q));
	
	initial
	begin
		#0 tb_d=3'o0;
		#10 tb_d=3'o1;
		#10 tb_d=3'o2;
		#10 tb_d=3'o3;
		#10 tb_d=3'o4;
		#10 tb_d=3'o5;
		#10 tb_d=3'o6;
		#10 tb_d=3'o7;
		#10; $finish;
	end //end test
	
	
endmodule
