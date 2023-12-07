`timescale 1ns/100ps

module tb_mx4;

	reg tb_d0, tb_d1, tb_d2, tb_d3;
	reg [1:0]tb_s;
	wire tb_y; //set reg and wire
	
	mx4 test_mx4(.d0(tb_d0), .d1(tb_d1), .d2(tb_d2), .d3(tb_d3), .s(tb_s), .y(tb_y)); //run module
	
	initial
	begin
		#0; tb_s=2'b00; tb_d0=1; tb_d1=0; tb_d2=0; tb_d3=0;
		#10; tb_s=2'b01; tb_d0=0; tb_d1=1; tb_d2=0; tb_d3=0;
		#10; tb_s=2'b10; tb_d0=0; tb_d1=0; tb_d2=1; tb_d3=0;
		#10; tb_s=2'b11; tb_d0=0; tb_d1=0; tb_d2=0; tb_d3=1;
		#10; $end;
	end //end test
	

endmodule
