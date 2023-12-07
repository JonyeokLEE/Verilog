`timescale 1ns/100ps

module tb_translate;
	reg[127:0] tb_before_result;
   reg[2:0] tb_now;
   reg[63:0] tb_multiplicand;
   reg[63:0] tb_multiplier;
   wire[127:0] tb_after_result; //set reg and wire
	
	translate test_translate(.before_result(tb_before_result), .now(tb_now), .multiplicand(tb_multiplicand),.multiplier(tb_multiplier),
	.after_result(tb_after_result));
	
	initial
	begin //start test
		#0; tb_before_result = 128'b0; tb_multiplicand = 64'h0000FFFF0000ABCD; tb_multiplier = 64'h123456789101ABCD;
			tb_now = tb_multiplier[2:0];
		#10; tb_before_result = tb_after_result; tb_now = tb_multiplier[4:2];
		#10; tb_before_result = tb_after_result; tb_now = tb_multiplier[6:4];
		#10; tb_before_result = tb_after_result; tb_now = tb_multiplier[8:6];
		#10; tb_before_result = tb_after_result; tb_now = tb_multiplier[10:8];
		#10; $stop;
	end //end test
	
	
endmodule
