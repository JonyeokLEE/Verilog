module tb_register32_8;
	reg tb_clk, tb_reset_n;
	reg [7:0]tb_en;
	reg [31:0]tb_d_in;
	wire [31:0] tb_d_out0, tb_d_out1, tb_d_out2, tb_d_out3, tb_d_out4, tb_d_out5, tb_d_out6, tb_d_out7;
	//set reg and wire
	
	register32_8 test_reg32_8(tb_clk, tb_reset_n, tb_en, tb_d_in, tb_d_out0, tb_d_out1, tb_d_out2, tb_d_out3
	, tb_d_out4, tb_d_out5, tb_d_out6, tb_d_out7); //run module
	
	always #5
	begin
		tb_clk=~tb_clk;
	end //set clk period
	
	initial
	begin
		#0;tb_clk=0; tb_reset_n=0; tb_en=8'o0; tb_d_in=31'h01010101;
		#3;tb_reset_n=1;
		#10;tb_en=8'o1;
		#10;tb_en=8'o2;
		#10;tb_en=8'o3;
		#10;tb_en=8'o4;
		#10;tb_en=8'o5;
		#10;tb_en=8'o6;
		#10;tb_en=8'o7;
		#10;tb_reset_n=1;
		#20; $finish; //finish test
	end
	
endmodule
