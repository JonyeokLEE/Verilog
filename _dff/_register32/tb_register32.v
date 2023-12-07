`timescale 1ns/100ps //set timesclae

module tb_register32;
	reg tb_clk;
	reg [31:0]tb_d;
	wire [31:0]tb_q; //set reg and wire
	
	_register32 test_reg32( .clk(tb_clk), .d(tb_d), .q(tb_q)); //run module
	
	always #5
	begin
		tb_clk = ~tb_clk;
	end //set clk period
	
	initial
	begin
		#0; tb_clk = 1'b0; tb_d = 0;
		#7; tb_d = 32'h321a289b;
		#10; tb_d = 32'hd1982735;
		#12; tb_d = 32'h18494487;
		#20; $stop;
	end //end test
endmodule
