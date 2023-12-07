`timescale 1ns/100ps

module tb_o_logic;
	
	reg [2:0]tb_cs;
	wire [1:0]tb_La, tb_Lb; //set reg and wire
	
	o_logic test_o_logic(.La(tb_La), .Lb(tb_Lb), .cs(tb_cs)); //run module
	
	initial
	begin
		#0; tb_cs=3'o0;
		#10; tb_cs=3'o1;
		#10; tb_cs=3'o2;
		#10; tb_cs=3'o3;
		#10; tb_cs=3'o4;
		#10; tb_cs=3'o5;
		#10; tb_cs=3'o6;
		#10; tb_cs=3'o7;
		#10; $end;
	end //test end
		
endmodule
