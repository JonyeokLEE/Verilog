`timescale 1ns/100ps

module tb_o_logic;
	
	reg [1:0]tb_cs;
	wire [1:0]tb_La, tb_Lb; //set reg and wire
	
	o_logic test_o_logic(.La(tb_La), .Lb(tb_Lb), .cs(tb_cs)); //run module
	
	initial
	begin
		#0; tb_cs=2'b00;
		#10; tb_cs=2'b01;
		#10; tb_cs=2'b10;
		#10; tb_cs=2'b11;
		#10; $end;
	end //test end
		
endmodule
