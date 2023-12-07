`timescale 1ns/100ps

	module tb_cla32;
	reg [31:0] tb_a, tb_b;
	reg tb_ci; //set register
	wire [31:0] tb_s;
	wire tb_co;
	wire [32:0] tb_result; //set wire
	
	assign tb_result = {tb_co, tb_s};
	
	cla32 cla32_test (.a(tb_a), .b(tb_b), .ci(tb_ci), .s(tb_s), .co(tb_co)); //run Module
	
	initial
	begin
	#0; tb_a = 32'd0; tb_b = 32'd0; tb_ci = 1'b0;
		#10; tb_a = 32'd38297; tb_b = 32'd126625; tb_ci = 1'b0;
		#10; tb_a = 32'd376173; tb_b = 32'd421542; tb_ci = 1'b0;
		#10; tb_a = 32'd111; tb_b = 32'd6473; tb_ci = 1'b0;
		#10; tb_a = 32'd572; tb_b = 32'd33234; tb_ci = 1'b0;
		#10; tb_a = 32'd4294967295; tb_b = 32'd1; tb_ci = 1'b0; //overflow
		#10; tb_a = 32'd0; tb_b = 32'd4294967295; tb_ci = 1'b1; //overflow
		#10; tb_a = 32'd4322033212; tb_b = 32'd3232322323; tb_ci = 1'b1; //overflow
		#10; tb_a = 32'd100; tb_b = 32'd100; tb_ci = 1'b1;
		#10; tb_a = 32'd64763467736; tb_b = 32'd36487387; tb_ci = 1'b1;
		#10; tb_a = 32'd2147151326; tb_b = 32'd332321; tb_ci = 1'b0;

	#10; $finish;
	end
endmodule
