`timescale 1ns/100ps

module tb_ns_logic;
	
	reg tb_Ta, tb_Tb, tb_Tal, tb_Tbl;
	reg [2:0]tb_cs;
	wire [2:0]tb_ns; //set reg and wire
	
	ns_logic test_ns_logic(.Ta(tb_Ta), .Tal(tb_Tal),.Tb(tb_Tb), .Tbl(tb_Tbl), .ns(tb_ns), .cs(tb_cs)); //run module
	
	initial
	begin
		#0; tb_Ta=0; tb_Tal=1; tb_Tbl=1; tb_Tb=1; tb_cs=3'o0; //S0 - S1 - S2
		#20; tb_Ta=1; tb_Tal=0; tb_Tbl=1; tb_Tb=1; tb_cs=3'o2; //S2 - S3 - S4
		#20; tb_Ta=1; tb_Tal=1; tb_Tbl=1; tb_Tb=0; tb_cs=3'o4; //S4 - S5 - S6
		#20; tb_Ta=1; tb_Tal=1; tb_Tbl=0; tb_Tb=1; tb_cs=3'o6; //S6 - S7 - S0
		#20; $end;
	end //test end
		
endmodule
