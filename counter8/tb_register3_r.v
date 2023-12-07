`timescale 1ns/100ps

module tb_register3_r;
	
	reg tb_clk, tb_reset_n;
	reg [2:0] tb_d;
	wire [2:0] tb_q; //set reg and wire
	
	_register3_r test_register3(.clk(tb_clk), .reset_n(tb_reset_n), .d(tb_d), .q(tb_q)); //run module
	
	always #5
	begin
		tb_clk = ~tb_clk;
	end //set clk period
	
	initial
	begin
		#0;tb_reset_n=0; tb_d=3'b000; tb_clk=0;
		#3;tb_reset_n=1;
		#10; tb_d=3'b101;
		#10; tb_d=3'b111;
		#10; tb_d=3'b010;
		#10; tb_reset_n=0;
		#20; $finish;
	end //end test
		
	
endmodule

