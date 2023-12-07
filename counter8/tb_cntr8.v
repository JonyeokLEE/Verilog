`timescale 1ns/100ps

module tb_cntr8;
	reg tb_clk, tb_reset_n, tb_inc, tb_load;
	reg [7:0]tb_d_in; //set reg
	
	wire [7:0]tb_d_out;
	wire [2:0]tb_o_state; //set wire
	
	cntr8 test_cntr(.clk(tb_clk), .reset_n(tb_reset_n), .inc(tb_inc), .load(tb_load), .d_in(tb_d_in), .d_out(tb_d_out), .o_state(tb_o_state));
	//run module
	
	always #5
	begin
		tb_clk = ~tb_clk;
	end //set clk period

	initial
	begin
		#0; tb_clk=0; tb_reset_n=0; tb_inc=1; tb_load=0; tb_d_in=8'h0f;
		#3; tb_reset_n=1;
		#10; tb_load=1;
		#20; tb_load=0; tb_inc=1;
		#10; tb_inc=1;
		#10; tb_inc=0;
		#20; tb_reset_n = 0;
		#10; tb_load=1;
		#20; $finish;
	end //end test
	
endmodule
