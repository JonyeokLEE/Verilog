`timescale 1ns/100ps

module tb_shifter8;
	
	reg tb_clk, tb_reset_n;
	reg [2:0] tb_op;
	reg [1:0] tb_shamt;
	reg [7:0] tb_d_in;
	wire [7:0] tb_d_out; //set reg and wire
	
	shifter8 test_shifter8(.clk(tb_clk), .reset_n(tb_reset_n), .op(tb_op), .shamt(tb_shamt), .d_in(tb_d_in), .d_out(tb_d_out));
	//run module
	
	always #5
	begin
		tb_clk = ~tb_clk;
	end //set clk period
	
	initial
	begin
		#0;tb_reset_n=0; tb_op=3'b000; tb_shamt=2'b01; tb_d_in=8'b10110101; tb_clk=0;
		#3;tb_reset_n=1;
		#10; tb_op=3'b001;
		#10; tb_op=3'b010;
		#10; tb_op=3'b011;
		#10; tb_op=3'b100;
		#10; tb_reset_n=0;
		#20; $finish;
	end //end test
		
	
endmodule

