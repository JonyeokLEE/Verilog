module tb_cla128;
	reg [127:0] tb_a, tb_b;    // 128-bit input a and b
   reg tb_ci;            // Carry input
   wire [127:0] tb_s;     // 128-bit output s
   wire tb_co;  //set wire and reg
	
	cla128 test_cla128(.a(tb_a),.b(tb_b),.ci(tb_ci),.s(tb_s),.co(tb_co)); //run module
	
	initial
	begin //start test
		#0;tb_a=128'd37 ;tb_b=128'd1283827; tb_ci=1'b0;
		#10;tb_a=128'hffffffffffffffffffffffffffffffff ;tb_b=128'd1 ;tb_ci=1'b0;
		#10;tb_b=128'hffffffffffffffffffffffffffffffff ;tb_a=128'd1 ;tb_ci=1'b0;
		#10;tb_a=128'hffffffffffffffffffff11111111111f ;tb_b=128'd327 ;tb_ci=1'b1;
		#10;tb_b=128'hffffffffffffffffffffffffffffffff ;tb_a=128'd0 ;tb_ci=1'b1;
	end
endmodule
