`timescale 1ns/100ps

module tb_tl_cntr;
	reg tb_clk, tb_reset_n, tb_Ta, tb_Tb;
	wire [1:0]tb_La;
	wire [1:0]tb_Lb; //set reg and wire
	
	tl_cntr test_tl(.clk(tb_clk),.reset_n(tb_reset_n),.Ta(tb_Ta),.Tb(tb_Tb), .La(tb_La), .Lb(tb_Lb));
	//run module
	
	//00 -> GREEN, 01 -> YELLOW, 10 -> RED
	
	always #5
	begin
		tb_clk = ~tb_clk;
	end //set clk period
	
	initial
	begin
		#0; tb_clk=0;tb_reset_n=0; tb_Ta=1; tb_Tb=0;
		#3; tb_reset_n=1;
		#10; tb_Ta=0;
		#10; tb_Tb=1;
		#5; tb_Tb=0;
		#30; $finish;
	end //end test
		
endmodule
