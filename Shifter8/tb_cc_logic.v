`timescale 1ns/100ps

module tb_cc_logic;
	
	reg [2:0] tb_op;
	reg [1:0] tb_shamt;
	reg [7:0] tb_d_in;
	reg [7:0] tb_d_out;
	wire [7:0] tb_d_next; //set reg and wire
	
	cc_logic test_cc_logic(.op(tb_op), .shamt(tb_shamt), .d_in(tb_d_in), .d_out(tb_d_out), .d_next(tb_d_next)); //run module
	initial
	begin
		#0;tb_op=3'b000; tb_shamt=2'b01; tb_d_in=8'b10110101; tb_d_out=8'b11000111;
		#10; tb_op=3'b001;
		#10; tb_op=3'b010;
		#10; tb_op=3'b011;
		#10; tb_op=3'b100;
		#20; $finish;
	end //end test
		
	
endmodule

