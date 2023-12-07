`timescale 1ns/100ps

module tb_ns_logic;
	
	reg tb_Ta, tb_Tb;
	reg [1:0]tb_cs;
	wire [1:0]tb_ns; //set reg and wire
	
	ns_logic test_ns_logic(.Ta(tb_Ta), .Tb(tb_Tb), .ns(tb_ns), .cs(tb_cs)); //run module
	
	initial
	begin
		#0; tb_Ta=1; tb_Tb=1; tb_cs=2'b00;
		#10; tb_Ta=0; tb_Tb=1; tb_cs=2'b00;
		#10; tb_Ta=1; tb_Tb=1; tb_cs=2'b01;
		#10; tb_Ta=1; tb_Tb=1; tb_cs=2'b10;
		#10; tb_Ta=1; tb_Tb=0; tb_cs=2'b10;
		#10; tb_Ta=1; tb_Tb=0; tb_cs=2'b11;
		#10; $end;
	end //test end
		
endmodule
