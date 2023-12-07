`timescale 1ns/100ps

module tb_ns_logic;
	reg tb_load, tb_inc;
	reg [2:0] tb_state;
	wire [2:0] tb_next_state; //set wire and reg
	
	ns_logic test_ns_logic(.load(tb_load), .inc(tb_inc), .state(tb_state), .next_state(tb_next_state));
	//run module
	
	initial
	begin
		#0; tb_load=0; tb_inc=0; tb_state= 3'o0;
		#10; tb_load=1; tb_inc=0; tb_state= tb_next_state;
		#10; tb_load=0; tb_inc=0; tb_state= tb_next_state;
		#10; tb_load=0; tb_inc=0; tb_state= tb_next_state;
		#10; tb_load=1; tb_inc=1; tb_state= tb_next_state;
		#10; tb_load=0; tb_inc=1; tb_state= tb_next_state;
		#10; tb_load=0; tb_inc=1; tb_state= tb_next_state;
		#10; tb_load=0; tb_inc=1; tb_state= tb_next_state;
		#10; $finish;
	end
	
	
	
	
endmodule
