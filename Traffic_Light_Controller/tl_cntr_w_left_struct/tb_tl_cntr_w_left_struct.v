`timescale 1ns/100ps

module tb_tl_cntr_w_left_struct;
	reg tb_clk, tb_reset_n, tb_Ta, tb_Tb, tb_Tal, tb_Tbl;
	wire [1:0]tb_La;
	wire [1:0]tb_Lb; //set wire and reg
	
	tl_cntr_w_left_struct test_tl(.clk(tb_clk),.reset_n(tb_reset_n),.Ta(tb_Ta), .Tal(tb_Tal), .Tb(tb_Tb),.Tbl(tb_Tbl), .La(tb_La), .Lb(tb_Lb));
	//run module
	
	
	always #5
	begin
		tb_clk = ~tb_clk;
	end //set clk period
	
	initial
	begin
		#0; tb_clk=0;tb_reset_n=0; tb_Ta=1; tb_Tb=1; tb_Tal=1; tb_Tbl=1; //S0
		#3; tb_reset_n=1; 
		#10; tb_Ta=0; //S0 -> S1 -> S2
		#15; tb_Tal=0; //S2 -> S3 -> S4
		#15; tb_Tb=0; //S4 -> S5 -> S6
		#15; tb_Tbl=0; //S6 -> S7 -> S0
		#20; tb_Ta=0; //S0 -> S1 -> S2
		#20; tb_reset_n = 0; //Back to S0
		#20; $finish;
	end //end test
		
endmodule
