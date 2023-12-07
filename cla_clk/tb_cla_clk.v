`timescale 1ns/100ps

module tb_cla_clk;
	reg clk;
	reg [31:0] tb_a, tb_b;
	reg tb_ci; //set register
	
	wire [31:0] tb_s_cla;
	wire tb_co_cla; //set wire
	
	cla_clk test_cla_clk(.clk(clk), .a(tb_a), .b(tb_b), .ci(tb_ci), .s(tb_s_cla), .co(tb_co_cla)); //run cla_clk

	always #5 
	begin
		clk = ~clk;
	end //clock period 5ns


	initial
	begin
		#0; clk = 1'b1; tb_a = 32'd0; tb_b = 32'd0; tb_ci = 1'b0;
		#8; tb_a = 32'd38297; tb_b = 32'd126625; tb_ci = 1'b0;
		#10; tb_a = 32'd376173; tb_b = 32'd421542; tb_ci = 1'b0;
		#10; tb_a = 32'd111; tb_b = 32'd6473; tb_ci = 1'b0;
		#10; tb_a = 32'd572; tb_b = 32'd33234; tb_ci = 1'b0;
		#10; tb_a = 32'd4294967295; tb_b = 32'd1; tb_ci = 1'b0; //overflow
		#10; tb_a = 32'd0; tb_b = 32'd4294967295; tb_ci = 1'b1; //overflow
		#10; tb_a = 32'd1; tb_b = 32'd4294967294; tb_ci = 1'b1; //overflow
		#10; tb_a = 32'd4322033212; tb_b = 32'd3232322323; tb_ci = 1'b1;
		#10; tb_a = 32'd100; tb_b = 32'd100; tb_ci = 1'b1;
		#10; tb_a = 32'd64763467736; tb_b = 32'd36487387; tb_ci = 1'b1;
		#10; tb_a = 32'd2147151326; tb_b = 32'd332321; tb_ci = 1'b0;
		#20; $stop;
	end
endmodule
