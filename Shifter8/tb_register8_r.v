`timescale 1ns/100ps

module tb_register8_r;
	
	reg tb_clk, tb_reset_n;
	reg [7:0] tb_d;
	wire [7:0] tb_q; //set reg and wire
	
	_register8_r test_register8(.clk(tb_clk), .reset_n(tb_reset_n), .d(tb_d), .q(tb_q)); //run module
	
	always #5
	begin
		tb_clk = ~tb_clk;
	end //set clk period
	
	initial
	begin
		#0;tb_reset_n=0; tb_d=8'b01010101; tb_clk=0;
		#3;tb_reset_n=1;
		#10; tb_d=8'b01010101;
		#10; tb_d=8'b01111111;
		#10; tb_d=8'b11101011;
		#10; tb_reset_n=0;
		#20; $finish;
	end //end test
		
	
endmodule

