`timescale 1ns/100ps

module tb_os_logic;
	reg [2:0] tb_state;
	reg [7:0] tb_d_in;
	wire [7:0] tb_d_out; //set input and output and reg
	
	os_logic test_os_logic(.state(tb_state), .d_in(tb_d_in), .d_out(tb_d_out));
	
	initial
	begin
		#0; tb_state=3'o0; tb_d_in=8'b00001111;
		#10; tb_state=3'o1;
		#10; tb_state=3'o2;
		#10; tb_state=3'o3;
		#10; tb_state=3'o4;
		#10; tb_state=3'o5;
		#10; $end;
	end
	
endmodule
