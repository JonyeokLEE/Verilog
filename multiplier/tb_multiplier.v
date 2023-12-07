`timescale 1ns/100ps

module tb_multiplier;
	reg tb_clk, tb_reset_n, tb_op_start, tb_op_clear;
	reg[63:0] tb_multiplier;
	reg[63:0] tb_multiplicand;
	wire tb_op_done;
	wire [127:0] tb_result; //set reg and wire
	
	multiplier test_booth(.clk(tb_clk), .reset_n(tb_reset_n), .multiplier(tb_multiplier), .multiplicand(tb_multiplicand), 
	.op_start(tb_op_start), .op_clear(tb_op_clear), .op_done(tb_op_done), .result(tb_result)); //test module
	
	always
	begin //set clk period
      #5; tb_clk = ~tb_clk;
   end
	
	initial
	begin //start test
		#0; tb_clk = 0; tb_reset_n = 0; tb_multiplicand = 64'd5; tb_multiplier = 64'd192; tb_op_start=0; tb_op_clear=1;
		#3; tb_reset_n = 1;tb_op_start=1; tb_op_clear=0;
		#700; tb_op_clear=1; tb_op_start=0;
		#30; tb_multiplicand = 64'd1; tb_multiplier = 64'hF000000000000000; tb_op_clear=0; tb_op_start=1;
		#100; tb_op_start = 0; tb_op_clear=1;
		#100;tb_op_start=1; tb_op_clear=0;
		#700; tb_op_clear=1; tb_op_start=0;
		#30; tb_multiplicand = 64'd10; tb_multiplier = 64'd2; tb_op_clear=0; tb_op_start=1;
		#700; tb_op_clear=1; tb_op_start=0;
		#30; tb_multiplicand = 64'd372362; tb_multiplier = 64'd675755634; tb_op_clear=0; tb_op_start=1;
		#700; tb_op_clear=1; tb_op_start=0;
		#30; tb_multiplicand = 64'd9; tb_multiplier = 64'd32; tb_op_clear=0; tb_op_start=1;
		#700; tb_op_clear=1; tb_op_start=0;
		#30; tb_multiplicand = 64'd32; tb_multiplier = 64'd9; tb_op_clear=0; tb_op_start=1;
		#700; tb_op_clear=1; tb_op_start=0;
		#30; tb_multiplicand = 64'hF000FFFF88881111; tb_multiplier = 64'd4; tb_op_clear=0; tb_op_start=1;
		#100; tb_op_start = 0; tb_op_clear=1;
		#100;tb_op_start=1; tb_op_clear=0;
		#100; tb_op_start = 0; tb_op_clear=1;
		#100;tb_op_start=1; tb_op_clear=0;
		#700; tb_op_clear=1; tb_op_start=0;
		#30; tb_multiplicand = 64'd4; tb_multiplier = 64'hF000FFFF88881111; tb_op_clear=0; tb_op_start=1;
		#700; tb_op_clear=1; tb_op_start=0;
		#30; tb_multiplicand = 64'hA000000000000000; tb_multiplier = 64'hFFFFFFFFFFFFFFFF; tb_op_clear=0; tb_op_start=1;
		#700; tb_op_clear=1; tb_op_start=0;
		#10; $stop;
	end //finish test
	
endmodule
