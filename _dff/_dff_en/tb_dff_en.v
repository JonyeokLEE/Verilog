`timescale 1ns/100ps
module tb_dff_en;
	reg tb_clk;
	reg tb_d;
	reg tb_en;
	wire tb_q; //set wire and reg
	
	_dff_en test_dff_en( .clk(tb_clk), .en(tb_en), .d(tb_d), .q(tb_q)); //run module
	
	always #5
	begin
		tb_clk = ~tb_clk;
	end //set clk period
	
	initial
	begin
		#0; tb_clk = 0; tb_d = 0; tb_en = 1;
		#7; tb_d = 1;
		#10; tb_d = 0;
		#12; tb_d = 1;
		#10; tb_en=0;
		#10; tb_d=0;
		#20; $stop;
	end//stop test
endmodule
